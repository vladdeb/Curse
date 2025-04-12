unit Draw;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

procedure DrawMap(Form: TForm; X, Y: Integer; FileName: String);

procedure DrawCross(Form: TForm; X, Y: Integer);

implementation

const
  CrossSize = 10;

procedure DrawMap(Form: TForm; X, Y: Integer; FileName: String);
var
  BitMap: TBitMap;
begin
  BitMap := TBitMap.Create;
  BitMap.LoadFromFile(FileName);
  Form.Canvas.Draw(X, Y, BitMap);
  BitMap.Free;
end;

procedure DrawCross(Form: TForm; X, Y: Integer);
begin
  with Form.Canvas do
  begin
    Pen.Color := clRed;
    Pen.Width := 5;
    MoveTo(X - CrossSize, Y - CrossSize);
    LineTo(X + CrossSize, Y + CrossSize);

    MoveTo(X + CrossSize, Y - CrossSize);
    LineTo(X - CrossSize, Y + CrossSize);

  end;
end;

end.
