unit Unit2;

interface

uses
  SysUtils, Classes, DB, IBDatabase, IBCustomDataSet, IBQuery;

type
  Tdata = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBQuzytkownicy: TIBQuery;
    IBTuzytkownicy: TIBTransaction;
    DSuzytkownicy: TDataSource;
    DStemp: TDataSource;
    IBQtemp: TIBQuery;
    IBTtemp: TIBTransaction;
    IBQklienci: TIBQuery;
    IBTklienci: TIBTransaction;
    DSklienci: TDataSource;
    IBQfirma: TIBQuery;
    IBTfirma: TIBTransaction;
    DSfirma: TDataSource;
    IBQhistoria: TIBQuery;
    IBThistoria: TIBTransaction;
    DShistoria: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  data: Tdata;

implementation

{$R *.dfm}

end.
