unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, SMCVersInfo, IniFiles, Grids, DBGrids;

type
  Tlogowanie = class(TForm)
    img1: TImage;
    btnlogin: TButton;
    btnkoniec: TButton;
    Editlogin: TEdit;
    Edithaslo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Labelwersja: TLabel;
    smvrsnf1: TSMVersionInfo;
    chkpamietalogin: TCheckBox;
    procedure btnkoniecClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditloginChange(Sender: TObject);
    procedure EdithasloChange(Sender: TObject);
    procedure chkpamietaloginClick(Sender: TObject);
    procedure EditloginKeyPress(Sender: TObject; var Key: Char);
    procedure EdithasloKeyPress(Sender: TObject; var Key: Char);
    procedure btnloginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_user: Integer;
    stanowisko: string;
    klienci_dynamicznie: Boolean;
    computername: string;
  end;

var
  logowanie: Tlogowanie;
  INI: TIniFile;
  pamiec: Boolean;
  pamiec_login: string;
  main_left, main_top, main_wys, main_szer: Integer;

implementation

uses
  Unit2, Unit3;

{$R *.dfm}

function GetComputerNameStr: string;
var
  buffer: array[0..255] of Char;
  size: DWORD;
begin
  size := Length(buffer);
  if GetComputerName(buffer, size) then
    Result := buffer
  else
    Result := '';
end;

procedure Tlogowanie.btnkoniecClick(Sender: TObject);
begin
  if Application.MessageBox('Czy na pewno wyjœæ z programu?', 'Uwaga!', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
    INI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'serwis.ini');
    try
      INI.WriteInteger('polozenie', 'left', main.Left);
      INI.WriteInteger('polozenie', 'top', main.Top);
      INI.WriteInteger('polozenie', 'szerokosc', main.Width);
      INI.WriteInteger('polozenie', 'wysokosc', main.Height);
    finally
      INI.Free;
    end;

    Application.Terminate;
  end;

end;

procedure Tlogowanie.btnloginClick(Sender: TObject);
begin
  with data.IBQuzytkownicy, SQL do
  begin
    Close;
    Clear;
    Add('select id, login, haslo, imie, nazwisko, stanowisko, aktywny, usun, opis from uzytkownicy');
    Add('where login=:login and haslo=:haslo and aktywny=:aktywny and usun=:usun');
    ParamByName('login').AsString := Editlogin.Text;
    ParamByName('haslo').AsString := Edithaslo.Text;
    ParamByName('aktywny').AsInteger := 1;
    ParamByName('usun').AsInteger := 0;
    Open;
  end;

  if data.IBQuzytkownicy.FieldByName('login').AsString = Editlogin.Text then
  begin
  // prawda
    id_user := data.IBQuzytkownicy.FieldByName('id').AsInteger;

    if pamiec then
    begin
      INI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'serwis.ini');
      try
        INI.WriteString('ustawienia', 'login', Editlogin.Text);
      finally
        INI.Free;
      end;
    end;
    main.stat1.Panels[0].Text := Trim(data.IBQuzytkownicy.FieldByName('imie').AsString + ' ' + data.IBQuzytkownicy.FieldByName('nazwisko').AsString);
    main.stat1.Panels[1].Text := data.IBQuzytkownicy.FieldByName('login').AsString;
    stanowisko := data.IBQuzytkownicy.FieldByName('stanowisko').AsString;
    main.stat1.Panels[2].Text := stanowisko;
    main.Left := main_left;
    main.Top := main_top;
    main.Height := main_wys;
    main.Width := main_szer;

    main.Show;
    logowanie.Hide;
  end
  else
  begin
  // brak uzytkownika
    if pamiec then
    begin
      Edithaslo.Text := '';
      Edithaslo.SetFocus;
    end
    else
    begin
      Editlogin.Text := '';
      Edithaslo.Text := '';
      Editlogin.SetFocus;
    end;

  end;
end;

procedure Tlogowanie.chkpamietaloginClick(Sender: TObject);
begin
  INI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'serwis.ini');
  try
    INI.WriteBool('ustawienia', 'pamiec', chkpamietalogin.Checked);
  finally
    INI.Free;
  end;

  pamiec := chkpamietalogin.Checked;
end;

procedure Tlogowanie.EdithasloChange(Sender: TObject);
begin
  if ((Editlogin.Text = '') or (Edithaslo.Text = '')) then
    btnlogin.Enabled := False
  else
    btnlogin.Enabled := True;
end;

procedure Tlogowanie.EdithasloKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnlogin.Click;
    Key := #0;
  end;
end;

procedure Tlogowanie.EditloginChange(Sender: TObject);
begin
  if ((Editlogin.Text = '') or (Edithaslo.Text = '')) then
    btnlogin.Enabled := False
  else
    btnlogin.Enabled := True;
end;

procedure Tlogowanie.EditloginKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Edithaslo.SetFocus;
    Key := #0;
  end;
end;

procedure Tlogowanie.FormCreate(Sender: TObject);
begin
  Labelwersja.Caption := 'Wersja: ' + smvrsnf1.FileVersion;

  INI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'serwis.ini');
  try
    pamiec := INI.ReadBool('ustawienia', 'pamiec', False);
    pamiec_login := INI.ReadString('ustawienia', 'login', '');
    main_left := INI.ReadInteger('polozenie', 'left', 100);
    main_top := INI.ReadInteger('polozenie', 'top', 100);
    main_szer := INI.ReadInteger('polozenie', 'szerokosc', 640);
    main_wys := INI.ReadInteger('polozenie', 'wysokosc', 480);
    klienci_dynamicznie := INI.ReadBool('ustawienia', 'klienci_dynamicznie', False);
  finally
    INI.Free;
  end;

  chkpamietalogin.Checked := pamiec;
  computername := GetComputerNameStr;

end;

procedure Tlogowanie.FormShow(Sender: TObject);
begin
  btnlogin.Enabled := False;

  if pamiec then
  begin
    Edithaslo.Text := '';
    Edithaslo.SetFocus;
    Editlogin.Text := pamiec_login;
  end
  else
  begin
    Editlogin.Text := '';
    Edithaslo.Text := '';
    Editlogin.SetFocus;
  end;
end;

end.

