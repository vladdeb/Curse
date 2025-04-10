unit Algs;

interface

uses
  Maps;

function ValidAud(const Aud: String): boolean;

function SearchAud(Uni: TUni; const Aud: String; var Found: boolean): TUniPos;

implementation

function ValidAud(const Aud: String): boolean;
var
  n, temp1, temp2: integer;
begin
  result := true;
  n := Length(Aud);
  if n < 5 then
  begin
    result := False;
    Exit;
  end;
  if Aud[n - 1] <> '-' then
  begin
    result := False;
    Exit;
  end;
  if (Aud[n] < '0') or (Aud[n] > '9') then
  begin
    Exit;
  end;

  val(Copy(Aud, 1, 3), temp1, temp2);
  if temp2 <> 0 then
  begin
    result := False;
    Exit;
  end;
end;

function SearchAud(Uni: TUni; const Aud: String; var Found: boolean): TUniPos;
var
  Num, code: Integer;
  isSuf: Boolean;
  Suf: String;
  CurFloor: TFloor;
  l, r, m, temp: integer;

begin
  Found := false;
  isSuf := false;
  result.Building := Ord(Aud[length(Aud)]) - Ord('0');
  result.Floor := Ord(Aud[1]) - Ord('0');

  val(Copy(Aud, 1, 3), Num, code);
  if length(Aud) > 5 then
  begin
    isSuf := true;
    Suf := Copy(Aud, 4, Length(Aud) - 5);
  end;
  if (result.Building > Length(Uni)) or (result.Floor > Length(Uni[result.Building - 1])) then
  begin
    Found := false;
    Exit;
  end;
  CurFloor := Uni[result.Building - 1][result.Floor - 1];
  l := 0;
  r := length(CurFloor);
  while (r - l > 1) and not Found do
  begin
    m := (l + r) div 2;
    temp := CurFloor[m].Num;
    if temp = Num then
    begin
      if not isSuf and  not CurFloor[m].isSuf then
      begin
        result.Pos := CurFloor[m].Pos;
        Found := true;
        Exit;
      end;
      if (isSuf and CurFloor[m].isSuf) then
      begin
        if Suf = CurFloor[m].Suf then
        begin
          result.Pos := CurFloor[m].Pos;
          Found := true;
          Exit;
        end;
        if Suf < CurFloor[m].Suf then
          r := m
        else
          l := m + 1;
      end;
      if isSuf and not curFloor[m].isSuf then
        l := m + 1;
      if not isSuf and CurFloor[m].isSuf then
        r := m;
    end
    else
      if temp < Num then
        l := m + 1
      else
        r := m;
  end;
  if r - l = 1 then
  begin
    if (CurFloor[l].Num = Num) and ((CurFloor[l].isSuf and isSuf) and (CurFloor[l].Suf = Suf) or (not CurFloor[l].isSuf and not IsSuf)) then
    begin
      result.Pos := CurFloor[l].Pos;
      Found := true;
      Exit;
    end;
    Found := False;
  end;
end;
end.
