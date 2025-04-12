unit Algs;

interface

uses
  Maps;

function ValidAud(const Aud: String): boolean;
function SearchAud(Uni: TUni; const Aud: String; var Found: boolean): TUniPos;

implementation

type
  PQueueItem = ^TQueueItem;
  TQueueItem = record
    Auditory: TAuditory;
    next: PQueueItem;
  end;

//QUEUE FUNCTIONS
procedure Clear(head: PQueueItem);
var
  temp: PQueueItem;
begin
  if head <> nil then
  begin
    temp := head;
    while head <> nil do
    begin
      temp := head;
      head := temp^.next;
      Dispose(temp);
    end;
  end;
end;

procedure Insert(head: PQueueItem; val: TAuditory);
var
  temp, newItem: PQueueItem;
begin
  temp := head;
  while (temp^.next <> nil) and (val < temp^.next^.Auditory) do
    temp := temp^.next;
  New(newItem);
  newItem^.Auditory := val;
  newItem^.next := temp^.next;
  temp^.next := newItem;
end;

function GetFront(head: PQueueItem): TAuditory;
begin
  if head^.next <> nil then
    result := head^.next^.Auditory;
end;

procedure Pop(head: PQueueItem);
var
  temp: PQueueItem;
begin
  if head^.next <> nil then
  begin
    temp := head^.next;
    head^.next := temp^.next;
    Dispose(temp);
  end;
end;


//INPUT CHECK
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


//SEARCH OF AUDITORY
function SearchAud(Uni: TUni; const Aud: String; var Found: boolean): TUniPos;
var
  Num, code: Integer;
  isSuf: Boolean;
  Suf: String;
  CurFloor: TFloor;
  l, r, m: integer;
  temp, Target: TAuditory;

begin
  Found := false;
  isSuf := false;
  Suf := ' ';
  result.Building := Ord(Aud[length(Aud)]) - Ord('0');
  result.Floor := Ord(Aud[1]) - Ord('0');

  val(Copy(Aud, 1, 3), Num, code);
  if length(Aud) > 5 then
  begin
    isSuf := true;
    Suf := Copy(Aud, 4, Length(Aud) - 5);
  end;
  if (result.Building > Length(Uni)) or (result.Floor > High(Uni[result.Building - 1])) then
  begin
    Found := false;
    Exit;
  end;
  CurFloor := Uni[result.Building - 1][result.Floor];
  l := 0;
  r := length(CurFloor);
  Target := TAuditory.Create(0, 0, Num, Suf, result.Building);
  while (r - l > 1) and not Found do
  begin
    m := (l + r) div 2;
    temp := CurFloor[m];
    if temp = Target then
    begin
      Found := true;
      result.Pos := temp.Pos;
    end;
    if temp < Target then
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
