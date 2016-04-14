unit Definitions;
//only contains constants that are viewed across units
//no global variables, too much hassle
interface

Const
  //id for unique problems, can add as time goes on
  ORI  = 0;
  ORIF = 1;
  RAST = 2;
  SCHW = 3;

  //id for domain types, can add as time goes on
  INT   = 0;
  REAL  = 1;

  //id for PSOCtrl pages, can add or delete depending on order
  //could shift to the required unit
  PARAMVIEW   = 0;
  SWARMVIEW   = 1;
  PROGVIEW    = 2;
  FITVIEW     = 3;
  PARTVIEW    = 4;
  BATCHVIEW   = 5;

  //id for RunCtrl pages
  SINGLERUN   = 0;
  BATCHRUN    = 1;

  //id for Velocity Update types
  GBPB = 0;   //global best and personal best
  GBLBCP = 1; //global best and local best - current position
  GBLBPP = 2; //global best and local best - personal best position
  PBLBCP = 3; //personal best and local best - current position
  PBLBPP = 4; //personal best and local best - personal best position

  //id for Local Best velocity update type
  LBCLOSE = 0; //closest, i.e. the best out of the closest particles (Euclidean)
  LBINDEX = 1; //index, i.e. best out of particles next in array
  LBRADIUS = 2; //all particles have an effect, effect is filtered by distance //ignore for now

  //Constants involving the size of the swarm points
  BUBBLEMAX   = 0.20; //i.e. 20 percent of size

  //constants involving fitness held
  FITLENGTH = 100; //fitness values are held for this total
  SPEEDLENGTH = 100; //average speed values are held for this total

type
  TDArray = array of double;

type
  TIArray = array of integer;

type
  T2DArray = array of TDArray;

type
  TDistIndex = record
    dist : double;
    index : integer;
  end;

type
  TPartConfig = record
    mom, gB, pB, lB: double;
    fL, sL : integer;  //fitness length, speed length to be held in memory
    pMin, pMax, vMin, vMax : double;
    dType, dim: integer;     //domain type - INT, REAL
  end;

type
  TProbConfig = record
    pType, dType, dim: integer;
    //problem type - ORI, ORIF, RAST, SCHW
    //domain type - INT, REAL
  end;

type
  TSwarmConfig = record
    vType, lType, dType, pN, dim : integer;
    lValues : TDistIndex;
    //velocity update type - GBPBLB
    //local best type - ClOSE, INDEX, RADIUS
    //domain type - INT, REAL
    //pN - population number
    //lValues - distance if using CLOSE, index size if using INDEX
    //domain type - INT, REAL
  end;

type
  TFitSpeed = record
    fA : TDArray;   //fitness array
    sA: TDArray;    //speed array
    fI: cardinal;    //fitness index - current position in array
    sI : cardinal;   //speed index - current position in array
  end;

implementation

end.
