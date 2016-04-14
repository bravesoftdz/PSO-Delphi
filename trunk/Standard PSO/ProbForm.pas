unit ProbForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Spin, ExtCtrls,
  //user created units
  Problem, Definitions, ESBPCSPanel, ESBPCSSpinEdit;

type
  TPForm = class(TForm)
    ProbMemo: TMemo;
    EvalFitGrid: TStringGrid;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    EvalBtn: TButton;
    PSFitLbl: TLabel;
    ProbRadGrp: TRadioGroup;
    GroupBox1: TGroupBox;
    DimSpin: TESBPosSpinEdit;
    GroupBox2: TGroupBox;
    SeedEdit: TESBPosSpinEdit;
    DomRadGrp: TRadioGroup;
    GroupBox3: TGroupBox;
    PopEdit: TESBPosSpinEdit;
    procedure EvalBtnClick(Sender: TObject);
    procedure DimSpinChange(Sender: TObject);
    procedure ProbRadGrpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DomRadGrpClick(Sender: TObject);
  private
    { Private declarations }
    theProblem : integer;
    theDimensions: integer;
    theDomain : integer;
  public
    procedure InitForm(prob, dim : integer);
    procedure InitGrid();
    procedure FillMemo();
    { Public declarations }
  end;

var
  PForm: TPForm;

implementation

{$R *.dfm}

{ TPForm }


procedure TPForm.InitForm(prob, dim: integer);
begin
  theProblem := prob;
  theDimensions := dim;
  DimSpin.Value := theDimensions + 1;
  ProbRadGrp.ItemIndex := theProblem;
  case ProbRadGrp.ItemIndex of
    RAST: begin
      DomRadGrp.ItemIndex := REAL;
      TRadioButton(DomRadGrp.Controls[INT]).Enabled := false;
    end;
    SCHW: begin
      DomRadGrp.ItemIndex := REAL;
      TRadioButton(DomRadGrp.Controls[INT]).Enabled := false;
    end;
  end;
  FillMemo();
  InitGrid();
end;

procedure TPForm.InitGrid;
var i: integer;
begin
  //need to add 2 to include fixed field as well as all the necessary string fields
  EvalFitGrid.ColCount := theDimensions + 2;
  for i:= 0 to theDimensions do begin
    EvalFitGrid.Cells[i+1,0] := 'Dim ' + IntToStr(i);
    EvalFitGrid.Cells[i+1,1] := '0';
  end;
  EvalFitGrid.Cells[0,1] := 'Value';

end;

procedure TPForm.EvalBtnClick(Sender: TObject);
var posI : TIArray;
    posD : TDArray;
    i: integer;
    fitness : double;
begin
  case theDomain of
    INT: begin
      setLength(posI,theDimensions +1);
      for i:= 0 to theDimensions do begin
        posI[i] := StrToIntDef(EvalFitGrid.Cells[i+1,1],MAXINT);
        if(posI[i] = MAXINT) then begin
          MessageDlg( 'Sorry, '''+EvalFitGrid.Cells[i+1,1]+' is invalid for this domain space',mtWarning, [mbOK], 0);
          EvalFitGrid.Cells[i+1,1] := '0'; //reset to zero
          exit;
        end;
      end;
      fitness :=  evaluate(posI, theProblem);
      PSFitLbl.Caption := 'Fitness = ' +floatToStr(fitness);
    end;

    REAL: begin
      setLength(posD,theDimensions +1);
      for i:= 0 to theDimensions do begin
        posD[i] := StrToFloatDef(EvalFitGrid.Cells[i+1,1],MAXINT);
        if(posD[i] = MAXINT) then begin
          MessageDlg( 'Sorry, '''+EvalFitGrid.Cells[i+1,1]+' is invalid for this domain space',mtWarning, [mbOK], 0);
          EvalFitGrid.Cells[i+1,1] := '0'; //reset to zero
          exit;
        end;
      end;
      fitness :=  evaluate(posD, theProblem);
      PSFitLbl.Caption := 'Fitness = ' +floatToStr(fitness);
    end;
  end;

end;


procedure TPForm.DimSpinChange(Sender: TObject);
begin
  theDimensions := DimSpin.Value - 1;
  InitGrid();
end;

procedure TPForm.ProbRadGrpClick(Sender: TObject);
begin
  theProblem := ProbRadGrp.ItemIndex;
  case theProblem of
    ORI:  TRadioButton(DomRadGrp.Controls[INT]).Enabled := True;
    ORIF: TRadioButton(DomRadGrp.Controls[INT]).Enabled := True;
    RAST: begin
      DomRadGrp.ItemIndex := REAL;
      TRadioButton(DomRadGrp.Controls[INT]).Enabled := false;
    end;
    SCHW: begin
      DomRadGrp.ItemIndex := REAL;
      TRadioButton(DomRadGrp.Controls[INT]).Enabled := false;
    end;
  end;
  FillMemo();
end;

procedure TPForm.FillMemo();
begin
  ProbMemo.Clear();
  case theProblem of
    ORI : begin
      ProbMemo.Lines.Add('Simple Euclidean distance problem');
      ProbMemo.Lines.Add('Fitness increases uniformly in all directions from origin');
      ProbMemo.Lines.Add('Global Minimum is at 0 for all dimensions');
      ProbMemo.Lines.Add('Fitness is given by Sqrt(a2+b2+c2...n2)');
    end;
    ORIF : begin
      ProbMemo.Lines.Add('Simple Euclidean distance problem with an offset');
      ProbMemo.Lines.Add('Fitness increases uniformly in all directions from focal point of 50 for all dimensions');
      ProbMemo.Lines.Add('Global Minimum is at 0 for all dimensions');
      ProbMemo.Lines.Add('Fitness is given by Sqrt((a-50)2+(b-50)2+(c-50)2...(n-50)2)');
    end;
    RAST : begin
      ProbMemo.Lines.Add('Based on the Origin Equation but with the addition of Cosine modulation.');
      ProbMemo.Lines.Add('This produces many local Minima that are locally distributed');
      ProbMemo.Lines.Add('Global Minimum is at 0 for all dimensions');
      ProbMemo.Lines.Add('Fitness is given by 10*n + sum(x2 - 10*Cos(2*PI*x))');
    end;
    SCHW : begin
      ProbMemo.Lines.Add('Schwefel''s function  is deceptive in that the global minimum is geometrically distant from the next best minima');
      ProbMemo.Lines.Add('Therefore, potentially prone to convergence in the wrong direction.');
      ProbMemo.Lines.Add('Global Minimum is 420.9687 in all dimensions');
      ProbMemo.Lines.Add('Fitness is given by sum(-x·sin(sqrt(abs(x)))');
    end;
  end;
end;


procedure TPForm.FormCreate(Sender: TObject);
begin
  TRadioButton(ProbRadGrp.Controls[ORI]).Font.Style := [];
  TRadioButton(ProbRadGrp.Controls[ORIF]).Font.Style := [];
  TRadioButton(ProbRadGrp.Controls[RAST]).Font.Style := [];
  TRadioButton(ProbRadGrp.Controls[SCHW]).Font.Style := [];
  TRadioButton(DomRadGrp.Controls[INT]).Font.Style := [];
  TRadioButton(DomRadGrp.Controls[REAL]).Font.Style := [];

end;

procedure TPForm.DomRadGrpClick(Sender: TObject);
begin
  theDomain := DomRadGrp.ItemIndex;
  case theDomain of
    ORI:  DomRadGrp.Controls[0].Enabled := True;
    ORIF: DomRadGrp.Controls[0].Enabled := True;
    RAST: DomRadGrp.Controls[0].Enabled := false;
    SCHW: DomRadGrp.Controls[0].Enabled := false;
  end;
end;

end.
