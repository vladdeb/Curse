unit ClassMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Draw, Algs, Maps,
  Vcl.CheckLst, Vcl.Menus;

type
  TmnClassFind = class(TForm)
    butSearch: TButton;
    butMainMenu: TButton;
    Label1: TLabel;
    AudIn: TEdit;
    procedure butMainMenuClick(Sender: TObject);
    procedure Close1(Sender: TObject; var Action: TCloseAction);
    procedure Init(Sender: TObject);
    procedure Paint(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure butSearchClick(Sender: TObject);
    procedure ShowPos(Sender: TObject);
  private
    { Private declarations }
    CurMap: String;
    Aud: String;
  public
    { Public declarations }
    Prev: TForm;
  end;

var
  mnClassFind: TmnClassFind;

implementation
{$R *.dfm}

Const
  dHeight = 39;
  dWidth = 8;

procedure TmnClassFind.butMainMenuClick(Sender: TObject);
begin
  Visible := false;
  Prev.Visible := true;
end;

procedure TmnClassFind.butSearchClick(Sender: TObject);
var
  AudPos: TUniPos;
  Found: Boolean;
begin
  if not ValidAud(AudIn.Text) then
  begin
    AudIn.Text := 'Некорректный формат';
  end;
  AudPos := SearchAud(BSUIR, AudIn.Text, Found);
  if not Found then
    AudIn.Text := 'Аудитория не найдена'
  else
  begin
    CurMap := Char(AudPos.Building + 48) + '.' + Char(AudPos.Floor + 48) + '.bmp';
    DrawMap(self, 150, 0, CurMap);
    DrawCross(self, AudPos.Pos.X + 150, AudPos.Pos.Y);
  end;
end;

procedure TmnClassFind.Close1(Sender: TObject; var Action: TCloseAction);
begin
  Halt;
end;


procedure TmnClassFind.FormClick(Sender: TObject);
begin
  Label1.Caption := IntToStr(Mouse.CursorPos.X - self.Left) + ' ' + IntToStr(Mouse.CursorPos.Y - self.top);
end;

procedure TmnClassFind.Init(Sender: TObject);
begin
  curMap := '1.1.bmp';
end;

procedure TmnClassFind.Paint(Sender: TObject);
begin
  ClientWidth := 1350;
  ClientHeight := 600;

  butMainMenu.Width := 150;
  butMainMenu.Left := 0;

  butSearch.Width := 150;
  butSearch.Left := 0;

  AudIn.Width := 150;
  AudIn.Left := 0;
  DrawMap(self, 150, 0, curMap);
end;
procedure TmnClassFind.ShowPos(Sender: TObject);
begin
  label1.Caption := IntToStr(Mouse.CursorPos.X - Left - 150 - dWidth) + ':' + IntToStr(Mouse.CursorPos.y - Top - dHeight)
end;

Initialization

end.
