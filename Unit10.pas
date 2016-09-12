unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tfirma = class(TForm)
    btnzapisz: TButton;
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
    Editnazwa: TEdit;
    Editulica: TEdit;
    Editkodpoczt: TEdit;
    Editmiejscowosc: TEdit;
    Editnip: TEdit;
    Edittel1: TEdit;
    Edittel2: TEdit;
    Editemail: TEdit;
    Editwww: TEdit;
    procedure btnanulujClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnzapiszClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  firma: Tfirma;

implementation

uses
  Unit2;

{$R *.dfm}

procedure Tfirma.btnanulujClick(Sender: TObject);
begin
  Close;
end;

procedure Tfirma.btnzapiszClick(Sender: TObject);
begin
  try
    with data.IBQfirma, SQL do
    begin
      Close;
      Clear;
      Add('update firma set nazwa=:nazwa, ulica=:ulica, kod_poczt=:kod_poczt, miejscowosc=:miejscowosc,');
      Add('nip=:nip, tel1=:tel1, tel2=:tel2, email=:email, www=:www where id=:id');
      ParamByName('nazwa').AsString := Editnazwa.Text;
      ParamByName('ulica').AsString := Editulica.Text;
      ParamByName('kod_poczt').AsString := Editkodpoczt.Text;
      ParamByName('miejscowosc').AsString := Editmiejscowosc.Text;
      ParamByName('nip').AsString := Editnip.Text;
      ParamByName('tel1').AsString := Edittel1.Text;
      ParamByName('tel2').AsString := Edittel2.Text;
      ParamByName('email').AsString := Editemail.Text;
      ParamByName('www').AsString := Editwww.Text;
      ParamByName('id').AsInteger := 1;
      ExecSQL;
      data.IBTfirma.Commit;
    end;
    Close;
  except
    data.IBTfirma.Rollback;
    ShowMessage('B³¹d! Nie zaktualizowano ustawieñ firmy. SprawdŸ dane!');
  end;

end;

procedure Tfirma.FormShow(Sender: TObject);
begin
  with data.IBQfirma, SQL do
  begin
    Close;
    Clear;
    Add('select id, nazwa, ulica, kod_poczt, miejscowosc, nip, tel1, tel2, email, www from firma');
    Add('where id =:id');
    ParamByName('id').AsInteger := 1;
    Open;
  end;

  Editnazwa.Text := data.IBQfirma.FieldByName('nazwa').AsString;
  Editulica.Text := data.IBQfirma.FieldByName('ulica').AsString;
  Editkodpoczt.Text := data.IBQfirma.FieldByName('kod_poczt').AsString;
  Editmiejscowosc.Text := data.IBQfirma.FieldByName('miejscowosc').AsString;
  Editnip.Text := data.IBQfirma.FieldByName('nip').AsString;
  Edittel1.Text := data.IBQfirma.FieldByName('tel1').AsString;
  Edittel2.Text := data.IBQfirma.FieldByName('tel2').AsString;
  Editemail.Text := data.IBQfirma.FieldByName('email').AsString;
  Editwww.Text := data.IBQfirma.FieldByName('www').AsString;
end;

end.

