program Project1;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {mnMain},
  ClassMenu in 'ClassMenu.pas' {mnClassFind},
  PathMenu in 'PathMenu.pas' {mnPathFind},
  Maps in 'Maps.pas',
  Draw in 'Draw.pas',
  Algs in 'Algs.pas',
  //Building1 in 'Building1.pas',
  Graph in 'Graph.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TmnMain, mnMain);
  Application.Run;
end.
