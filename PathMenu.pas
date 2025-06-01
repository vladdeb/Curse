unit PathMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Maps, Algs, Draw;

type
  TmnPathFind = class(TForm)
    pnMain: TPanel;
    butFind: TButton;
    butMainMenu: TButton;
    edStart: TEdit;
    edEnd: TEdit;
    Panel2: TPanel;
    lblBuilding: TLabel;
    cmbBuilding: TComboBox;
    Panel3: TPanel;
    lblFloor: TLabel;
    cmbFloor: TComboBox;
    imMap: TImage;
    chbStreet: TCheckBox;
    lblPathDesc: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure Init(Sender: TObject);
    procedure cmbBuildingChange(Sender: TObject);
    procedure cmbFloorChange(Sender: TObject);
    procedure butFindClick(Sender: TObject);
    procedure butMainMenuClick(Sender: TObject);
    procedure chbStreetClick(Sender: TObject);

  private
    curMap: string;
    Path, Path2: TPath;
    Building, Floor: Integer;
    StreetSt, StreetFin: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mnPathFind: TmnPathFind;

implementation

{$R *.dfm}

procedure TmnPathFind.butMainMenuClick(Sender: TObject);
begin
  Close;
end;

procedure TmnPathFind.chbStreetClick(Sender: TObject);
begin
  if chbStreet.checked then
  begin
    imMap.Picture.LoadFromFile('Street.bmp');
    DrawStreetPath(imMap.Canvas, StreetPos, StreetSt, StreetFin);
    cmbBuilding.Enabled := false;
    cmbFloor.Enabled := false;
  end
  else
  begin
    imMap.Picture.LoadFromFile(curMap);
    DrawPath(imMap.Canvas, building, Floor, Path);
    cmbBuilding.Enabled := true;
    cmbFloor.Enabled := true;
  end;
end;

procedure TmnPathFind.butFindClick(Sender: TObject);
var
  foundst, Foundfin, code, start, finish, bStart, bFinish: integer;
  SStart, SEnd: string;
begin
  if not ValidAud(edStart.Text) then
  begin
    ShowMessage('Неверный формат(Номер аудитории-корпус, например, 213а-1)');
    Exit;
  end;
  if not ValidAud(edEnd.Text) then
  begin
    ShowMessage('Неверный формат(Номер аудитории-корпус, например, 213а-1)');
    exit;
  end;
  if Foundst = -1 then
  begin
    ShowMessage('Аудитория не найдена');
    exit;
  end;
  SearchAud(BSUIR, edEnd.Text, Foundfin);
  if Foundfin = -1 then
  begin
    ShowMessage('Аудитория не найдена');
    Exit;
  end;
  SearchAud(BSUIR, edStart.Text, Foundst);

  SStart := edStart.Text;
  SEnd := edEnd.Text;
  start := FoundSt + 100 * StrToInt(SStart[1]);
  finish := Foundfin + 100 * StrToInt(SEnd[1]);
  if SEnd[Length(SEnd)] = SStart[Length(SStart)] then
  begin
    building := StrToInt(SEnd[Length(SEnd)]);

    Path := SearchPath(BSUIR, building, BSUIRGraph[building - 1], start, finish);
    cmbBuilding.ItemIndex := building - 1;
    cmbFloor.Clear;
    for var i := 1 to Floors[StrToInt(cmbBuilding.Text)] do
      cmbFloor.AddItem(Char(i + 48), nil);
    cmbFloor.ItemIndex := start div 100 - 1;
    CurMap := cmbBuilding.Text + '.' + cmbFloor.Text + '.bmp';
    imMap.Picture.LoadFromFile(curMap);
    DrawPath(imMap.Canvas, building, start div 100, Path);
  end
  else
  begin
    bStart := Ord(SStart[length(SStart)]) - Ord('0');
    bFinish := Ord(SEnd[length(SEnd)]) - Ord('0');
    StreetSt := BuildingPos[bStart];
    StreetFin := BuildingPos[bFinish];
    SearchAud(BSUIR, '199Exit-' + SStart[length(SStart)], FoundSt);
    SearchAud(BSUIR, '199Exit-' + SEnd[length(SEnd)], FoundFin);
    Path := SearchPath(BSUIR, bStart, BSUIRGraph[bStart - 1], start, FoundSt + 100);
    Path2 := SearchPath(BSUIR, bFinish, BSUIRGraph[bFinish - 1], FoundFin + 100, finish);
    joinPath(Path, Path2);
    cmbBuilding.ItemIndex := bStart - 1;
    cmbFloor.Clear;
    for var i := 1 to Floors[StrToInt(cmbBuilding.Text)] do
      cmbFloor.AddItem(Char(i + 48), nil);
    cmbFloor.ItemIndex := start div 100 - 1;
    Floor := StrToInt(cmbFloor.Text);
    building := StrToInt(cmbBuilding.Text);
    CurMap := cmbBuilding.Text + '.' + cmbFloor.Text + '.bmp';
    imMap.Picture.LoadFromFile(curMap);
    DrawPath(imMap.Canvas, bStart, start div 100, Path);
  end;
  lblPathDesc.Caption := makePathDescription(Path, scales);
end;

procedure TmnPathFind.cmbBuildingChange(Sender: TObject);
begin
  cmbFloor.Clear;
  if cmbBuilding.Text <> 'Корпус' then
  begin
    for var i := 1 to Floors[StrToInt(cmbBuilding.Text)] do
      cmbFloor.AddItem(Char(i + 48), nil);
    cmbFloor.ItemIndex := 0;
    Floor := StrToInt(cmbFloor.Text);
    building := StrToInt(cmbBuilding.Text);
    CurMap := cmbBuilding.Text + '.' + cmbFloor.Text + '.bmp';
    try
      imMap.Picture.LoadFromFile(curMap);
    except
      on EFOpenError do
        imMap.Picture.LoadFromFile('NotAv.bmp');
    end;
    DrawPath(imMap.Canvas, building, Floor, Path);
  end;
end;

procedure TmnPathFind.cmbFloorChange(Sender: TObject);
begin
  CurMap := cmbBuilding.Text + '.' + cmbFloor.Text + '.bmp';
  try
    imMap.Picture.LoadFromFile(curMap);
  except
    on EFOpenError do
      imMap.Picture.LoadFromFile('NotAv.bmp');
    end;
  Floor := StrToInt(cmbFloor.Text);
  DrawPath(imMap.Canvas, building, Floor, Path);
end;

procedure TmnPathFind.Init(Sender: TObject);
begin
  Show;
  StreetSt :=  1;
  StreetFin := 1;
  curMap := '1.1.bmp';
  pnMain.Width := 300;
  imMap.Picture.LoadFromFile(curMap);
  SendMessage(GetWindow(cmbBuilding.Handle,GW_CHILD), EM_SETREADONLY, 1, 0);
  cmbBuilding.AddItem('1', nil);
  cmbBuilding.AddItem('2', nil);
  cmbBuilding.AddItem('3', nil);
  cmbBuilding.AddItem('4', nil);
  cmbBuilding.AddItem('5', nil);
  cmbBuilding.ItemIndex := 0;
  for var i := 1 to Floors[StrToInt(cmbBuilding.Text)] do
    cmbFloor.AddItem(Char(i + 48), nil);
  cmbFloor.ItemIndex := 0;

  ClientWidth := 1500;
  ClientHeight := 600;
end;

end.
