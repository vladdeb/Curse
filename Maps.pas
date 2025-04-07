unit Maps;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TAuditory = record
    Pos: TPoint;
    Num: integer;

    constructor Create(const X, Y: integer; const ANum: integer; ASuf: Char);
    case isSuf: boolean of
      true: (Suf: char);
  end;
  TFloor = array of TAuditory;
  TBuilding = array of TFloor;
  TUni = Array of TBuilding;
  TUniPos = record
    Building, Floor: Integer;
    Pos: TPoint;
  end;

  TConnection = record
    Node: TAuditory;
    dist: Integer;
  end;
  TVertex = array of TConnection;
  TGraph = array[1..1000] of TVertex;
  TUniGraph = array of TGraph;

var
  BSUIR: TUni;

implementation

var
  Building: TBuilding;
  Floor: TFloor;

{ TAuditory }

constructor TAuditory.Create(const X, Y: integer; const ANum: integer; ASuf: Char);
begin
  Pos := TPoint.Create(X, Y);
  Num := ANum;
  isSuf := (ASuf <> ' ');
  if isSuf then
    Suf := ASuf;
end;

procedure AddAud(var Floor: TFloor; Aud: TAuditory);
begin
  SetLength(Floor, length(Floor) + 1);
  Floor[High(floor)] := Aud;
end;

initialization

  SetLength(BSUIR, 3);
  SetLength(BSUIR[0], 4);
  //1ST BUILDING 1ST FLOOR
  SetLength(Bsuir[0][0], 0);
  AddAud(BSUIR[0][0], TAuditory.Create(85, 133,  101, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(85, 241,  102, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(85, 173,  103, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(85, 281,  104, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(85, 206,  105, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(85, 362,  107, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(32, 435,  109, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(287, 435, 110, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(121, 435, 111, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(361, 435, 112, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(428, 435, 114, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(183, 435, 115, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(703, 435, 116, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(253, 435, 117, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(214, 435, 118, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(359, 435, 119, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(844, 435, 120, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(806, 435, 121, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(947, 435, 122, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(845, 435, 123, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(989, 435, 124, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(912, 435, 125, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(1024,435, 126, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(947, 435, 127, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(1117,285, 128, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(985, 435, 129, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(1117,209, 130, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(1024,435, 131, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(1070,435, 133, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(1110,435, 135, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(1117,435, 137, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(1117,364, 139, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(1117,252, 141, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(1117,131, 143, ' '));
  AddAud(BSUIR[0][0], TAuditory.Create(1117, 30, 145, ' '));


  //1st BUILDING 2ND FLOOR
  SetLength(Bsuir[0][1], 0);

  AddAud(BSUIR[0][1], TAuditory.Create(81, 66,  201, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(81, 136, 201, 'à'));
  AddAud(BSUIR[0][1], TAuditory.Create(81, 136, 201, 'á'));
  AddAud(BSUIR[0][1], TAuditory.Create(81, 66,  201, 'ã'));
  AddAud(BSUIR[0][1], TAuditory.Create(81, 136, 202, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(81, 172, 203, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(81, 249, 203, 'à'));
  AddAud(BSUIR[0][1], TAuditory.Create(81, 212, 203, 'á'));
  AddAud(BSUIR[0][1], TAuditory.Create(81, 292, 204, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(81, 370, 205, 'à'));
  AddAud(BSUIR[0][1], TAuditory.Create(81, 327, 205, 'á'));
  AddAud(BSUIR[0][1], TAuditory.Create(81, 282, 205, 'â'));
  AddAud(BSUIR[0][1], TAuditory.Create(180,438, 206, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(143,438, 206, 'à'));
  AddAud(BSUIR[0][1], TAuditory.Create(81, 438, 207, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(223,438, 208, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(184,438, 209, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(259,438, 210, 'à'));
  AddAud(BSUIR[0][1], TAuditory.Create(286,438, 210, 'á'));
  AddAud(BSUIR[0][1], TAuditory.Create(325,438, 210, 'â'));
  AddAud(BSUIR[0][1], TAuditory.Create(255,438, 211, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(364,438, 212, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(286,438, 213, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(326,438, 213, 'à'));
  AddAud(BSUIR[0][1], TAuditory.Create(355,438, 215, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(500,438, 216, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(465,438, 217, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(666,438, 218, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(703,438, 219, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(808,438, 220, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(771,438, 221, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(808,438, 223, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(1024,438,224, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(915,438, 225, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(1118,249,226, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(1024,438,227, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(1069,438,229, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(1118,366,231, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(1118, 25,232, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(1118,330,233, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(1118,293,235, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(1118,179,237, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(1118,143,239, ' '));
  AddAud(BSUIR[0][1], TAuditory.Create(1118, 25,241, ' '));
end.
