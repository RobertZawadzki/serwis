unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, Grids, DBGrids, SMDBGrid, StdCtrls,
  DateUtils;

type
  Tmain = class(TForm)
    mm1: TMainMenu;
    Program1: TMenuItem;
    Koniec1: TMenuItem;
    Raporty1: TMenuItem;
    Kartoteki1: TMenuItem;
    Ustawienia1: TMenuItem;
    Pomoc1: TMenuItem;
    OProgramie1: TMenuItem;
    Klienci1: TMenuItem;
    Uytkownicy1: TMenuItem;
    stat1: TStatusBar;
    Konfiguracja1: TMenuItem;
    Drukarki1: TMenuItem;
    Firma1: TMenuItem;
    pnlfiltry: TPanel;
    pnlnowe: TPanel;
    pnlreklamacje: TPanel;
    pnlszczegoly: TPanel;
    Editszukaj: TEdit;
    lab1: TLabel;
    chkdynamiczne: TCheckBox;
    cbbwyborokresu: TComboBox;
    lab2: TLabel;
    lab3: TLabel;
    dtpod: TDateTimePicker;
    dtpdo: TDateTimePicker;
    lab4: TLabel;
    cbbstatus: TComboBox;
    btnnowa: TButton;
    btnedycja: TButton;
    smdbgrd1: TSMDBGrid;
    procedure Koniec1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure OProgramie1Click(Sender: TObject);
    procedure Uytkownicy1Click(Sender: TObject);
    procedure Klienci1Click(Sender: TObject);
    procedure Firma1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbwyborokresuChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  main: Tmain;

implementation

uses
  Unit1, ABOUT, Unit4, Unit2, Unit7, Unit10;

{$R *.dfm}

procedure Tmain.cbbwyborokresuChange(Sender: TObject);
begin
  case cbbwyborokresu.ItemIndex of
    0:
      begin // Aktualny miesi¹c
        dtpod.Date := EncodeDate(CurrentYear, MonthOf(Now), 1);
        dtpdo.Date := EndOfTheMonth(Now);
        dtpod.Enabled := False;
        dtpdo.Enabled := False;
      end;
    1:
      begin // Poprzedni miesi¹c
        if MonthOf(Now) = 1 then
        begin
          dtpod.Date := EncodeDate(CurrentYear - 1, 12, 1);
          dtpdo.Date := EncodeDate(CurrentYear - 1, 12, 31);
          dtpod.Enabled := False;
          dtpdo.Enabled := False;
        end
        else
        begin
          dtpod.Date:=EncodeDate(CurrentYear, MonthOfTheYear(Now - DayOfTheMonth(Now)), 1);
          dtpdo.Date := Now - DayOfTheMonth(Now);
          dtpod.Enabled := False;
          dtpdo.Enabled := False;
        end;
      end;
    2:
      begin // Ostatnie 7 dni
        dtpod.Date := Now - 7;
        dtpdo.Date := Now;
        dtpod.Enabled := False;
        dtpdo.Enabled := False;
      end;
    3:
      begin  // Ostatnie 30 dni
        dtpod.Date := Now - 30;
        dtpdo.Date := Now;
        dtpod.Enabled := False;
        dtpdo.Enabled := False;
      end;
    4:
      begin  // Aktualny rok
        dtpod.Date := EncodeDate(CurrentYear, 1, 1);
        dtpdo.Date := EndOfTheYear(Now);
        dtpod.Enabled := False;
        dtpdo.Enabled := False;
      end;
    5:
      begin  // Poprzedni rok
        dtpod.Date := EncodeDate(CurrentYear - 1, 1, 1);
        dtpdo.Date := EndOfTheYear(Now - DayOfTheYear(Now));
        dtpod.Enabled := False;
        dtpdo.Enabled := False;
      end;
    6:
      begin  // Wszystkie

        dtpod.Enabled := False;
        dtpdo.Enabled := False;
      end;
    7:
      begin  // Dowolny okres
        dtpod.Date := EncodeDate(CurrentYear, MonthOf(Now), 1);
        dtpdo.Date := EndOfTheMonth(Now);
        dtpod.Enabled := True;
        dtpdo.Enabled := True;
      end;
  end;
end;

procedure Tmain.Firma1Click(Sender: TObject);
begin
  if ((logowanie.stanowisko = 'serwis') or (logowanie.stanowisko = 'Administrator')) then
  begin
    firma.Left := main.Left + 50;
    firma.Top := main.Top + 50;
    firma.ShowModal;
  end
  else
    ShowMessage('Brak uprawnieñ');

end;

procedure Tmain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  main.Hide;
  logowanie.Show;
end;

procedure Tmain.FormShow(Sender: TObject);
begin
  dtpod.Enabled := False;
  dtpdo.Enabled := False;
  cbbwyborokresu.ItemIndex := 3;
  Editszukaj.Text := '';
  cbbstatus.ItemIndex := 0;
end;

procedure Tmain.Klienci1Click(Sender: TObject);
begin
  klienci.chkdynamiczne.Checked := logowanie.klienci_dynamicznie;
  klienci.btnfiltr.Click;
  klienci.Left := main.Left + 50;
  klienci.Top := main.Top + 50;
  klienci.ShowModal;
end;

procedure Tmain.Koniec1Click(Sender: TObject);
begin
  main.Hide;
  logowanie.Show;
end;

procedure Tmain.OProgramie1Click(Sender: TObject);
begin
  aboutbox.Version.Caption := 'Wersja: ' + logowanie.smvrsnf1.FileVersion;
  AboutBox.Show;
end;

procedure Tmain.Uytkownicy1Click(Sender: TObject);
begin
  if ((logowanie.stanowisko = 'serwis') or (logowanie.stanowisko = 'Administrator')) then
  begin
    with data.IBQuzytkownicy, SQL do
    begin
      Close;
      Clear;
      Add('select id, login, haslo, imie, nazwisko, stanowisko, data_utworzenia, aktywny, usun, opis from uzytkownicy');
      Add('where login <> :login and usun=:usun order by login');
      ParamByName('login').AsString := 'serwis';
      ParamByName('usun').AsInteger := 0;
      Open;
      First;
    end;

    uzytkownicy.Left := main.Left + 50;
    uzytkownicy.Top := main.Top + 50;
    uzytkownicy.ShowModal;
  end
  else
    ShowMessage('Brak uprawnieñ');

end;

end.

