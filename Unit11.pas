unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, DBGrids, SMDBGrid;

type
  Thistoria = class(TForm)
    smdbgrd1: TSMDBGrid;
    dbmmo1: TDBMemo;
    btnanuluj: TButton;
    procedure btnanulujClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  historia: Thistoria;

implementation

{$R *.dfm}

procedure Thistoria.btnanulujClick(Sender: TObject);
begin
  Close;
end;

procedure Thistoria.FormShow(Sender: TObject);
begin
  btnanuluj.SetFocus;
end;

end.

