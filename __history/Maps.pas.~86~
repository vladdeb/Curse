unit Maps;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TAuditory = record
    Pos: TPoint;
    Num: integer;
    isSuf: boolean;
    Suf: String[10];
    Building: integer;
    constructor Create(const X, Y: integer; const ANum: integer; ASuf: String; ABuilding: Integer);
    class operator Equal(a, b: TAuditory): boolean;
    class operator LessThan(a, b: TAuditory): boolean;
  end;
  TFloor = array of TAuditory;
  TBuilding = array of TFloor;
  TUni = Array of TBuilding;
  TUniPos = record
    Building, Floor: Integer;
    Pos: TPoint;
    constructor Create(Auditory: TAuditory);
  end;
  TEdge = record
    node: TAuditory;
    dist: integer;
  end;
  TVertex = array of TEdge;
  TVertexFixed = record
    Vert: array[0..100] of TEdge;
    size: integer;
  end;
  TGraph = array[1..1000] of TVertex;
  TUniGraph = array[0..5] of TGraph;
  Tpath = array of TUniPos;
  TmapFile = file of TAuditory;
  TgraphFile = file of TVertexFixed;
  TStreetPos = array[1..7] of TPoint;
  TScales = array[1..5] of real;


procedure AddAud(var Floor: TFloor; Aud: TAuditory);   
procedure AddEdge(const Building: TBuilding; var Graph: TGraph; v1, v2: integer);

const
  Floors: array[1..5] of integer = (4, 6, 5, 5, 9);
  BuildingPos: array[1..5] of integer = (2, 1, 3, 7, 5);
  scales: TScales = (0.03, 0.02, 0.02, 0.02, 0.02);

var
  BSUIR: TUni;
  BSUIRGraph: TUniGraph;
  test: TPath;
  StreetPos: TStreetPos;

implementation

{ TAuditory }

constructor TAuditory.Create(const X, Y: integer; const ANum: integer; ASuf: String; ABuilding: Integer);
begin
  Pos := TPoint.Create(X, Y);
  Num := ANum;
  isSuf := (ASuf <> ' ');
  Suf := ASuf;
  Building := ABuilding;
end;

procedure AddEdge(const Building: TBuilding; var Graph: TGraph; v1, v2: integer);
begin
  SetLength(Graph[v1], length(Graph[v1]) + 1);
  with Graph[v1][High(Graph[v1])] do
  begin
    node := Building[v2 div 100][v2 mod 100];
    dist := Abs(Building[v2 div 100][v2 mod 100].Pos.X - Building[v1 div 100][v1 mod 100].Pos.X)
          + Abs(Building[v2 div 100][v2 mod 100].Pos.Y - Building[v1 div 100][v1 mod 100].Pos.Y);
  end;

  SetLength(Graph[v2], length(Graph[v2]) + 1);
  with Graph[v2][High(Graph[v2])] do
  begin
    node := Building[v1 div 100][v1 mod 100];
    dist := Abs(Building[v2 div 100][v2 mod 100].Pos.X - Building[v1 div 100][v1 mod 100].Pos.X)
          + Abs(Building[v2 div 100][v2 mod 100].Pos.Y - Building[v1 div 100][v1 mod 100].Pos.Y);
  end;
end;

procedure AddAud(var Floor: TFloor; Aud: TAuditory);
begin
  SetLength(Floor, length(Floor) + 1);
  Floor[High(floor)] := Aud;
end;

class operator TAuditory.Equal(a, b: TAuditory): boolean;
begin
  if a.num <> b.num then
  begin
    result := false;
    Exit;
  end;
  if a.isSuf and b.isSuf then
  begin
    result := a.Suf = b.Suf;
    Exit;
  end;
  if not a.isSuf and not b.isSuf then
  begin
    result := true;
    Exit;
  end;
  result := false;
end;

class operator TAuditory.LessThan(a, b: TAuditory): boolean;
begin
  if a.num <> b.num then
  begin
    result := a.num < b.num;
    Exit;
  end;
  if a.isSuf and b.isSuf then
  begin
    result := a.Suf < b.Suf;
    Exit;
  end;
  if not a.isSuf and not b.isSuf then
  begin
    result := false;
    Exit;
  end;
  result := not a.isSuf and b.isSuf;
end;

{ TUniPos }

constructor TUniPos.Create(Auditory: TAuditory);
begin
  Pos := Auditory.Pos;
  Building := Auditory.Building;
  Floor := Auditory.Num div 100;
end;

var
  mapFile1: array[1..6] of TmapFile;
  temp: TAuditory;
  reading: boolean;
  Vertex: TVertexFixed;
  graphFile1: TGraphFile;

initialization
  StreetPos[1] := TPoint.Create(165, 15);
  StreetPos[2] := TPoint.Create(344, 15);
  StreetPos[3] := TPoint.Create(520, 15);
  StreetPos[4] := TPoint.Create(1169, 15);
  StreetPos[5] := TPoint.Create(1185, 479);
  StreetPos[6] := TPoint.Create(1191, 532);
  StreetPos[7] := TPoint.Create(1005, 559);

  SetLength(BSUIR, 5);
  //1ST BUILDING
  SetLength(BSUIR[0], 5);
  AssignFile(mapFile1[1], 'map1.1.dat');
  AssignFile(mapFile1[2], 'map1.2.dat');
  AssignFile(mapFile1[3], 'map1.3.dat');
  AssignFile(mapFile1[4], 'map1.4.dat');
  for var i := 1 to 4 do
  begin
    Reset(mapFile1[i]);
    reading := true;
    while not EoF(mapFile1[i]) do
    begin
      Read(mapFile1[i], temp);
      AddAud(BSUIR[0][i], temp);
    end;
    closeFile(mapFile1[i]);
  end;

  AssignFile(graphFile1, 'graph1.dat');
  reset(graphFile1);
  for var i := 1 to 1000 do
  begin
    read(graphFile1, Vertex);
    setLength(BSUIRGraph[0][i], Vertex.size);
    for var j := 0 to Vertex.size - 1 do
    begin
      BSUIRGraph[0][i][j] := Vertex.Vert[j];
    end;
  end;
  Close(graphFile1);
  //2ND BUILDING
  SetLength(BSUIR[1], 7);
  AssignFile(mapFile1[1], 'map2.1.dat');
  AssignFile(mapFile1[2], 'map2.2.dat');
  AssignFile(mapFile1[3], 'map2.3.dat');
  AssignFile(mapFile1[4], 'map2.4.dat');
  AssignFile(mapFile1[5], 'map2.5.dat');
  AssignFile(mapFile1[6], 'map2.6.dat');
  for var i := 1 to 6 do
  begin
    Reset(mapFile1[i]);
    reading := true;
    while not EoF(mapFile1[i]) do
    begin
      Read(mapFile1[i], temp);
      AddAud(BSUIR[1][i], temp);
    end;
    closeFile(mapFile1[i]);
  end;

  AssignFile(graphFile1, 'graph2.dat');
  reset(graphFile1);
  for var i := 1 to 1000 do
  begin
    read(graphFile1, Vertex);
    setLength(BSUIRGraph[1][i], Vertex.size);
    for var j := 0 to Vertex.size - 1 do
    begin
      BSUIRGraph[1][i][j] := Vertex.Vert[j];
    end;
  end;
end.
