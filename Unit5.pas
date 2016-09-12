unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB;

type
  Tnowy_user = class(TForm)
    btndodaj: TButton;
    btnanuluj: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbbstanowisko: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Editlogin: TEdit;
    Edithaslo: TEdit;
    Editimie: TEdit;
    Editnazwisko: TEdit;
    mmoopis: TMemo;
    Label7: TLabel;
    chkaktywny: TCheckBox;
    procedure btnanulujClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditloginChange(Sender: TObject);
    procedure EdithasloChange(Sender: TObject);
    procedure cbbstanowiskoChange(Sender: TObject);
    procedure btndodajClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  nowy_user: Tnowy_user;

implementation

uses
  Unit2, Unit1;

{$R *.dfm}

// panel nr: 1

procedure Tnowy_user.btnanulujClick(Sender: TObject);
begin
  Close;
end;

procedure Tnowy_user.btndodajClick(Sender: TObject);
var
  generator: Integer;
  historia: string;
begin
  try
    with data.IBQtemp, SQL do
    begin
      Close;
      Clear;
      Add('insert into uzytkownicy (login, haslo, imie, nazwisko, stanowisko, opis)');
      Add('values (:login, :haslo, :imie, :nazwisko, :stanowisko, :opis)');
      ParamByName('login').AsString := Trim(Editlogin.Text);
      ParamByName('haslo').AsString := Trim(Edithaslo.Text);
      ParamByName('imie').AsString := Trim(Editimie.Text);
      ParamByName('nazwisko').AsString := Trim(Editnazwisko.Text);
      ParamByName('stanowisko').AsString := cbbstanowisko.Text;
      ParamByName('opis').AsString := Trim(mmoopis.Text);
      ExecSQL;
      data.IBTtemp.Commit;
    end;
    with data.IBQtemp, SQL do
    begin
      Clear;
      Add('select gen_id(gen_uzytkownicy_id, 0) from rdb$database');
      Open;
      generator := FieldByName('gen_id').AsInteger;
    end;

    try
      historia:='Utworzenie nowego uøytkownika' + #13#10;
      historia:=historia + 'Login: ' + Editlogin.Text + #13#10;
      historia:=historia + 'Has≥o zosta≥o utworzone' + #13#10;
      historia:=historia + 'ImiÍ: ' + Editimie.Text + #13#10;
      historia:=historia + 'Nazwisko: ' + Editnazwisko.Text + #13#10;
      historia:=historia + 'Stanowisko: ' + cbbstanowisko.Text + #13#10;
      historia:=historia + 'Opis: ' + mmoopis.Text + #13#10;
      historia:=historia + 'Aktywny ustawiono na Tak';

      with data.IBQhistoria, SQL do
      begin
        Close;
        Clear;
        Add('insert into historia (panel, id_user, rekord, operacja, stanowisko) VALUES (:panel, :id_user, :rekord, :operacja, :stanowisko)');
        ParamByName('panel').AsInteger := 1;
        ParamByName('id_user').AsInteger := logowanie.id_user;
        ParamByName('rekord').AsInteger := generator;
        ParamByName('operacja').AsString := historia;
        ParamByName('stanowisko').AsString := logowanie.computername;
        ExecSQL;
        data.IBThistoria.Commit;
      end;
    except
      data.IBThistoria.Rollback;
      ShowMessage('B≥πd! Nie dodano wpisu w historii. Sprawdü dane!');
    end;

    with data.IBQuzytkownicy, SQL do
    begin
      Close;
      Clear;
      Add('select id, login, haslo, imie, nazwisko, stanowisko, data_utworzenia, aktywny, usun, opis from uzytkownicy');
      Add('where login <> :login and usun=:usun order by login');
      ParamByName('login').AsString := 'serwis';
      ParamByName('usun').AsInteger := 0;
      Open;
    end;
    data.IBQuzytkownicy.Locate('id', generator, [loCaseInsensitive, loPartialKey]);
    Close;
  except
    data.IBTtemp.Rollback;
    ShowMessage('B≥πd! Nie dodano uøytkownika. Sprawdü dane!');
  end;

end;

procedure Tnowy_user.cbbstanowiskoChange(Sender: TObject);
begin
  if ((Editlogin.Text = '') or (Edithaslo.Text = '') or (cbbstanowisko.Text = '')) then
    btndodaj.Enabled := False
  else
    btndodaj.Enabled := True;
end;

procedure Tnowy_user.EdithasloChange(Sender: TObject);
begin
  if ((Editlogin.Text = '') or (Edithaslo.Text = '') or (cbbstanowisko.Text = '')) then
    btndodaj.Enabled := False
  else
    btndodaj.Enabled := True;
end;

procedure Tnowy_user.EditloginChange(Sender: TObject);
begin
  if ((Editlogin.Text = '') or (Edithaslo.Text = '') or (cbbstanowisko.Text = '')) then
    btndodaj.Enabled := False
  else
    btndodaj.Enabled := True;
end;

procedure Tnowy_user.FormShow(Sender: TObject);
begin
  Editlogin.Text := '';
  Edithaslo.Text := '';
  Editimie.Text := '';
  Editnazwisko.Text := '';
  mmoopis.Text := '';
  cbbstanowisko.ItemIndex := -1;
  btndodaj.Enabled := False;
  Editlogin.SetFocus;
end;

end.

