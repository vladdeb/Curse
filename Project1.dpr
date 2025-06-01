program Project1;

uses
  Vcl.Forms,
  MainMenu in 'MainMenu.pas' {mnMain},
  AuditoryMenu in 'AuditoryMenu.pas' {mnClassFind},
  PathMenu in 'PathMenu.pas' {mnPathFind},
  Maps in 'Maps.pas',
  Draw in 'Draw.pas',
//  Building1,
//  Building2,
//  Building3,
//  Building4,
//  Building5,
  Algs in 'Algs.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TmnMain, mnMain);
  Application.Run;
end.
