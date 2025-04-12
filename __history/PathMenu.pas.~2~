unit PathMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TmnPathFind = class(TForm)
    start: TMemo;
    butSearch: TButton;
    butMainMenu: TButton;
    Finish: TMemo;
    procedure butMainMenuClick(Sender: TObject);
    procedure Close(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Prev: TForm;
  end;

var
  mnPathFind: TmnPathFind;

implementation

{$R *.dfm}



procedure TmnPathFind.butMainMenuClick(Sender: TObject);
begin
  Prev.Visible := true;
  Visible := false;
end;

procedure TmnPathFind.Close(Sender: TObject; var Action: TCloseAction);
begin
  Halt;
end;

end.
