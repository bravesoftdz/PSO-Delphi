unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ComCtrls, Grids, Menus, ExtCtrls, TeeProcs, Math {Power},
  TeEngine, Chart, Contnrs {TObjectList}, ESBPCSPanel, ESBPCSSpinEdit, Buttons,
  Series, BubbleCh,
  //user units
  Particle, ProbForm, Definitions, Problem, Swarm;


type
  TPSOForm = class(TForm)
    PSOMen: TMainMenu;
    FMenu: TMenuItem;
    AMenu: TMenuItem;
    PSOCtrl: TPageControl;
    SwarmPage: TTabSheet;
    ProgressPage: TTabSheet;
    FitnessPage: TTabSheet;
    ParticlePage: TTabSheet;
    RunCtrl: TPageControl;
    SinglePage: TTabSheet;
    BatchSetPage: TTabSheet;
    ExitMenu: TMenuItem;
    ParamPage: TTabSheet;
    SwarmChart: TChart;
    PartParamBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    BestFitGrid: TStringGrid;
    Label5: TLabel;
    BestFitLbl: TLabel;
    SVPartSizeBar: TTrackBar;
    SVPlotSwarmBox: TCheckBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    AvFitChart: TChart;
    Label11: TLabel;
    PartGrid: TStringGrid;
    PartPosGrid: TStringGrid;
    IndivFitChart: TChart;
    InitSwarmBtn: TButton;
    OneIterBtn: TButton;
    NIterBtn: TButton;
    IterStpBtn: TButton;
    Label12: TLabel;
    IterGrp: TGroupBox;
    IterLbl: TLabel;
    Label13: TLabel;
    ThresBtn: TButton;
    Label14: TLabel;
    FitImg: TImage;
    PlotFitBtn: TButton;
    InitStartBox: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    GroupBox4: TGroupBox;
    Label19: TLabel;
    GroupBox5: TGroupBox;
    BIterBox: TCheckBox;
    BThresBox: TCheckBox;
    GroupBox6: TGroupBox;
    BSaveEdit: TEdit;
    Label20: TLabel;
    BRunBtn: TButton;
    BStopBtn: TBitBtn;
    BProgBar: TProgressBar;
    Label22: TLabel;
    BProgLbl: TLabel;
    MomEdit: TESBFloatSpinEdit;
    PBestEdit: TESBFloatSpinEdit;
    GBestEdit: TESBFloatSpinEdit;
    PMinEdit: TESBFloatSpinEdit;
    VMinEdit: TESBFloatSpinEdit;
    PMaxEdit: TESBFloatSpinEdit;
    VMaxEdit: TESBFloatSpinEdit;
    BRunEdit: TESBPosSpinEdit;
    BIterEdit: TESBPosSpinEdit;
    SVYEdit: TESBPosSpinEdit;
    SVXEdit: TESBPosSpinEdit;
    PartNumViewEdit: TESBPosSpinEdit;
    GroupBox7: TGroupBox;
    EvalBtn: TButton;
    EvalFitGrid: TStringGrid;
    FitEvalLbl: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    FVYEdit: TESBPosSpinEdit;
    FVXEdit: TESBPosSpinEdit;
    SSwarm: TBubbleSeries;
    NIterEdit: TESBPosSpinEdit;
    IterStpEdit: TESBPosSpinEdit;
    ThresEdit: TESBFloatSpinEdit;
    BatchViewPage: TTabSheet;
    BFitChart: TChart;
    BRunChart: TChart;
    PlotBatch: TCheckBox;
    SBatFit: TFastLineSeries;
    SBatRun: TFastLineSeries;
    SIndivFit: TFastLineSeries;
    NormalTimer: TTimer;
    BestFitChart: TChart;
    SBestFit: TFastLineSeries;
    SSwarmFit: TFastLineSeries;
    IndivSpeedChart: TChart;
    SIndivSpeed: TFastLineSeries;
    GroupBox8: TGroupBox;
    FitLenEdit: TESBPosSpinEdit;
    SpeedLenEdit: TESBPosSpinEdit;
    Label25: TLabel;
    Label26: TLabel;
    BThresEdit: TESBFloatSpinEdit;
    BChangeBox: TCheckBox;
    BChangeEdit: TESBPosSpinEdit;
    GroupBox9: TGroupBox;
    ChangeLbl: TLabel;
    ChangeBtn: TButton;
    ChangeEdit: TESBPosSpinEdit;
    Label21: TLabel;
    LbestGrpBox: TGroupBox;
    LBNumEdit: TESBPosSpinEdit;
    Label28: TLabel;
    LBTypeRadGrp: TRadioGroup;
    VelUpRadGrp: TRadioGroup;
    LBestEdit: TESBFloatSpinEdit;
    Label27: TLabel;
    StopFlagBtn: TBitBtn;
    BestFitLbl2: TLabel;
    ProbLbl: TLabel;
    Label29: TLabel;
    LBDistEdit: TESBFloatSpinEdit;
    Label30: TLabel;
    Label31: TLabel;
    GroupBox10: TGroupBox;
    JigBtn: TButton;
    JigEdit: TESBFloatSpinEdit;
    SSwarmPBFit: TFastLineSeries;
    AvSpeedChart: TChart;
    SSwarmSpeed: TFastLineSeries;
    procedure FMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InitSwarmBtnClick(Sender: TObject);
    procedure EvalBtnClick(Sender: TObject);
    procedure SVPartSizeBarChange(Sender: TObject);
    procedure OneIterBtnClick(Sender: TObject);
    procedure MomEditChange(Sender: TObject);
    procedure PBestEditChange(Sender: TObject);
    procedure GBestEditChange(Sender: TObject);
    procedure PSOCtrlChange(Sender: TObject);
    procedure PartNumViewEditChange(Sender: TObject);
    procedure SVYEditChange(Sender: TObject);
    procedure SVXEditChange(Sender: TObject);
    procedure NIterBtnClick(Sender: TObject);
    procedure IterStpBtnClick(Sender: TObject);
    procedure ThresBtnClick(Sender: TObject);
    procedure NormalTimerTimer(Sender: TObject);
    procedure BRunBtnClick(Sender: TObject);
    procedure BIterBoxClick(Sender: TObject);
    procedure BThresBoxClick(Sender: TObject);
    procedure BChangeBoxClick(Sender: TObject);
    procedure ChangeBtnClick(Sender: TObject);
    procedure RunCtrlChange(Sender: TObject);
    procedure BStopBtnClick(Sender: TObject);
    procedure LBestEditChange(Sender: TObject);
    procedure VelUpRadGrpClick(Sender: TObject);
    procedure LBTypeRadGrpClick(Sender: TObject);
    procedure StopFlagBtnClick(Sender: TObject);
    procedure JigBtnClick(Sender: TObject);
  private
     gBestFitness: double; //the current global best fitness
     maxPSize: double;
     iter: cardinal;
     changeIter: cardinal;
     stopFlag : boolean;
     probCfg: TProbConfig;
     pop : integer;
     pSize: double;
     theSwarm : TSwarm;


    { Private declarations }

    procedure InitSwarm();
    procedure InitForm();

    procedure SingleIteration();

    procedure UpdateForm();
    procedure UpdateProgressView();
    procedure UpdateParticleView();
    procedure UpdateSwarmView();
    procedure UpdateFitnessView();
    procedure UpdateLocalBox();
    procedure UpdateBatchView();

    procedure SetSize();
    function GetPartCfg(): TPartConfig;
    function GetSwarmCfg(): TSwarmConfig;
  public
    { Public declarations }
  end;

var
  PSOForm: TPSOForm;


implementation

{$R *.dfm}

procedure TPSOForm.FormCreate(Sender: TObject);
begin
  probCfg.pType := ORI;      //setting pdefault problem and dimensions
  probCfg.dim := 99;
  probCfg.dType := REAL;
  gBestFitness := MAXINT;
  iterLbl.Visible := false;
  stopFlag := false;
  theSwarm := TSwarm.Create;

  //set page- initially make the batch viewer invisible
  PSOCtrl.ActivePageIndex := PARAMVIEW;
  RunCtrl.ActivePageIndex := SINGLERUN;

  BatchViewPage.TabVisible  := false;
  SwarmPage.TabVisible      := false;
  FitnessPage.TabVisible    := false;
  ParticlePage.TabVisible   := false;
  ProgressPage.TabVisible   := false;

  pop := 0;
  RandSeed := 100;

  PartGrid.Cells[0,0] := 'Fitness';
  PartGrid.Cells[0,1] := 'P Best';

  PartPosGrid.Cells[0,0] := 'Dim';
  PartPosGrid.Cells[0,1] := 'Position';
  PartPosGrid.Cells[0,2] := 'Velocity';
  PartPosGrid.Cells[0,3] := 'P Best Fit';
  PartPosGrid.Cells[0,4] := 'L Best Fit';

  BestFitGrid.Cells[0,0] := 'Dim';
  BestFitGrid.Cells[1,0] := 'Value';

  EvalFitGrid.Cells[0,0] := 'Dim';
  EvalFitGrid.Cells[1,0] := 'Value';

end;

procedure TPSOForm.InitSwarm();
begin
  iter := 0;
  changeIter := 0;
  gBestFitness := MAXINT;
  theSwarm.AllocateSwarm(GetSwarmCfg());
  theSwarm.InitSwarm(GetPartCfg());
end;

procedure TPSOForm.InitForm;
var centre : double;
  i: integer;
begin
  IterLbl.Visible := true;
  InitSwarmBtn.Enabled := true;
  BRunBtn.Enabled := true;

  FitnessPage.TabVisible  := true;
  SwarmPage.TabVisible    := true;
  ParticlePage.TabVisible := true;
  ProgressPage.TabVisible := true;

  //set the lengths of the various stringgrids and the maxes of the spinboxes
  //SINGLE/BATCH RUN VIEWER
  if(probCfg.pType = SCHW) then begin
    ThresEdit.Value := GetProbBest() * probCfg.dim;
   BThresEdit.Value := GetProbBest() * probCfg.dim;
  end
  else begin
    ThresEdit.Value := GetProbBest();
    BThresEdit.Value := GetProbBest();
  end;
  //PARAMETERVIEWER
  PMinEdit.Min := GetProbMin();
  PMinEdit.Max := GetProbMax();
  PMaxEdit.Min := GetProbMin();
  PMaxEdit.Max := GetProbMax();
  
  //place initial starting positions at half from the centre of the problem in all dimensions
  centre :=(GetProbMax() - GetProbMin())/2  + GetProbMin();
  PMinEdit.Value := centre - (GetProbMax() - GetProbMin())/4;
  PMaxEdit.Value := centre + (GetProbMax() - GetProbMin())/4;
      //starting value for
  VMinEdit.Value := -(GetProbMax() - GetProbMin())/10;
  VMaxEdit.Value := (GetProbMax() - GetProbMin())/10;
      //SWARMVIEWER
  SVYEdit.Max := probCfg.dim;
  SVXEdit.Max := probCfg.dim;

      //set the defaults of the graph
  with SwarmChart.LeftAxis do begin
    Automatic := False;
	  Minimum := GetProbMin();
	  Maximum := GetProbMax();
  end;
  with SwarmChart.BottomAxis do begin
    Automatic := False;
    Minimum := GetProbMin();
	  Maximum := GetProbMax();
  end;
  maxPSize := (GetProbMax() - GetProbMin()) * BUBBLEMAX;
  SetSize();
      //PROGRESSVIEWER
  BestFitGrid.RowCount := probCfg.dim + 2;
  for i := 0 to probCfg.dim do begin
    BestFitGrid.Cells[0,i+1] := IntToStr(i+1);
    BestFitGrid.Cells[1,i+1] := '';
  end;
      //FITNESSVIEWER
  EvalFitGrid.RowCount := probCfg.dim + 2;
  FVYEdit.Max := probCfg.dim;
  FVXEdit.Max := probCfg.dim;
  for i := 0 to probCfg.dim do begin
    EvalFitGrid.Cells[0,i+1] := IntToStr(i+1);
    EvalFitGrid.Cells[1,i+1] := '0';
  end;
      //PARTICLEVIEWER
  PartGrid.Cells[1,0] := '';
  PartGrid.Cells[1,1] := '';
  PartNumViewEdit.Max := pop;
  PartPosGrid.ColCount := probCfg.dim + 2;
  for i := 0 to probCfg.dim do begin
    PartPosGrid.Cells[i+1,0] := IntToStr(i+1);
    PartPosGrid.Cells[i+1,1] := '';
    PartPosGrid.Cells[i+1,2] := '';
    PartPosGrid.Cells[i+1,3] := '';
  end;
  PSOCtrl.Enabled := true;

end;

procedure TPSOForm.SingleIteration;
begin
  inc(iter);
  theSwarm.SingleIteration();

  if theSwarm.GetBestFit() < gBestFitness then begin
    gBestFitness := theSwarm.GetBestFit();
    changeIter := 0;
  end
  else
    inc(changeIter);
end;

procedure TPSOForm.UpdateForm;
begin
  case PSOCtrl.ActivePageIndex of
    SWARMVIEW:  UpdateSwarmView();
    PROGVIEW:   UpdateProgressView();
    FITVIEW:    UpdateFitnessView();
    PARTVIEW:   UpdateParticleView();
    BATCHVIEW:  UpdateBatchView();
  end;
  IterLbl.Caption := IntToStr(iter);
  ChangeLbl.Caption := IntToStr(changeIter);
  BestFitLbl2.Caption := 'Best Fitness: '+FloatToStrF(gBestFitness,ffExponent,4,2);
end;

procedure TPSOForm.UpdateSwarmView;
var i, xDim, yDim: integer;
  x,y: double;
begin
  with SSwarm do begin
    clear;
    xDim := SVXEdit.Value;
    yDim := SVYEdit.Value;

    case probCfg.dType of
      INT : begin
        for i:= 0 to pop do begin
          x := theSwarm.GetPIDim(i,xDim);
          y := theSwarm.GetPIDim(i,yDim);
          addbubble(x, y, pSize, '', clred);
        end;
      end;
      REAL : begin
        for i:= 0 to pop do begin
           x := theSwarm.GetPDDim(i,xDim);
          y := theSwarm.GetPDDim(i,yDim);
          addbubble(x, y, pSize, '', clred);
        end;
      end;
    end;

  end;
end;

procedure TPSOForm.UpdateParticleView;
var i, index: integer;
  curIndex : cardinal;
  myFS : TFitSpeed;
begin
  index := PartNumViewEdit.Value;
   myFS := theSwarm.GetFSRecord(index);
  //read out the values from the fitness and speed arrays
  //2 cases, one when the number of iterations is less than the possible stored values,
  //the other occurs after this point and previous values are overwritten
  SIndivFit.Clear;
  //first scenario - read out values up
  if(iter < length(myFS.fA)) then begin
    curIndex := 0;
    while(curIndex <> myFS.fI) do begin
      SIndivFit.AddY(myFS.fA[curIndex],'',clRed);
      inc(curIndex);
    end;
    SIndivFit.AddY(myFS.fA[curIndex],'',clRed);  //print out the last one
  end
  else begin
   curIndex := myFS.fI;
    repeat
      inc(curIndex);
      if(curIndex = length(myFS.fA)) then
        curIndex := 0;
      SIndivFit.AddY(myFS.fA[curIndex],'',clRed);
    until (curIndex = myFS.fI);
  end;

  SIndivSpeed.Clear;
  //first scenario - read out values up
  if(iter < length(myFS.sA)) then begin
    curIndex := 0;
    while(curIndex <> myFS.sI) do begin
      SIndivSpeed.AddY(myFS.sA[curIndex],'',clRed);
      inc(curIndex);
    end;
    SIndivSpeed.AddY(myFS.sA[curIndex],'',clRed); //print out the last one
  end
  else begin
   curIndex := myFS.sI;
    repeat
      inc(curIndex);
      if(curIndex = length(myFS.sA)) then curIndex := 0;
      SIndivSpeed.AddY(myFS.sA[curIndex],'',clRed);
    until (curIndex = myFS.sI);
  end;
  PartGrid.Cells[1,0] := FloatToStr(theSwarm.GetIndexFit(index));
  PartGrid.Cells[1,1] := FloatToStr(theSwarm.GetIndexPBFit(index));

  case probCfg.dType of
    INT : begin
      for i := 0 to probCfg.dim do begin
        PartPosGrid.Cells[i+1,1] := IntToStr(theSwarm.GetPBIDim(index,i));
        PartPosGrid.Cells[i+1,2] := FloatToStr(theSwarm.GetVDim(index,i));
        PartPosGrid.Cells[i+1,3] := IntToStr(theSwarm.GetPBIDim(index,i));
        PartPosGrid.Cells[i+1,4] := IntToStr(theSwarm.GetLBIDim(index,i));
      end;
    end;
    REAL : begin
      for i:= 0 to probCfg.dim do begin
        PartPosGrid.Cells[i+1,1] := FloatToStr(theSwarm.GetPBDDim(index,i));
        PartPosGrid.Cells[i+1,2] := FloatToStr(theSwarm.GetVDim(index,i));
        PartPosGrid.Cells[i+1,3] := FloatToStr(theSwarm.GetPBDDim(index,i));
        PartPosGrid.Cells[i+1,4] := FloatToStr(theSwarm.GetLBDDim(index,i));
      end;
    end;
  end;

end;

procedure TPSOForm.UpdateProgressView;
var i: integer;
 posD : TDArray;
 posI : TIArray;
begin
  BestFitLbl.Caption := FloatToStr(gBestFitness);
  BestFitLbl2.Caption := 'Best Fitness: '+FloatToStrF(gBestFitness,ffExponent,4,2);

  case probCfg.dType of
    INT : begin
      setLength(posI,probCfg.dim+1);
      posI := theSwarm.GetGIBestPos();
      for i := 0 to probCfg.dim do
        BestFitGrid.Cells[1,i+1] := IntToStr(posI[i]);
    end;
    REAL: begin
      setLength(posD,probCfg.dim+1);
      posD := theSwarm.GetGDBestPos();
      for i := 0 to probCfg.dim do
        BestFitGrid.Cells[1,i+1] := FloatToStr(posD[i]);
    end;
  end;
end;

procedure TPSOForm.UpdateFitnessView;
begin

end;

procedure TPSOForm.UpdateLocalBox;
begin
  if(LBTypeRadGrp.ItemIndex = LBRADIUS) then begin
    LBDistEdit.Enabled := true;
    Label29.Font.Style := [fsBold];
    Label31.Font.Style := [fsBold];
    LBNumEdit.Enabled := false;
    Label28.Font.Style := [];
    Label30.Font.Style := [];
  end
  else begin
    LBDistEdit.Enabled := false;
    Label29.Font.Style := [];
    Label31.Font.Style := [];
    LBNumEdit.Enabled := true;
    Label28.Font.Style := [fsBold];
    Label30.Font.Style := [fsBold];
  end;
end;

procedure TPSOForm.SetSize;
begin
  pSize := (SVPartSizeBar.Position/SVPartSizeBar.Max) * maxPSize;
end;

function TPSOForm.GetPartCfg: TPartConfig;
var pCfg: TPartConfig;
begin
  pCfg.mom := MomEdit.Value;
  pCfg.pB := PBestEdit.Value;
  pCfg.lB := LBestEdit.Value;
  pCfg.gB := GBestEdit.Value;
  pCfg.pMin := PMinEdit.Value;
  pCfg.pMax := PMaxEdit.Value;
  pCfg.vMin := VMinEdit.Value;
  pCfg.vMax := VMaxEdit.Value;
  pCfg.fL   := FitLenEdit.Value;
  pCfg.sL   := SpeedLenEdit.Value;
  pCfg.dType := probCfg.dType;
  pCfg.dim := probCfg.dim;
  result := pCfg;
end;

function TPSOForm.GetSwarmCfg: TSwarmConfig;
var sCfg: TSwarmConfig;
begin
  sCfg.vType := VelUpRadGrp.ItemIndex;
  sCfg.lType := LBTypeRadGrp.ItemIndex;
  sCfg.lValues.dist := LBDistEdit.Value;
  sCfg.lValues.index := LBNumEdit.Value;
  sCfg.pN := pop;
  sCfg.dim := probCfg.dim;
  sCfg.dType := probCfg.dType;
  result := sCfg;
end;

procedure TPSOForm.InitSwarmBtnClick(Sender: TObject);
var pCfg : TPartConfig;
  sCfg : TSwarmConfig;
begin
  pCfg := GetPartCfg();
  sCfg := GetSwarmCfg();

  SVPartSizeBar.Enabled := true;
  JigBtn.Enabled := true;
 // PartNumViewEdit.Max := pop;
  IterLbl.Caption := '0';

  SSwarmFit.Clear;
  SSwarmSpeed.Clear;
  SSwarmPBFit.Clear;
  SBestFit.Clear;

  InitSwarm();
  if theSwarm.GetBestFit() < gBestFitness then
    gBestFitness := theSwarm.GetBestFit();

  UpdateSwarmView();
  UpdateForm();


  NIterBtn.Enabled := true;
  OneIterBtn.Enabled := true;
  IterStpBtn.Enabled := true;
  ThresBtn.Enabled := true;
  ChangeBtn.Enabled := true;

  NIterEdit.Enabled := true;
  IterStpEdit.Enabled := true;
  ThresEdit.Enabled := true;
  ChangeEdit.Enabled := true;

  SVYEdit.Enabled := true;
  SVXEdit.Enabled := true;
  PartNumViewEdit.Enabled := true;
end;

procedure TPSOForm.EvalBtnClick(Sender: TObject);
var posI : TIArray;
    posD : TDArray;
    i: integer;
    fitness : double;
begin
  case probCfg.pType of
    INT: begin
      setLength(posI,probCfg.dim +1);
      for i:= 0 to probCfg.dim do begin
        posI[i] := StrToIntDef(EvalFitGrid.Cells[1,i+1],MAXINT);
        if(posI[i] = MAXINT) then begin
          MessageDlg( 'Sorry, '''+EvalFitGrid.Cells[1,i+1]+' is not a recognised number',mtWarning, [mbOK], 0);
          EvalFitGrid.Cells[1,i+1] := '0'; //reset to zero
          exit;
        end;
      end;
      fitness :=  evaluate(posI, INT);
      FitEvalLbl.Caption := 'Fitness = ' +floatToStr(fitness);
    end;

    REAL: begin
      setLength(posD,probCfg.dim +1);
      for i:= 0 to probCfg.dim do begin
        posD[i] := StrToFloatDef(EvalFitGrid.Cells[1,i+1],MAXINT);
        if(posD[i] = MAXINT) then begin
          MessageDlg( 'Sorry, '''+EvalFitGrid.Cells[1,i+1]+' is not a recognised number',mtWarning, [mbOK], 0);
          EvalFitGrid.Cells[i+1,i] := '0'; //reset to zero
          exit;
        end;
      end;
      fitness :=  evaluate(posD, REAL);
      FitEvalLbl.Caption := 'Fitness = ' +floatToStr(fitness);
    end;
  end;

end;

procedure TPSOForm.SVPartSizeBarChange(Sender: TObject);
begin
  SetSize();
  UpdateSwarmView();
end;

procedure TPSOForm.OneIterBtnClick(Sender: TObject);
begin
  SingleIteration();
  UpdateForm();
  IterLbl.Caption := IntToStr(iter);
  ChangeLbl.Caption := IntToStr(changeIter);
  SBestFit.AddY(gBestFitness,'',clRed);
  SSwarmFit.AddY(theSwarm.GetAvFit,'');
  SSwarmSpeed.AddY(theSwarm.GetAvSpeed,'');
  SSwarmPBFit.AddY(theSwarm.GetAvPFit,'');
  
end;

procedure TPSOForm.MomEditChange(Sender: TObject);
begin
  if(pop <> 0) then
    theSwarm.SetMom(MomEdit.Value);
end;

procedure TPSOForm.PBestEditChange(Sender: TObject);
begin
    theSwarm.SetPBest(PBestEdit.Value);
end;

procedure TPSOForm.GBestEditChange(Sender: TObject);
begin
  if(pop <> 0) then
    theSwarm.SetGBest(GBestEdit.Value);
end;

procedure TPSOForm.LBestEditChange(Sender: TObject);
begin
  if(pop <> 0) then
    theSwarm.SetLBest(LBestEdit.Value);
end;

procedure TPSOForm.PSOCtrlChange(Sender: TObject);
begin
  if(pop <> 0) then begin
    case PSOCtrl.ActivePageIndex of
      SWARMVIEW:  UpdateSwarmView();
      PROGVIEW:   UpdateProgressView();
      FITVIEW:    UpdateFitnessView();
      PARTVIEW:   UpdateParticleView();
    end;
  end;
end;

procedure TPSOForm.PartNumViewEditChange(Sender: TObject);
begin
  UpdateParticleView();
end;

procedure TPSOForm.SVYEditChange(Sender: TObject);
begin
  UpdateSwarmView();
end;

procedure TPSOForm.SVXEditChange(Sender: TObject);
begin
  UpdateSwarmView();
end;

procedure TPSOForm.NIterBtnClick(Sender: TObject);
var theIter, i: integer;
begin
  theIter := NIterEdit.Value;
  NormalTimer.Enabled := true;
  i := 0;
  stopFlag := false;
  StopFlagBtn.Visible := true;
  while ((i < theIter ) and (stopFlag = false)) do begin
    SingleIteration();
    Application.ProcessMessages();
    SBestFit.AddY(gBestFitness,'',clRed);
    SSwarmFit.AddY(theSwarm.GetAvFit,'');
    SSwarmSpeed.AddY(theSwarm.GetAvSpeed,'');
    SSwarmPBFit.AddY(theSwarm.GetAvPFit,'');
    inc(i);
  end;
  NormalTimer.Enabled := false;
  StopFlagBtn.Visible := false;
  UpdateForm();
end;

procedure TPSOForm.IterStpBtnClick(Sender: TObject);
var goTilNIter: cardinal;
begin
  goTilNIter := IterStpEdit.Value;
  NormalTimer.Enabled := true;
  stopFlag := false;
  StopFlagBtn.Visible := true;
  while((iter < goTilNIter) and(stopFlag = false)) do begin
    SingleIteration();
    application.ProcessMessages;
    SBestFit.AddY(gBestFitness,'',clRed);
    SSwarmFit.AddY(theSwarm.GetAvFit,'');
    SSwarmSpeed.AddY(theSwarm.GetAvSpeed,'');
    SSwarmPBFit.AddY(theSwarm.GetAvPFit,'');
  end;
  NormalTimer.Enabled := false;
  StopFlagBtn.Visible := false;
  UpdateForm();
end;

procedure TPSOForm.ThresBtnClick(Sender: TObject);
var threshold : double;
begin
  stopFlag := false;
  threshold := ThresEdit.Value;
  StopFlagBtn.Visible := true;
  NormalTimer.Enabled := true;
  while((gBestFitness > threshold) and (stopFlag = false)) do begin
    SingleIteration();
    application.ProcessMessages();
    SBestFit.AddY(gBestFitness,'',clRed);
    SSwarmFit.AddY(theSwarm.GetAvFit,'');
    SSwarmSpeed.AddY(theSwarm.GetAvSpeed,'');
    SSwarmPBFit.AddY(theSwarm.GetAvPFit,'');
  end;
  NormalTimer.Enabled := false;
  UpdateForm();
  StopFlagBtn.Visible := true;
end;

procedure TPSOForm.NormalTimerTimer(Sender: TObject);
begin
  UpdateForm();
  Application.ProcessMessages;
end;

procedure TPSOForm.BRunBtnClick(Sender: TObject);
var i, totalIter, theIter, theChange: integer;
  fileName : string;
  txt : TextFile;
  totalFit, theThres : double;
  thresFlag, iterFlag, changeFlag : boolean;
  pCfg : TPartConfig;
  sCfg : TSwarmConfig;
begin
  fileName := BSaveEdit.Text;
  if FileExists(fileName) then begin
    if (MessageDlg('File ' + FileName + ' exists. Overwrite?', mtConfirmation,
        [mbOk, mbCancel], 0) = mrCancel) then
        Exit;
  end;

  thresFlag := BThresBox.Checked;
  iterFlag := BIterBox.Checked;
  changeFlag := BChangeBox.Checked;

  if((thresFlag = True) or (iterFlag = true) or (changeFlag = true)) then begin
    //set up the buttons
    BRunBtn.Enabled := false;
    BStopBtn.Enabled := true;

    NormalTimer.Enabled := true;
    stopFlag := false;
    totalIter := 0;
    totalFit := 0.0;
    theThres := BThresEdit.Value;
    theIter := BIterEdit.Value;
    theChange := BChangeEdit.Value;
    pCfg := GetPartCfg();
    sCfg := GetSwarmCfg();
    PSOCtrl.ActivePageIndex := BATCHVIEW;

    AssignFile(txt, fileName);
    Rewrite(txt);
    WriteLn(txt,'PSO BATCH FILE TEST at time ' + DateToStr(Date));
    WriteLn(txt,'Problem = '+ GetProbName());
    WriteLn(txt,'Parameters: Mom - '+FloatToStrF(pCfg.mom, ffExponent,3,2)+
          ' pBest - '+FloatToStrF(pCfg.pB, ffExponent,3,2)+
          ' lBest - '+FloatToStrF(pCfg.lB, ffExponent,3,2)+
          ' gBest - '+FloatToStrF(pCfg.gB, ffExponent,3,2));
    WriteLn(txt,'Start Conditions: pMin - '+FloatToStrF(pCfg.pMin,ffExponent,3,2)+
          ' pMax - '+FloatToStrF(pCfg.pMax,ffExponent,3,2)+
          ' vMin - '+FloatToStrF(pCfg.vMin,ffExponent,3,2)+
          ' vMax - '+FloatToStrF(pCfg.vMax,ffExponent,3,2));
    WriteLn(txt,'Stop Conditions:'+
          ' Threshold '+BoolToStr(thresFlag, true)+' - '+FloatToStrF(theThres, ffExponent,3,2)+
          ' Iterations '+BoolToStr(iterFlag, true)+' - '+IntToStr(theIter)+
          ' Iter Change '+BoolToStr(changeFlag, true)+' - '+IntToStr(theChange));

    //set up the progress bar and charts

    BProgBar.Max := BRunEdit.Value;

    SBatFit.Clear;
    SBatRun.Clear;
    i:= 0;
    theSwarm.AllocateSwarm(GetSwarmCfg());
    while ((i < BRunEdit.Value) and (stopFlag = false)) do begin
      iter := 0;
      changeIter := 0;
      gBestFitness := MAXINT;
      theSwarm.InitSwarm(GetPartCfg());
      while((( thresFlag <> true) or (gBestFitness > theThres))
            and ((iterFlag <> true) or (iter < theIter))
            and ((changeFlag <> true) or (changeIter < theChange))) do begin

        singleIteration();
      end;
      inc(i);
      totalIter := iter + totalIter;
      totalFit := gBestFitness + totalFit;
      SBatFit.AddY(gBestFitness,'',clRed);
      SBatRun.AddY(Iter,'',clRed);
      BProgBar.Position := i;
      BProgLbl.Caption := IntToStr(i);
      application.ProcessMessages;
    end; //completed all the runs
    //pad with line and close file
    if stopFlag = true then
      WriteLn(txt, 'Batch Terminated at run '+IntToStr(i))
    else
      WriteLn(txt,'Batch Complete');

    WriteLn(txt, 'Average Iterations - '+FloatToStrF(TotalIter/ BRunEdit.Value,ffExponent,4,2));
    WriteLn(txt, 'Average Fitness - '+FloatToStrF(TotalFit/ BRunEdit.Value,ffExponent,4,2));
    WriteLn(txt,'');
    CloseFile(txt);
    BStopBtn.Enabled := false;
    NormalTimer.Enabled := false;
    BRunBtn.Enabled := true;
  end
  else
    ShowMessage('Sorry, at least one termination criterion must be selected');
end;

procedure TPSOForm.BIterBoxClick(Sender: TObject);
begin
  BIterEdit.Enabled := BIterBox.Checked;
end;

procedure TPSOForm.BThresBoxClick(Sender: TObject);
begin
  BThresEdit.Enabled := BThresBox.Checked;
end;

procedure TPSOForm.BChangeBoxClick(Sender: TObject);
begin
  BChangeEdit.Enabled := BChangeBox.Checked;
end;

procedure TPSOForm.ChangeBtnClick(Sender: TObject);
var theChange : cardinal;
begin
  theChange := ChangeEdit.Value;
  NormalTimer.Enabled := true;
  stopFlag := false;
  StopFlagBtn.Visible := true;
  while ((changeIter < theChange) and (stopFlag = false)) do begin
    SingleIteration();
    SBestFit.AddY(gBestFitness,'',clRed);
    SSwarmFit.AddY(theSwarm.GetAvFit,'');
    SSwarmSpeed.AddY(theSwarm.GetAvSpeed,'');
    SSwarmPBFit.AddY(theSwarm.GetAvPFit,'');
    application.ProcessMessages;
  end;
  NormalTimer.Enabled := false;
  StopFlagBtn.Visible := false;
  UpdateForm();
end;

procedure TPSOForm.RunCtrlChange(Sender: TObject);
begin
  BatchViewPage.TabVisible := RunCtrl.ActivePageIndex = BATCHRUN;
end;

procedure TPSOForm.BStopBtnClick(Sender: TObject);
begin
  stopFlag := true;
end;

procedure TPSOForm.VelUpRadGrpClick(Sender: TObject);
begin
  case VelUpRadGrp.ItemIndex of
    GBPB: begin
      GBestEdit.Enabled := true;
      PBestEdit.Enabled := true;
      LBestEdit.Enabled := false;
      LBNumEdit.Enabled := false;
      LBTypeRadGrp.Enabled := false;
    end;
    GBLBCP: begin
      GBestEdit.Enabled := true;
      PBestEdit.Enabled := false;
      LBestEdit.Enabled := true;
      LBNumEdit.Enabled := true;
      LBTypeRadGrp.Enabled := true;
      UpdateLocalBox();
    end;
    GBLBPP: begin
      GBestEdit.Enabled := true;
      PBestEdit.Enabled := false;
      LBestEdit.Enabled := true;
      LBNumEdit.Enabled := true;
      LBTypeRadGrp.Enabled := true;
      UpdateLocalBox();
    end;
    PBLBCP: begin
      GBestEdit.Enabled := false;
      PBestEdit.Enabled := true;
      LBestEdit.Enabled := true;
      LBNumEdit.Enabled := true;
      LBTypeRadGrp.Enabled := true;
      UpdateLocalBox();
    end;
    PBLBPP: begin
      GBestEdit.Enabled := false;
      PBestEdit.Enabled := true;
      LBestEdit.Enabled := true;
      LBNumEdit.Enabled := true;
      LBTypeRadGrp.Enabled := true;
      UpdateLocalBox();
    end;
  end;
end;

procedure TPSOForm.LBTypeRadGrpClick(Sender: TObject);
begin
  UpdateLocalBox();
end;

procedure TPSOForm.StopFlagBtnClick(Sender: TObject);
begin
  stopFlag := true;
end;

procedure TPSOForm.FMenuClick(Sender: TObject);
var functionForm : TPForm;
begin
  functionForm := TPForm.Create(nil);
  functionForm.InitForm(probCfg.pType, probCfg.dim);
  try
  //if ok is clicked, change the number of dimensions, enable the program to run
    if (functionForm.ShowModal = mrOK) then begin
      probCfg.pType := functionForm.ProbRadGrp.ItemIndex;
      probCfg.dType := functionForm.DomRadGrp.ItemIndex;
      probCfg.dim := functionForm.DimSpin.Value -1;
      pop := functionForm.PopEdit.Value -1;
      SetProb(probCfg.pType);

      InitForm();
      PMinEdit.Enabled := true;
      PMaxEdit.Enabled := true;
      VMinEdit.Enabled := true;
      VMaxEdit.Enabled := true;
      //disable all the run buttons to cope with changed settings
      NIterBtn.Enabled := false;
      OneIterBtn.Enabled := false;
      ThresBtn.Enabled := false;
      IterStpBtn.Enabled := false;
      ChangeBtn.Enabled := false;

      PartNumViewEdit.Enabled := false;
      SVYEdit.Enabled := false;
      SVXEdit.Enabled := false;

      //reset graphs
      SSwarm.Clear;
      SIndivFit.Clear;
      SIndivSpeed.Clear;
      SSwarmFit.Clear;
      SSwarmSpeed.Clear;
      SBestFit.Clear;

    end;
  finally
    functionForm.Release();
  end;
end;

procedure TPSOForm.JigBtnClick(Sender: TObject);
begin
  theSwarm.Jiggle(JigEdit.Value);
end;

procedure TPSOForm.UpdateBatchView;
begin

end;


end.
