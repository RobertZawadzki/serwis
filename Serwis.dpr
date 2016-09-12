program Serwis;

uses
  Forms,
  Unit1 in 'Unit1.pas' {logowanie},
  Unit2 in 'Unit2.pas' {data: TDataModule},
  Unit3 in 'Unit3.pas' {main},
  ABOUT in 'ABOUT.pas' {AboutBox},
  Unit4 in 'Unit4.pas' {uzytkownicy},
  Unit5 in 'Unit5.pas' {nowy_user},
  Unit6 in 'Unit6.pas' {edit_user},
  Unit7 in 'Unit7.pas' {klienci},
  Unit8 in 'Unit8.pas' {nowy_klient},
  Unit9 in 'Unit9.pas' {edit_klient},
  Unit10 in 'Unit10.pas' {firma},
  Unit11 in 'Unit11.pas' {historia};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tlogowanie, logowanie);
  Application.CreateForm(Tdata, data);
  Application.CreateForm(Tmain, main);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(Tuzytkownicy, uzytkownicy);
  Application.CreateForm(Tnowy_user, nowy_user);
  Application.CreateForm(Tedit_user, edit_user);
  Application.CreateForm(Tklienci, klienci);
  Application.CreateForm(Tnowy_klient, nowy_klient);
  Application.CreateForm(Tedit_klient, edit_klient);
  Application.CreateForm(Tfirma, firma);
  Application.CreateForm(Thistoria, historia);
  Application.Run;
end.
