unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB;

type
  Tedit_klient = class(TForm)
    btnzapisz: TButton;
    btnanuluj: TButton;
    Label11: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    chkaktywny: TCheckBox;
    Editimie: TEdit;
    Editnazwisko: TEdit;
    Editfirma: TEdit;
    Editulica: TEdit;
    Editkodpoczt: TEdit;
    Editmiejscowosc: TEdit;
    Edittel1: TEdit;
    Edittel2: TEdit;
    Editemail: TEdit;
    Editnip: TEdit;
    procedure btnanulujClick(Sender: TObject);
    procedure EditnazwiskoChange(Sender: TObject);
    procedure Edittel1Change(Sender: TObject);
    procedure btnzapiszClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id: Integer;
  end;

var
  edit_klient: Tedit_klient;

implementation

uses
  Unit2, Unit7;

{$R *.dfm}

procedure Tedit_klient.btnanulujClick(Sender: TObject);
begin
  Close;
end;

procedure Tedit_klient.btnzapiszClick(Sender: TObject);
var
  stan: TBookmark;
begin
  try
    stan := data.IBQklienci.Bookmark;
    with data.IBQtemp, SQL do
    begin
      Close;
      Clear;
      Add('update klienci set imie=:imie, nazwisko=:nazwisko, firma=:firma, ulica=:ulica, kod_poczt=:kod_poczt, miejscowosc=:miejscowosc,');
      Add('tel1=:tel1, tel2=:tel2, email=:email, nip=:nip, aktywny=:aktywny');
      Add('where id=:id');
      ParamByName('imie').AsString := Trim(Editimie.Text);
      ParamByName('nazwisko').AsString := Trim(Editnazwisko.Text);
      ParamByName('firma').AsString := Trim(Editfirma.Text);
      ParamByName('ulica').AsString := Trim(Editulica.Text);
      ParamByName('kod_poczt').AsString := Trim(Editkodpoczt.Text);
      ParamByName('miejscowosc').AsString := Trim(Editmiejscowosc.Text);
      ParamByName('tel1').AsString := Trim(Edittel1.Text);
      ParamByName('tel2').AsString := Trim(Edittel2.Text);
      ParamByName('email').AsString := Trim(Editemail.Text);
      ParamByName('nip').AsString := Trim(Editnip.Text);
      ParamByName('aktywny').AsInteger := Integer(chkaktywny.Checked);
      ParamByName('id').AsInteger := id;
      ExecSQL;
      data.IBTtemp.Commit;
    end;

    klienci.btnfiltr.Click;

    data.IBQklienci.Bookmark := stan;
    Close;
  except
    data.IBTtemp.Rollback;
    ShowMessage('B≥πd! Nie zaktualizowano Klienta. Sprawdü dane!');
  end;
end;

procedure Tedit_klient.EditnazwiskoChange(Sender: TObject);
begin
  if ((Editnazwisko.Text = '') or (Edittel1.Text = '')) then
    btnzapisz.Enabled := False
  else
    btnzapisz.Enabled := True;
end;

procedure Tedit_klient.Edittel1Change(Sender: TObject);
begin
  if ((Editnazwisko.Text = '') or (Edittel1.Text = '')) then
    btnzapisz.Enabled := False
  else
    btnzapisz.Enabled := True;
end;

end.

