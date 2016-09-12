object data: Tdata
  OldCreateOrder = False
  Height = 428
  Width = 575
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = '127.0.0.1:C:\Serwis\SERWIS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1250')
    LoginPrompt = False
    Left = 32
    Top = 32
  end
  object IBQuzytkownicy: TIBQuery
    Database = IBDatabase1
    Transaction = IBTuzytkownicy
    Active = True
    SQL.Strings = (
      'select first 1 * from UZYTKOWNICY where usun = 0')
    Left = 32
    Top = 104
  end
  object IBTuzytkownicy: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 192
    Top = 104
  end
  object DSuzytkownicy: TDataSource
    DataSet = IBQuzytkownicy
    Left = 112
    Top = 104
  end
  object DStemp: TDataSource
    DataSet = IBQtemp
    Left = 392
    Top = 104
  end
  object IBQtemp: TIBQuery
    Database = IBDatabase1
    Transaction = IBTtemp
    Active = True
    SQL.Strings = (
      'select first 1 * from UZYTKOWNICY')
    Left = 328
    Top = 104
  end
  object IBTtemp: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 456
    Top = 104
  end
  object IBQklienci: TIBQuery
    Database = IBDatabase1
    Transaction = IBTklienci
    Active = True
    SQL.Strings = (
      'select first 1 * from KLIENCI where usun = 0')
    Left = 32
    Top = 160
  end
  object IBTklienci: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 192
    Top = 160
  end
  object DSklienci: TDataSource
    DataSet = IBQklienci
    Left = 112
    Top = 160
  end
  object IBQfirma: TIBQuery
    Database = IBDatabase1
    Transaction = IBTfirma
    Active = True
    SQL.Strings = (
      'select * from FIRMA')
    Left = 32
    Top = 224
  end
  object IBTfirma: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 192
    Top = 224
  end
  object DSfirma: TDataSource
    DataSet = IBQfirma
    Left = 112
    Top = 224
  end
  object IBQhistoria: TIBQuery
    Database = IBDatabase1
    Transaction = IBThistoria
    Active = True
    SQL.Strings = (
      
        'select first 1 h.data, h.operacja, h.stanowisko, u.imie, u.nazwi' +
        'sko, u.login from historia h inner join uzytkownicy u on (h.id_u' +
        'ser = u.id)'
      'where h.panel=1 and h.rekord=1 order by h.data DESC')
    Left = 32
    Top = 288
  end
  object IBThistoria: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 192
    Top = 288
  end
  object DShistoria: TDataSource
    DataSet = IBQhistoria
    Left = 112
    Top = 288
  end
end
