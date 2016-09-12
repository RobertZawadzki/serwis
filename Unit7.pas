unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, SMDBGrid, IniFiles, DB;

type
  Tklienci = class(TForm)
    btnnowy: TButton;
    btnedycja: TButton;
    btnanuluj: TButton;
    smdbgrd1: TSMDBGrid;
    Editszukaj: TEdit;
    chkdynamiczne: TCheckBox;
    btnfiltr: TButton;
    procedure btnanulujClick(Sender: TObject);
    procedure btnnowyClick(Sender: TObject);
    procedure btnedycjaClick(Sender: TObject);
    procedure chkdynamiczneClick(Sender: TObject);
    procedure btnfiltrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure smdbgrd1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure EditszukajChange(Sender: TObject);
    procedure EditszukajKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    sortowanie: string;
    bookmark: TBookmark;
  end;

var
  klienci: Tklienci;
  INI: TIniFile;

implementation

uses
  Unit8, Unit9, Unit6, Unit2, Unit1;

{$R *.dfm}

procedure Tklienci.btnanulujClick(Sender: TObject);
begin
  Close;
end;

procedure Tklienci.btnedycjaClick(Sender: TObject);
begin
  edit_klient.id := data.IBQklienci.FieldByName('id').AsInteger;
  edit_klient.Editimie.Text := data.IBQklienci.FieldByName('imie').AsString;
  edit_klient.Editnazwisko.Text := data.IBQklienci.FieldByName('nazwisko').AsString;
  edit_klient.Editfirma.Text := data.IBQklienci.FieldByName('firma').AsString;
  edit_klient.Editulica.Text := data.IBQklienci.FieldByName('ulica').AsString;
  edit_klient.Editkodpoczt.Text := data.IBQklienci.FieldByName('kod_poczt').AsString;
  edit_klient.Editmiejscowosc.Text := data.IBQklienci.FieldByName('miejscowosc').AsString;
  edit_klient.Edittel1.Text := data.IBQklienci.FieldByName('tel1').AsString;
  edit_klient.Edittel2.Text := data.IBQklienci.FieldByName('tel2').AsString;
  edit_klient.Editemail.Text := data.IBQklienci.FieldByName('email').AsString;
  edit_klient.Editnip.Text := data.IBQklienci.FieldByName('nip').AsString;
  edit_klient.chkaktywny.Checked := Boolean(data.IBQklienci.FieldByName('aktywny').AsInteger);

  edit_klient.Left := klienci.Left + 50;
  edit_klient.Top := klienci.Top + 50;

  edit_klient.ShowModal;
end;

procedure Tklienci.btnfiltrClick(Sender: TObject);
var
  szukaj: string;
begin
  szukaj := Editszukaj.Text;
  with data.IBQklienci, SQL do
  begin
    Close;
    Clear;
    Add('select id, imie, nazwisko, firma, ulica, kod_poczt, miejscowosc, tel1,');
    Add('tel2, email, nip, aktywny, usun, data_utworzenia from klienci');
    Add('where usun=:usun');
    if Editszukaj.Text <> '' then
      Add('and Upper(imie) like :s or Upper(nazwisko) like :s or Upper(firma) like :s or Upper(ulica) like :s or Upper(kod_poczt) like :s or Upper(miejscowosc) like :s or Upper(tel1) like :s or Upper(tel2) like :s or Upper(email) like :s or Upper(nip) like :s');
    Add(sortowanie);

    ParamByName('usun').AsInteger := 0;
    if Editszukaj.Text <> '' then
      ParamByName('s').AsString := '%' + UpperCase(szukaj) + '%';
    Open;
    First;
  end;
end;

procedure Tklienci.btnnowyClick(Sender: TObject);
begin
  nowy_klient.Left := klienci.Left + 50;
  nowy_klient.Top := klienci.Top + 50;

  nowy_klient.ShowModal;
end;

procedure Tklienci.chkdynamiczneClick(Sender: TObject);
begin
  INI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'serwis.ini');
  try
    INI.WriteBool('ustawienia', 'klienci_dynamicznie', chkdynamiczne.Checked);
  finally
    INI.Free;
  end;

  logowanie.klienci_dynamicznie := chkdynamiczne.Checked;
end;

procedure Tklienci.EditszukajChange(Sender: TObject);
begin
  if logowanie.klienci_dynamicznie then
    btnfiltr.Click;
end;

procedure Tklienci.EditszukajKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key = #13) and (logowanie.klienci_dynamicznie = False)) then
  begin
    btnfiltr.Click;
    Key := #0;
  end;
end;

procedure Tklienci.FormCreate(Sender: TObject);
begin
  sortowanie := 'ORDER By nazwisko';
end;

procedure Tklienci.FormShow(Sender: TObject);
begin
  if data.IBQklienci.RecordCount <> 0 then
    btnedycja.Enabled := True
  else
    btnedycja.Enabled := False;

  Editszukaj.Text := '';
  Editszukaj.SetFocus;
end;

procedure Tklienci.smdbgrd1TitleClick(Column: TColumn);
var
  artybut: string;
begin
  try
    bookmark := data.IBQklienci.GetBookmark;
    smdbgrd1.DataSource.DataSet.DisableControls;

    if Column is TSMDBColumn then
    begin
      if TSMDBColumn(Column).SortType = stDescending then
      begin
        (Column.Grid as TSMDBGrid).ClearSort;
        TSMDBColumn(Column).SortType := stAscending;
        artybut := Column.Title.Caption;
        if artybut = 'Imiê' then
          sortowanie := 'Order by imie ASC';
        if artybut = 'Nazwisko' then
          sortowanie := 'Order by nazwisko ASC';
        if artybut = 'Firma' then
          sortowanie := 'Order by firma ASC';
        if artybut = 'Ulica' then
          sortowanie := 'Order by ulica ASC';
        if artybut = 'Kod poczt.' then
          sortowanie := 'Order by kod_poczt ASC';
        if artybut = 'Miejscowoœæ' then
          sortowanie := 'Order by miejscowosc ASC';
        if artybut = 'Telefon 1' then
          sortowanie := 'Order by tel1 ASC';
        if artybut = 'Telefon 2' then
          sortowanie := 'Order by tel2 ASC';
        if artybut = 'Email' then
          sortowanie := 'Order by email ASC';
        if artybut = 'NIP' then
          sortowanie := 'Order by nip ASC';
        if artybut = 'Aktywny' then
          sortowanie := 'Order by aktywny ASC';
        btnfiltr.Click;
      end
      else
      begin
        (Column.Grid as TSMDBGrid).ClearSort;
        TSMDBColumn(Column).SortType := stDescending;
        artybut := Column.Title.Caption;
        if artybut = 'Imiê' then
          sortowanie := 'Order by imie DESC';
        if artybut = 'Nazwisko' then
          sortowanie := 'Order by nazwisko DESC';
        if artybut = 'Firma' then
          sortowanie := 'Order by firma DESC';
        if artybut = 'Ulica' then
          sortowanie := 'Order by ulica DESC';
        if artybut = 'Kod poczt.' then
          sortowanie := 'Order by kod_poczt DESC';
        if artybut = 'Miejscowoœæ' then
          sortowanie := 'Order by miejscowosc DESC';
        if artybut = 'Telefon 1' then
          sortowanie := 'Order by tel1 DESC';
        if artybut = 'Telefon 2' then
          sortowanie := 'Order by tel2 DESC';
        if artybut = 'Email' then
          sortowanie := 'Order by email DESC';
        if artybut = 'NIP' then
          sortowanie := 'Order by nip DESC';
        if artybut = 'Aktywny' then
          sortowanie := 'Order by aktywny DESC';
        btnfiltr.Click;
      end;
    end;

  finally
    smdbgrd1.RefreshData;
    data.IBQklienci.GotoBookmark(bookmark);
    smdbgrd1.DataSource.DataSet.EnableControls;
  end;
end;

end.

