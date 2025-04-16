unit Draw;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Maps;

procedure DrawCross(Canvas: TCanvas; X, Y: Integer);
procedure DrawPath(Canvas: TCanvas; Building, Floor: Integer; Path: TPath);

implementation

const
  CrossSize = 7;

procedure DrawCross(Canvas: TCanvas; X, Y: Integer);
begin
  with Canvas do
  begin
    Pen.Color := clRed;
    Pen.Width := 3;
    MoveTo(X - CrossSize, Y - CrossSize);
    LineTo(X + CrossSize, Y + CrossSize);

    MoveTo(X + CrossSize, Y - CrossSize);
    LineTo(X - CrossSize, Y + CrossSize);
  end;
end;

procedure DrawPath(Canvas: TCanvas; Building, Floor: Integer; Path: TPath);
var
  i: integer;
begin
  i := 0;
  with Canvas do
  begin
    Pen.Width := 3;
    pen.Color := clRed;
    while (i < High(Path)) and not((path[i].Floor = Floor) and (path[i].Building = Building)) do
      Inc(i);
    if i <= High(Path) then
    begin
      MoveTo(path[i].Pos.X, path[i].Pos.Y);
      Inc(i);
      if I <= High(Path) then
        LineTo(path[i].Pos.X, path[i].Pos.Y);
    end;
    while (i <= High(Path)) and (path[i].Floor = Floor) and (path[i].Building = Building) do
    begin
      MoveTo(path[i].Pos.X, path[i].Pos.Y);
      Inc(i);
      if I <= High(Path) then
        LineTo(path[i].Pos.X, path[i].Pos.Y);
    end;
  end;

end;

end.
