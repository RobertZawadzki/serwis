unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, SMDBGrid, StdCtrls, DBCtrls, Menus;

type
  Tuzytkownicy = class(TForm)
    btnnowy: TButton;
    btnedycja: TButton;
    btnanuluj: TButton;
    smdbgrd1: TSMDBGrid;
    dbmmo1: TDBMemo;
    Label1: TLabel;
    pm1: TPopupMenu;
    Historiaoperacji1: TMenuItem;
    procedure btnanulujClick(Sender: TObject);
    procedure btnnowyClick(Sender: TObject);
    procedure btnedycjaClick(Sender: TObject);
    procedure Historiaoperacji1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uzytkownicy: Tuzytkownicy;

implementation

uses
  Unit5, Unit6, Unit2, Unit1, Unit11;

{$R *.dfm}

procedure Tuzytkownicy.btnanulujClick(Sender: TObject);
begin
  Close;
end;

procedure Tuzytkownicy.btnedycjaClick(Sender: TObject);
begin
  edit_user.id := data.IBQuzytkownicy.FieldByName('id').AsInteger;
  edit_user.Editlogin.Text := data.IBQuzytkownicy.FieldByName('login').AsString;
  edit_user.Edithaslo.Text := data.IBQuzytkownicy.FieldByName('haslo').AsString;
  edit_user.Editimie.Text := data.IBQuzytkownicy.FieldByName('imie').AsString;
  edit_user.Editnazwisko.Text := data.IBQuzytkownicy.FieldByName('nazwisko').AsString;
  edit_user.mmoopis.Text := data.IBQuzytkownicy.FieldByName('opis').AsString;
  edit_user.cbbstanowisko.ItemIndex := edit_user.cbbstanowisko.Items.IndexOf(data.IBQuzytkownicy.FieldByName('stanowisko').AsString);
  edit_user.chkaktywny.Checked := Boolean(data.IBQuzytkownicy.FieldByName('aktywny').AsInteger);

  edit_user.Left := uzytkownicy.Left + 50;
  edit_user.Top := uzytkownicy.Top + 50;
  edit_user.ShowModal;
end;

procedure Tuzytkownicy.btnnowyClick(Sender: TObject);
begin
  nowy_user.Left := uzytkownicy.Left + 50;
  nowy_user.Top := uzytkownicy.Top + 50;
  nowy_user.ShowModal;
end;

procedure Tuzytkownicy.Historiaoperacji1Click(Sender: TObject);
begin
  if ((logowanie.stanowisko = 'Serwis') or (logowanie.stanowisko = 'Administrator')) then
  begin
    with data.IBQhistoria, SQL do
    begin
      Close;
      Clear;
      Add('select h.data, h.operacja, h.stanowisko, u.imie, u.nazwisko, u.login from historia h inner join uzytkownicy u on (h.id_user = u.id)');
      Add('where h.panel=:panel and h.rekord=:rekord order by h.data DESC');
      ParamByName('panel').AsInteger := 1;
      ParamByName('rekord').AsInteger := data.IBQuzytkownicy.FieldByName('id').AsInteger;
      Open;
    end;
    historia.Top := Mouse.CursorPos.Y;
    historia.Left := Mouse.CursorPos.X;
    historia.ShowModal;
  end
  else
    ShowMessage('Brak uprawnieñ!');

end;

end.

