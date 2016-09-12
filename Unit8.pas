unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB;

type
  Tnowy_klient = class(TForm)
    btndodaj: TButton;
    btnanuluj: TButton;
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
    Label11: TLabel;
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
    procedure FormShow(Sender: TObject);
    procedure btnanulujClick(Sender: TObject);
    procedure EditnazwiskoChange(Sender: TObject);
    procedure Edittel1Change(Sender: TObject);
    procedure btndodajClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  nowy_klient: Tnowy_klient;

implementation

uses
  Unit2, Unit7;

{$R *.dfm}

procedure Tnowy_klient.btnanulujClick(Sender: TObject);
begin
  Close;
end;

procedure Tnowy_klient.btndodajClick(Sender: TObject);
var
  generator: Integer;
begin
  try
    with data.IBQtemp, SQL do
    begin
      Close;
      Clear;
      Add('insert into klienci (imie, nazwisko, firma, ulica, kod_poczt, miejscowosc, tel1, tel2, email, nip)');
      Add('values (:imie, :nazwisko, :firma, :ulica, :kod_poczt, :miejscowosc, :tel1, :tel2, :email, :nip)');
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
      ExecSQL;
      data.IBTtemp.Commit;
    end;
    with data.IBQtemp, SQL do
    begin
      Clear;
      Add('select gen_id(gen_klienci_id, 0) from rdb$database');
      Open;
      generator := FieldByName('gen_id').AsInteger;
    end;

    klienci.btnfiltr.Click;

    data.IBQklienci.Locate('id', generator, [loCaseInsensitive, loPartialKey]);
    Close;
  except
    data.IBTtemp.Rollback;
    ShowMessage('B≥πd! Nie dodano Klienta. Sprawdü dane!');
  end;
end;

procedure Tnowy_klient.EditnazwiskoChange(Sender: TObject);
begin
  if ((Editnazwisko.Text = '') or (Edittel1.Text = '')) then
    btndodaj.Enabled := False
  else
    btndodaj.Enabled := True;
end;

procedure Tnowy_klient.Edittel1Change(Sender: TObject);
begin
  if ((Editnazwisko.Text = '') or (Edittel1.Text = '')) then
    btndodaj.Enabled := False
  else
    btndodaj.Enabled := True;
end;

procedure Tnowy_klient.FormShow(Sender: TObject);
begin
  Editimie.Text := '';
  Editnazwisko.Text := '';
  Editfirma.Text := '';
  Editulica.Text := '';
  Editkodpoczt.Text := '';
  Editmiejscowosc.Text := '';
  Edittel1.Text := '';
  Edittel2.Text := '';
  Editemail.Text := '';
  Editnip.Text := '';
  btndodaj.Enabled := False;

  Editimie.SetFocus;
end;

end.

