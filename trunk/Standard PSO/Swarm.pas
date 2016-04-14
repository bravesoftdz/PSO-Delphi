unit Swarm;

interface

uses
  Forms, Classes, SysUtils, Contnrs, Math,
  //user created units
  Problem, Definitions, Particle;

type
  TSwarm = class
  private
    sCfg : TSwarmConfig;
    pL: TObjectList;
    gBestPosD : TDArray;
    gBestPosI: TIArray;
    cBestIndex : integer;
    gBestFit : double;
    cBestFit : double;
    
    function FillDistanceTable() : T2DArray;
    procedure UpdateGBFitness();
    procedure UpdateLBFitnessIndex();
    procedure UpdateLBFitnessClose();
    procedure UpdateLBFitnessRadius();
    procedure EvaluateSwarm();
    procedure UpdateFitnesses();
  protected

  public
    //constructor initialises the size of the relative arrays according to the dimensions of the problem
    constructor Create();
    procedure AllocateSwarm(swarmCfg: TSwarmConfig);
    procedure InitSwarm(pCfg : TPartConfig);
    function GetBestFit(): double;
    function GetBestFitIndex(): integer;
    function GetIndexFit(index: integer): double;
    function GetIndexPBFit(index: integer): double;
    function GetVDim(index, dim: integer): double;
    function GetPBIDim(index, dim: integer): integer;
    function GetPBDDim(index, dim : integer): double;
    function GetLBIDim(index, dim: integer): integer;
    function GetLBDDim(index, dim : integer): double;
    function GetPIDim(index, dim: integer): integer;
    function GetPDDim(index, dim : integer): double;
    procedure Jiggle(val: double);
    procedure SingleIteration();
    function GetFSRecord(index: integer): TFitSpeed;
    function GetAvSpeed(): double;
    function GetAvFit(): double;
    function GetAvPFit(): double;
    function GetGDBestPos(): TDArray;
    function GetGIBestPos(): TIArray;

    procedure SetMom(mom: double);
    procedure SetPBest(pBest: double);
    procedure SetGBest(gBest: double);
    procedure SetLBest(lBest: double);

end;

implementation

{ TParticle }

procedure TSwarm.AllocateSwarm(swarmCfg: TSwarmConfig);
var i: integer;
begin
  sCfg := swarmCfg;
  if ((sCfg.pN+1) <> pL.Count) then begin
    if(pL.Count > 0) then
      pL.Clear();
    for i := 0 to sCfg.pN do pL.Add(TParticle.Create(sCfg.dim, sCfg.dType));
  end;

  case sCfg.dType of
    INT : setLength(gBestPosI, sCfg.dim+1);
    REAL : setLength(gBestPosD, sCfg.dim+1);
  end;
  //initialise the particles giving the starting max and min values
  //also set various constants
end;

constructor TSwarm.Create();
begin
  pL := TObjectList.Create(True);
end;

function TSwarm.FillDistanceTable: T2DArray;
var i,j,k: integer;
  distTable :T2DArray;
begin
  setLength(distTable,sCfg.pN+1);
  for i := 0 to sCfg.pN do
    setLength(distTable[i],sCfg.pN+1);

  for i := 0 to sCfg.pN do begin //every particle
    for j := i+1 to sCfg.pN do begin //the remaining particles in the list
    //get the distance for each dimension
      for k:= 0 to sCfg.dim do begin
        case sCfg.dType of
          INT : begin
            distTable[i][j] := distTable[i][j]+
              power(TParticle(pL.Items[i]).GetPIDim(k) - TParticle(pL.Items[j]).GetPIDim(k), 2);
          end;
          REAL : begin
            distTable[i][j] := distTable[i][j]+
              power(TParticle(pL.Items[i]).GetPDDim(k) - TParticle(pL.Items[j]).GetPDDim(k), 2);
          end;
        end;
      end;
      distTable[i][j] := Sqrt(distTable[i][j]);
      distTable[j][i] := distTable[i][j];
    end;
  end;
  result := distTable;
end;

function TSwarm.GetBestFit: double;
begin
  result := gBestFit;
end;

function TSwarm.GetBestFitIndex: integer;
begin
  result := cBestIndex;
end;

procedure TSwarm.InitSwarm(pCfg: TPartConfig);
var i: integer;
begin
  cBestFit := MAXINT;
  gBestFit := MAXINT;
  for i := 0 to sCfg.pN do begin
    TParticle(pL.Items[i]).Init(pCfg);
  end;
  EvaluateSwarm();
  UpdateFitnesses();
end;

procedure TSwarm.Jiggle(val: double);
var i : integer;
begin
  for i := 0 to sCfg.pN do
    TParticle(pL.Items[i]).Jiggle(val);
end;

procedure TSwarm.SingleIteration;
var i: integer;
begin
  for i := 0 to sCfg.pN do
    TParticle(pL.Items[i]).MoveParticle(sCfg.vType);

  EvaluateSwarm();
  UpdateFitnesses();
  //update the stored fitness (global or local) values if need be
  //saves on time if we don't update all the fitness values

end;

procedure TSwarm.EvaluateSwarm;
var i, gIndex : integer;
  theFit : double;
  posI: TIArray;
  posD: TDArray;
begin
  gIndex := -1;
  theFit := MAXINT;
  for i := 0 to sCfg.pN do begin
    if(TParticle(pL.Items[i]).GetFitness < gBestFit) then begin
      gBestFit := TParticle(pL.Items[i]).GetFitness;
      gIndex := i;
    end;
    if(TParticle(pL.Items[i]).GetFitness < theFit) then begin
      theFit := TParticle(pL.Items[i]).GetFitness;
      cBestIndex := i;
    end;

  end;
  if(gIndex <> -1) then begin //found a particle with a better fitness than global Best
    case sCfg.dType of
      INT: begin
        setLength(posI, sCfg.dim+1);
        posI := TParticle(pL.Items[gIndex]).GetPIArray;
        for i := 0 to sCfg.dim do
          gBestPosI[i] := posI[i];
      end;
      REAL: begin
        setLength(posD, sCfg.dim+1);
        posD := TParticle(pL.Items[gIndex]).GetPDArray;
        for i := 0 to sCfg.dim do
          gBestPosD[i] := posD[i];
      end;
    end;
  end;



end;

procedure TSwarm.UpdateGBFitness;
var i : integer;
begin
  case sCfg.dType of
    INT : begin
      for i:= 0 to sCfg.pN do
        TParticle(pL.Items[i]).SetGIBest(gBestPosI);
    end;
    REAL : begin
      for i:= 0 to sCfg.pN do
        TParticle(pL.Items[i]).SetGDBest(gBestPosD);
    end;
  end;

end;

procedure TSwarm.UpdateLBFitnessClose;
var i, j, k, tempI, theIndex: integer;
  distArray : T2DArray;
  posD : TDArray;
  posI : TIArray;
  cList : array of TDistIndex;
  tempD, theFit: double;
begin
  distArray := FillDistanceTable();
  setLength(cList,sCfg.pN+1);
  for i := 0 to sCfg.pN do begin //sort through each particle in turn
    for j := 0 to sCfg.pN do begin   //set up the close list array
      cList[j].dist := distArray[i][j];
      cList[j].index := j;
    end;
    //sort the list to get N closest
    for j := 0 to sCfg.lValues.index -1 do begin
      for k := sCfg.pN-1 downto j do if clist[k].dist > clist[k+1].dist then begin
        tempD := cList[k].dist;
        tempI := cList[k].index ;
        cList[k].dist     := cList[k+1].dist ;
        cList[k].index    := cList[k+1].index ;
        cList[k+1].dist   := tempD ;
        cList[k+1].index  := tempI ;
      end;
    end;
    //find the best performing particle out of the closest particles, ignoring the first particle as it is itself
    theIndex := -1;  //set the index values to default
    theFit := MAXINT; //fitness set to an arbitrary high value
    for j := 1 to sCfg.lValues.index do begin
      if((sCfg.vType = GBLBCP) or (sCfg.vType = PBLBCP)) then begin
        if(TParticle(pL.Items[cList[j].index]).GetFitness < theFit) then begin
          theFit := TParticle(pL.Items[cList[j].index]).GetFitness();
          theIndex := cList[j].index;
        end;
      end
      else if((sCfg.vType = GBLBPP) or (sCfg.vType = PBLBPP)) then begin
         if(TParticle(pL.Items[cList[j].index]).GetPBestFitness < theFit) then begin
          theFit := TParticle(pL.Items[cList[j].index]).GetPBestFitness();
          theIndex := cList[j].index;
        end;
      end;
    end;

    case sCfg.dType of
      INT : begin
        setLength(posI, sCfg.dim+1);
        //the local best index has been obtained, update the current particle i's local best
        if ((sCfg.vType = GBLBCP) or (sCfg.vType = PBLBCP)) then      //get current position
          posI := TParticle(pL.Items[theIndex]).GetPIArray
        else if ((sCfg.vType = GBLBPP) or (sCfg.vType = PBLBPP)) then //get personal best position
          posI := TParticle(pL.Items[theIndex]).GetPIBestArray;

        TParticle(pL.Items[i]).SetLIBest(PosI);
      end;
      REAL : begin
        setLength(posD, sCfg.dim+1);
        //the local best index has been obtained, update the current particle i's local best
        if ((sCfg.vType = GBLBCP) or (sCfg.vType = PBLBCP)) then      //get current position
          posD := TParticle(pL.Items[theIndex]).GetPDArray
        else if ((sCfg.vType = GBLBPP) or (sCfg.vType = PBLBPP)) then //get personal best position
          posD := TParticle(pL.Items[theIndex]).GetPDBestArray;

        TParticle(pL.Items[i]).SetLDBest(PosD);
      end;
    end;
  end;//end particle loop, start for next particle

end;

procedure TSwarm.UpdateLBFitnessIndex;
var  i, j, k, theIndex : integer;
  theFit : double;
  posD : TDArray;
  posI : TIArray;
begin
  case sCfg.dType of
    INT :   setLength(posI,sCfg.dim+1);
    REAL :  setLength(posD,sCfg.dim+1);
  end;

  for i := 0 to sCfg.pN do begin
  {find best performed of the adjacent N, exclude oneself}
    theFit := MAXINT; //set the default fitness to be maximum
    theIndex := -1 ;
    for j := 1 to sCfg.lValues.index do begin
      k := i + j ;
      if k > sCfg.pN then k := k - sCfg.pN;
      if ((sCfg.vType = GBLBCP) or (sCfg.vType = PBLBCP)) then begin   //using current particle positions
        if (TParticle(pL.Items[k]).GetFitness() < theFit) then begin
          theIndex := k;
          theFit := TParticle(pL.Items[k]).GetFitness();
        end;
      end
      else if ((sCfg.vType = GBLBPP) or (sCfg.vType = PBLBPP)) then begin //using personal best
        if (TParticle(pL.Items[k]).GetPBestFitness() < theFit) then begin
          theIndex := k;
          theFit := TParticle(pL.Items[k]).GetPBestFitness();
        end;
      end;
    end;

    //the local best index has been obtained, update the current particle i's local best
    case sCfg.dType of
      INT : begin
        if ((sCfg.vType = GBLBCP) or (sCfg.vType = PBLBCP)) then      //get current position
          posI := TParticle(pL.Items[theIndex]).GetPIArray
        else if ((sCfg.vType = GBLBPP) or (sCfg.vType = PBLBPP)) then //get personal best position
          posI := TParticle(pL.Items[theIndex]).GetPIBestArray;

        TParticle(pL.Items[i]).SetLIBest(posI);
      end;
      REAL : begin
        if ((sCfg.vType = GBLBCP) or (sCfg.vType = PBLBCP)) then      //get current position
          posD := TParticle(pL.Items[theIndex]).GetPDArray
        else if ((sCfg.vType = GBLBPP) or (sCfg.vType = PBLBPP)) then //get personal best position
          posD := TParticle(pL.Items[theIndex]).GetPDBestArray;

        TParticle(pL.Items[i]).SetLDBest(posD);
      end;
    end;
  end;

end;

procedure TSwarm.UpdateLBFitnessRadius;
var i,j,k: integer;
  lBest, weight, theDist, myPDist, myPBDist: double;
  posD : TDArray;
  posI : TIArray;
begin
  case sCfg.dType of
    INT   : setLength(posI,sCfg.dim+1);
    REAL  : setLength(posD,sCfg.dim+1);
  end;

  for i := 0 to sCfg.pN do begin //find local best for each particle

    for j := 0 to sCfg.dim do begin //need to get the contributions in each dimension
      //set the local best initial position to be the current particle position
      case sCfg.dType of
        INT : begin
          lBest   := TParticle(pL.Items[i]).GetPIDim(j);
          myPDist := TParticle(pL.Items[i]).GetPIDim(j);
          myPBDist:= TParticle(pL.Items[i]).GetPBIDim(j);
        end;
        REAL : begin
          lBest   := TParticle(pL.Items[i]).GetPDDim(j);
          myPDist := TParticle(pL.Items[i]).GetPDDim(j);
          myPBDist:= TParticle(pL.Items[i]).GetPBDDim(j);
        end;
      end;

      for k := 0 to sCfg.pN do begin //need to get distance for each particle
        if(i<>k) then begin //not dealing with the same particle
        ////////////////TWO OPTIONS, PERSONAL BEST POSITION OR CURRENT POSITION

          if ((sCfg.vType = GBLBCP) or (sCfg.vType = PBLBCP)) then begin   //using current particle positions
          //get the relative distance from the particle
            case sCfg.dType of
              INT   : theDist := TParticle(pL.Items[k]).GetPIDim(j) - myPDist;
              REAL  : theDist := TParticle(pL.Items[k]).GetPDDim(j) - myPDist;
            end;
            if(abs(theDist) > sCfg.lValues.dist) then begin//particle is more than X (in this dimension) from the particle
              weight := 1/(abs(theDist)*(1+TParticle(pL.Items[k]).GetFitness));
              lBest := lBest + weight * theDist;
            end;
          end
          else if ((sCfg.vType = GBLBPP) or (sCfg.vType = PBLBPP)) then begin //using personal best
            //get the relative distance from the particle
            case sCfg.dType of
              INT   : theDist := TParticle(pL.Items[k]).GetPBIDim(j) - myPBDist;
              REAL  : theDist := TParticle(pL.Items[k]).GetPBDDim(j) - myPBDist;
            end;

            if(abs(theDist) > sCfg.lValues.dist) then begin//particle is more than X (in this dimension) from the particle
              weight := 1/(abs(theDist)*(1+TParticle(pL.Items[k]).GetFitness));
              lBest := lBest + weight * theDist;
            end;
          end;
        end;

      end; //got all particle distances in that dimension
      case sCfg.dType of
        INT   : posI[j] := Round(lBest);
        REAL  : posD[j] := lBest;
      end;

    end;  //finished that particle

    case sCfg.dType of
      INT   : TParticle(pL.Items[i]).SetLIBest(posI);
      REAL  : TParticle(pL.Items[i]).SetLDBest(posD);
    end;
  end;
end;

procedure TSwarm.UpdateFitnesses();
begin
  case sCfg.vType of
    GBPB: UpdateGBFitness();
    GBLBCP: UpdateGBFitness();
    GBLBPP: UpdateGBFitness();
  end;

  if sCfg.vType <> GBPB then begin
    case sCfg.lType of
      LBCLOSE: UpdateLBFitnessClose();
      LBINDEX: UpdateLBFitnessIndex();
      LBRADIUS: UpdateLBFitnessRadius();
    end;
  end;
end;

function TSwarm.GetFSRecord(index: integer): TFitSpeed;
begin
  result := TParticle(pL.Items[index]).GetFSRecord;
end;

function TSwarm.GetPDDim(index, dim: integer): double;
begin
  result := TParticle(pL.Items[index]).GetPDDim(dim);
end;

function TSwarm.GetPIDim(index, dim : integer): integer;
begin
  result := TParticle(pL.Items[index]).GetPIDim(dim);
end;

function TSwarm.GetIndexFit(index: integer): double;
begin
  result := TParticle(pL.Items[index]).GetFitness;
end;

function TSwarm.GetIndexPBFit(index: integer): double;
begin
  result := TParticle(pL.Items[index]).GetPBestFitness;
end;

function TSwarm.GetLBDDim(index, dim: integer): double;
begin
  result := TParticle(pL.Items[index]).GetLBDDim(dim);
end;

function TSwarm.GetLBIDim(index, dim: integer): integer;
begin
  result := TParticle(pL.Items[index]).GetLBIDim(dim);
end;

function TSwarm.GetPBDDim(index, dim: integer): double;
begin
  result := TParticle(pL.Items[index]).GetPBDDim(dim);
end;

function TSwarm.GetPBIDim(index, dim: integer): integer;
begin
  result := TParticle(pL.Items[index]).GetPBIDim(dim);
end;

function TSwarm.GetVDim(index, dim: integer): double;
begin
  result := TParticle(pL.Items[index]).GetVDim(dim);
end;

function TSwarm.GetAvFit: double;
var i: integer;
begin
  result := 0;
  for i:= 0 to sCfg.pN do
    result := result + TParticle(pL.Items[i]).GetFitness;
  result := result / (sCfg.pN+1);
end;

function TSwarm.GetAvPFit: double;
var i : integer;
begin
  result := 0;
  for i:= 0 to sCfg.pN do
    result := result + TParticle(pL.Items[i]).GetPBestFitness;
  result := result / (sCfg.pN+1);
end;

function TSwarm.GetAvSpeed: double;
var i: integer;
begin
  result := 0;
  for i:= 0 to sCfg.pN do
    result := result + TParticle(pL.Items[i]).GetSpeed;
  result := result / (sCfg.pN+1);
end;

function TSwarm.GetGDBestPos: TDArray;
var i : integer;
begin
  setLength(result, sCfg.dim+1);
  for i:= 0 to sCfg.dim do
    result[i] := gBestPosD[i];
end;

function TSwarm.GetGIBestPos: TIArray;
var i : integer;
begin
  setLength(result, sCfg.dim+1);
  for i:= 0 to sCfg.dim do
    result[i] := gBestPosI[i];
end;

procedure TSwarm.SetGBest(gBest: double);
var i : integer;
begin
  if sCfg.pN <> 0 then
    for i := 0 to sCfg.pN do TParticle(pL.Items[i]).SetGB(gBest);
end;

procedure TSwarm.SetLBest(lBest: double);
var i : integer;
begin
  if sCfg.pN <> 0 then
    for i := 0 to sCfg.pN do TParticle(pL.Items[i]).SetLB(lBest);
end;

procedure TSwarm.SetMom(mom: double);
var i: integer;
begin
  if sCfg.pN <> 0 then
    for i := 0 to sCfg.pN do TParticle(pL.Items[i]).SetMom(mom);
end;

procedure TSwarm.SetPBest(pBest: double);
var i : integer;
begin
  if sCfg.pN <> 0 then
    for i := 0 to sCfg.pN do TParticle(pL.Items[i]).SetPB(pBest);
end;

end.
