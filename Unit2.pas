unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ClassMenu, PathMenu;

type
  TmnMain = class(TForm)
    butClose: TButton;
    butPathMenu: TButton;
    butClassMenu: TButton;
    procedure butCloseClick(Sender: TObject);
    procedure butClassMenuClick(Sender: TObject);
    procedure butPathMenuClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mnMain: TmnMain;

implementation

{$R *.dfm}

{ TForm2 }

procedure TmnMain.butClassMenuClick(Sender: TObject);
begin
  mnClassFind.Visible := true;
  mnClassFind.Prev := mnMain;
  mnMain.Visible := false;
end;

procedure TmnMain.butCloseClick(Sender: TObject);
begin
  Halt;
end;

procedure TmnMain.butPathMenuClick(Sender: TObject);
begin
  mnPathFind.Visible := true;
  mnPathFind.Prev := mnMain;
  mnMain.Visible := false;
end;

end.
