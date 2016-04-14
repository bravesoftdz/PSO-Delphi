unit Particle;

interface

uses
  Forms, Classes, SysUtils,
  //user created units
  Problem, Definitions;

type
  TParticle = class
  private
    //Information specific to the individual particle
    posD      : TDArray;
    posI      : TIArray;
    velocity  : TDArray;
    fitness   : double;

    //information retained over time
    gDBestPos : TDArray;  //best position obtained thus far, global best
    gIBestPos : TIArray;
    lDBestPos : TDArray;  //local best, either index based or position based - closeness
    lIBestPos : TIArray;

    //information stored about fitness values
    myFS : TFitSpeed;
    //information stored about various coefficients - mom, pb, lb, gb
    pCfg : TPartConfig;

    //information retained inbetween generations
    //best position found thus far by the particle
    pDBestPos : TDArray;
    PIBestPos : TIArray;

    pbestFitness  : double;


    //updates particle position by adding the velocity vector to the position
    procedure UpdatePosition();

    procedure UpdateGPVelocity();
    procedure UpdateGLVelocity();
    procedure UpdatePLVelocity();

  protected

  public
    //constructor initialises the size of the relative arrays according to the dimensions of the problem
    constructor Create(dim: integer; dType: integer);

    //initialises the particle as having a random position and velocity bounded by given parameters
    procedure Init(partCfg: TPartConfig);

    //moves the particle, updates the postion and then the velocity
    procedure MoveParticle(vType: integer); //vType selects the update velocity type

    //////////////GET FUNCTIONS/////////////////
    //returns the current fitness of the particle
    function GetFitness(): double;
    //returns the array of the current position of the particle
    function GetPDArray(): TDArray;
    function GetPIArray(): TIArray;
    //Returns the personal best position
    function GetPDBestArray(): TDArray;
    function GetPIBestArray(): TIArray;
    //return the velocity array
    function GetVArray(): TDArray;
    //return the average speed of the particle (average of abs(v))
    function GetSpeed(): double;
    //return the specific position at a given dimension
    function GetPDDim(d: integer): double;
    function GetPIDim(d: integer): integer;
    //return the specific velocity at a given dimension
    function GetVDim(d: integer): double;
    //return the specific Personal Best position at a given dimension
    function GetPBDDim(d: integer): double;
    function GetPBIDim(d: integer): integer;
    //return the specific Local Best position at a given dimension
    function GetLBDDim(i: integer): double;
    function GetLBIDim(i: integer): integer;
    //returns the personal best fitness
    function GetPBestFitness(): double;

    //returns the list of the stored fitness/speed values along indices
    function GetFSRecord(): TFitSpeed;

    ////////////////SET FUNCTIONS////////////////////
    //sets the global best position NOT the associated fitness as it has no need of it
    procedure SetGDBest(gBestPos: TDArray);
    procedure SetGIBest(gBestPos: TIArray);
    //sets the local best position NOT the associated fitness as it has no need of it
    procedure SetLDBest(lBestPos: TDArray);
    procedure SetLIBest(lBestPos: TIArray);
    //////////Various particle property set functions/////////
    //sets the constants in the particle, curently only mom, gB, pB, LB
    procedure SetGB(theGB: double);
    procedure SetMom(theMom: double);
    procedure SetPB(thePB: double);
    procedure SetLB(theLB: double);

    procedure Jiggle(val : double);
end;

implementation

{ TParticle }

constructor TParticle.Create(dim: integer; dType : integer);
begin
  pCfg.dim := dim;
  pCfg.dType := dType;
  setLength(velocity, pCfg.dim + 1);
  case pCfg.dType of
    INT : begin
      setLength(posI, pCfg.dim + 1);
      setLength(pIBestPos, pCfg.dim + 1);
      setLength(gIBestPos, pCfg.dim + 1);
      setLength(lIBestPos, pCfg.dim + 1);
    end;
    REAL : begin
      setLength(posD, pCfg.dim + 1);
      setLength(pDBestPos, pCfg.dim + 1);
      setLength(gDBestPos, pCfg.dim + 1);
      setLength(lDBestPos, pCfg.dim + 1);
    end;
  end;
end;

procedure TParticle.Init(partCfg : TPartConfig);
var i: integer;
begin
  /////////////// THIS OVERWRITES THE DOMAIN TYPE AND DIMENSIONS //////////////
  ////////////////// BE AWARE OF THIS /////////////////////////////////////////
  pCfg := partCfg;
  setLength(myFS.fA, pCfg.fL);
  setLength(myFS.sA, pCfg.sL);

  myFS.fI := 0;
  myFS.sI := 0;

  case pCfg.dType of
    INT: begin
       for i:= 0 to pCfg.dim do begin
        //define interval, random number in this range plus offset
        posI[i] := Round(pCfg.pMin + (pCfg.pMax-pCfg.pMin) * Random);
        velocity[i] := pCfg.vMin + (pCfg.vMax-pCfg.vMin) * Random;
        //set the personal/local/global best to be the current particle
        pIBestPos[i] := posI[i];
        lIBestPos[i] := 0;
        gIBestPos[i] := 0;
      end;
      fitness := Evaluate(posI);
    end;
    REAL : begin
      for i:= 0 to pCfg.dim do begin
        //define interval, random number in this range plus offset
        posD[i] := pCfg.pMin + (pCfg.pMax-pCfg.pMin) * Random;
        velocity[i] := pCfg.vMin + (pCfg.vMax-pCfg.vMin) * Random;
        //set the personal/local/global best to be the current particle
        pDBestPos[i] := posD[i];
        lDBestPos[i] := 0;
        gDBestPos[i] := 0;
      end;
      fitness := Evaluate(posD);
    end;
  end;

  pBestFitness := fitness;
  myFS.fA[myFS.fI] := fitness;
  myFS.sA[myFS.sI] := GetSpeed();

end;

procedure TParticle.MoveParticle(vType: integer);
var i : integer;
begin
  UpdatePosition();
  case pCfg.dType of
    INT  : fitness := Evaluate(posI);
    REAL : fitness := Evaluate(posD);
  end;
  if(fitness < pBestFitness) then begin
    pBestFitness := fitness;
    case pCfg.dType of
      INT  : for i := 0 to pCfg.dim do pIBestPos[i] := posI[i];
      REAL : for i := 0 to pCfg.dim do pDBestPos[i] := posD[i];
    end;
  end;
  case vType of
    GBPB: UpdateGPVelocity();
    GBLBCP: UpdateGLVelocity();
    GBLBPP: UpdateGLVelocity();
    PBLBCP: UpdatePLVelocity();
    PBLBPP: UpdatePLVelocity();
  end;


  inc(myFS.fI);
  inc(myFS.sI);
  if(myFS.fI = length(myFS.fA)) then myFS.fI := 0; //loop to start
  if(myFS.sI = length(myFS.sA)) then myFS.sI := 0;

  myFS.fA[myFS.fI] := fitness;
  myFS.sA[myFS.sI] := GetSpeed();

end;

procedure TParticle.UpdatePosition;
var i: integer;
begin
  case pCfg.dType of
    INT : begin
      for i := 0 to pCfg.dim do
        posI[i] := Round(posI[i] + velocity[i]);
    end;
    REAL : begin
      for i := 0 to pCfg.dim do
        posD[i] := posD[i] + velocity[i];
    end;
  end;
end;

procedure TParticle.UpdateGPVelocity;
var i : integer;
begin
  case pCfg.dType of
    INT : begin
      for i:= 0 to pCfg.dim do
        velocity[i] :=  pCfg.mom*velocity[i]+(1-pCfg.mom)*
                      (Random*pCfg.gB*(gIBestPos[i] - posI[i])+
                       Random*pCfg.pB*(pIBestPos[i] - posI[i]));
    end;
    REAL : begin
      for i:= 0 to pCfg.dim do
        velocity[i] :=  pCfg.mom*velocity[i]+(1-pCfg.mom)*
                      (Random*pCfg.gB*(gDBestPos[i] - posD[i])+
                       Random*pCfg.pB*(pDBestPos[i] - posD[i]));
    end;
  end;
end;

procedure TParticle.UpdateGLVelocity;
var i : integer;
begin
  case pCfg.dType of
    INT : begin
      for i:= 0 to pCfg.dim do
        velocity[i] :=  pCfg.mom*velocity[i]+(1-pCfg.mom)*
                    (Random*pCfg.gB*(gIBestPos[i] - posI[i])+
                     Random*pCfg.lB*(lIBestPos[i] - posI[i]));
    end;
    REAL : begin
      for i:= 0 to pCfg.dim do
        velocity[i] :=  pCfg.mom*velocity[i]+(1-pCfg.mom)*
                    (Random*pCfg.gB*(gDBestPos[i] - posD[i])+
                     Random*pCfg.lB*(lDBestPos[i] - posD[i]));
    end;
  end;
end;

procedure TParticle.UpdatePLVelocity;
var i: integer;
begin
  case pCfg.dType of
    INT : begin
      for i:= 0 to pCfg.dim do
        velocity[i] :=  pCfg.mom*velocity[i]+(1-pCfg.mom)*
                    (Random*pCfg.lB*(lIBestPos[i] - posI[i])+
                     Random*pCfg.pB*(pIBestPos[i] - posI[i]));
    end;
    REAL : begin
      for i:= 0 to pCfg.dim do
        velocity[i] :=  pCfg.mom*velocity[i]+(1-pCfg.mom)*
                    (Random*pCfg.lB*(lDBestPos[i] - posD[i])+
                     Random*pCfg.pB*(pDBestPos[i] - posD[i]));
    end;
  end;
end;


function TParticle.GetFitness: double;
begin
  result := fitness;
end;

function TParticle.GetPDArray: TDArray;
begin
//returns a pointer to the position array
  result := posD;
end;

function TParticle.GetPIArray: TIArray;
begin
//returns a pointer to the position array
  result := posI;
end;


function TParticle.GetVArray: TDArray;
begin
  result := velocity;
end;

function TParticle.GetPDBestArray: TDArray;
begin
  result := pDBestPos;
end;

function TParticle.GetPIBestArray: TIArray;
begin
  result := pIBestPos;
end;

function TParticle.GetPBestFitness: double;
begin
  result := pBestFitness;
end;

procedure TParticle.SetGDBest(gBestPos: TDArray);
var i: integer;
begin
  for i := 0 to pCfg.dim do
    gDBestPos[i] := gBestPos[i];
end;

procedure TParticle.SetGIBest(gBestPos: TIArray);
var i: integer;
begin
  for i := 0 to pCfg.dim do
    gIBestPos[i] := gBestPos[i];
end;


procedure TParticle.SetLDBest(lBestPos: TDArray);
var i: integer;
begin
  for i := 0 to pCfg.dim do
    lDBestPos[i] := lBestPos[i];
end;

procedure TParticle.SetLIBest(lBestPos: TIArray);
var i: integer;
begin
  for i := 0 to pCfg.dim do
    lIBestPos[i] := lBestPos[i];
end;


function TParticle.GetPDDim(d: integer): double;
begin
  result := posD[d];
end;

function TParticle.GetPIDim(d: integer): integer;
begin
  result := posI[d];
end;

procedure TParticle.SetMom(theMom: double);
begin
  pCfg.mom := theMom;
end;

procedure TParticle.SetGB(theGB: double);
begin
  pCfg.gB := theGB;
end;

procedure TParticle.SetLB(theLB: double);
begin
  pCfg.lB := theLB;
end;

procedure TParticle.SetPB(thePB: double);
begin
  pCfg.PB := thePB;
end;

function TParticle.GetPBDDim(d: integer): double;
begin
  result := pDBestPos[d];
end;

function TParticle.GetPBIDim(d: integer): integer;
begin
  result := pIBestPos[d];
end;

function TParticle.GetVDim(d: integer): double;
begin
  result := velocity[d];
end;

function TParticle.GetSpeed(): double;
var i: integer;
begin
  result := 0.0;
  for i := 0 to pCfg.dim do
    result := result + Sqr(velocity[i]);

  result := Sqrt(result);
end;

function TParticle.GetFSRecord: TFitSpeed;
begin
  result := myFS;
end;

function TParticle.GetLBDDim(i: integer): double;
begin
  result := lDBestPos[i];
end;

function TParticle.GetLBIDim(i: integer): integer;
begin
  result := lIBestPos[i];
end;

procedure TParticle.Jiggle(val: double);
var i: integer;
  temp : double;
begin
  for i:= 0 to pCfg.dim do begin
    temp := ((random * 2) - 1) * val;
    velocity[i] := temp;
  end;
end;


end.
