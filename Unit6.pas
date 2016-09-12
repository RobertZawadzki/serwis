unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB;

type
  Tedit_user = class(TForm)
    btnzapisz: TButton;
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
    procedure btnzapiszClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id: Integer;
  end;

var
  edit_user: Tedit_user;
  h_login, h_haslo, h_imie, h_nazwisko, h_stanowisko, h_opis: string;
  h_aktywny: Boolean;

implementation

uses
  Unit2, Unit1;

{$R *.dfm}

procedure Tedit_user.btnanulujClick(Sender: TObject);
begin
  Close;
end;

procedure Tedit_user.btnzapiszClick(Sender: TObject);
var
  stan: TBookmark;
  historia: string;
begin
  try
    stan := data.IBQuzytkownicy.Bookmark;
    with data.IBQtemp, SQL do
    begin
      Close;
      Clear;
      Add('update uzytkownicy set login=:login, haslo=:haslo, imie=:imie, nazwisko=:nazwisko, stanowisko=:stanowisko, opis=:opis, aktywny=:aktywny');
      Add('where id=:id');
      ParamByName('login').AsString := Trim(Editlogin.Text);
      ParamByName('haslo').AsString := Trim(Edithaslo.Text);
      ParamByName('imie').AsString := Trim(Editimie.Text);
      ParamByName('nazwisko').AsString := Trim(Editnazwisko.Text);
      ParamByName('stanowisko').AsString := cbbstanowisko.Text;
      ParamByName('opis').AsString := Trim(mmoopis.Text);
      ParamByName('aktywny').AsInteger := Integer(chkaktywny.Checked);
      ParamByName('id').AsInteger := id;
      ExecSQL;
      data.IBTtemp.Commit;
    end;
  except
    data.IBTtemp.Rollback;
    ShowMessage('B≥πd! Nie zaktualizowano uøytkownika. Sprawdü dane!');
  end;

  try
    historia := 'Aktualizacja uøytkownika:' + #13#10;
    if Editlogin.Text <> h_login then
      historia := historia + 'Login: by≥o: ' + h_login + ' jest: ' + Editlogin.Text + #13#10;
    if Edithaslo.Text <> h_haslo then
      historia := historia + 'Has≥o zosta≥o zmienione!' + #13#10;
    if Editimie.Text <> h_imie then
      historia := historia + 'ImiÍ: by≥o: ' + h_imie + ' jest: ' + Editimie.Text + #13#10;
    if Editnazwisko.Text <> h_nazwisko then
      historia := historia + 'Nazwisko: by≥o: ' + h_nazwisko + ' jest: ' + Editnazwisko.Text + #13#10;
    if cbbstanowisko.Text <> h_stanowisko then
      historia := historia + 'Stanowisko: by≥o: ' + h_stanowisko + ' jest: ' + cbbstanowisko.Text + #13#10;
    if mmoopis.Text <> h_opis then
      historia := historia + 'Opis: by≥o: ' + h_opis + ' jest: ' + mmoopis.Text + #13#10;
    if chkaktywny.Checked <> h_aktywny then
      historia := historia + 'Aktywny: by≥o: ' + BoolToStr(h_aktywny) + ' jest: ' + BoolToStr(chkaktywny.Checked) + #13#10;

    if ((Editlogin.Text = h_login) and (Edithaslo.Text = h_haslo) and (Editimie.Text = h_imie) and (Editnazwisko.Text = h_nazwisko) and (cbbstanowisko.Text = h_stanowisko) and (mmoopis.Text = h_opis) and (chkaktywny.Checked = h_aktywny)) then
      historia := historia + 'Nic nie zmieniono!';

    with data.IBQhistoria, SQL do
    begin
      Close;
      Clear;
      Add('insert into historia (panel, id_user, rekord, operacja, stanowisko) VALUES (:panel, :id_user, :rekord, :operacja, :stanowisko)');
      ParamByName('panel').AsInteger := 1;
      ParamByName('id_user').AsInteger := logowanie.id_user;
      ParamByName('rekord').AsInteger := id;
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
  data.IBQuzytkownicy.Bookmark := stan;
  Close;
end;

procedure Tedit_user.cbbstanowiskoChange(Sender: TObject);
begin
  if ((Editlogin.Text = '') or (Edithaslo.Text = '') or (cbbstanowisko.Text = '')) then
    btnzapisz.Enabled := False
  else
    btnzapisz.Enabled := True;
end;

procedure Tedit_user.EdithasloChange(Sender: TObject);
begin
  if ((Editlogin.Text = '') or (Edithaslo.Text = '') or (cbbstanowisko.Text = '')) then
    btnzapisz.Enabled := False
  else
    btnzapisz.Enabled := True;
end;

procedure Tedit_user.EditloginChange(Sender: TObject);
begin
  if ((Editlogin.Text = '') or (Edithaslo.Text = '') or (cbbstanowisko.Text = '')) then
    btnzapisz.Enabled := False
  else
    btnzapisz.Enabled := True;
end;

procedure Tedit_user.FormShow(Sender: TObject);
begin
  h_login := Editlogin.Text;
  h_haslo := Edithaslo.Text;
  h_imie := Editimie.Text;
  h_nazwisko := Editnazwisko.Text;
  h_stanowisko := cbbstanowisko.Text;
  h_opis := mmoopis.Text;
  h_aktywny := chkaktywny.Checked;
  btnzapisz.Enabled := True;
  Editlogin.SetFocus;
end;

end.

