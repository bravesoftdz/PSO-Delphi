program PSO;

uses
  Forms,
  Main in 'Main.pas' {PSOForm},
  Particle in 'Particle.pas',
  Definitions in 'Definitions.pas',
  Origin in 'Origin.pas',
  Rastrigin in 'Rastrigin.pas',
  Problem in 'Problem.pas',
  ProbForm in 'ProbForm.pas' {PForm},
  Schwefel in 'Schwefel.pas',
  OriginOff in 'OriginOff.pas',
  Swarm in 'Swarm.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPSOForm, PSOForm);
  Application.Run;
end.
