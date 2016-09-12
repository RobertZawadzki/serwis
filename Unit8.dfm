object nowy_klient: Tnowy_klient
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Nowy Klient'
  ClientHeight = 403
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 25
    Height = 16
    Caption = 'Imi'#281
  end
  object Label2: TLabel
    Left = 279
    Top = 8
    Width = 67
    Height = 16
    Caption = 'Nazwisko*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 64
    Width = 33
    Height = 16
    Caption = 'Firma'
  end
  object Label4: TLabel
    Left = 8
    Top = 120
    Width = 27
    Height = 16
    Caption = 'Ulica'
  end
  object Label5: TLabel
    Left = 245
    Top = 120
    Width = 59
    Height = 16
    Caption = 'Kod poczt.'
  end
  object Label6: TLabel
    Left = 312
    Top = 120
    Width = 72
    Height = 16
    Caption = 'Miejscowo'#347#263
  end
  object Label7: TLabel
    Left = 8
    Top = 176
    Width = 63
    Height = 16
    Caption = 'Telefon1*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 161
    Top = 176
    Width = 50
    Height = 16
    Caption = 'Telefon2'
  end
  object Label9: TLabel
    Left = 312
    Top = 176
    Width = 31
    Height = 16
    Caption = 'email'
  end
  object Label10: TLabel
    Left = 8
    Top = 232
    Width = 19
    Height = 16
    Caption = 'NIP'
  end
  object Label11: TLabel
    Left = 8
    Top = 338
    Width = 102
    Height = 16
    Caption = '* pola wymagane'
  end
  object btndodaj: TButton
    Left = 8
    Top = 360
    Width = 110
    Height = 35
    Caption = 'Dodaj'
    TabOrder = 11
    OnClick = btndodajClick
  end
  object btnanuluj: TButton
    Left = 451
    Top = 360
    Width = 110
    Height = 35
    Caption = 'Anuluj'
    TabOrder = 12
    OnClick = btnanulujClick
  end
  object chkaktywny: TCheckBox
    Left = 8
    Top = 288
    Width = 97
    Height = 17
    Caption = 'Aktywny'
    Checked = True
    Enabled = False
    State = cbChecked
    TabOrder = 10
  end
  object Editimie: TEdit
    Left = 8
    Top = 32
    Width = 265
    Height = 24
    MaxLength = 30
    TabOrder = 0
    Text = 'Editimie'
  end
  object Editnazwisko: TEdit
    Left = 279
    Top = 32
    Width = 282
    Height = 24
    MaxLength = 30
    TabOrder = 1
    Text = 'Editnazwisko'
    OnChange = EditnazwiskoChange
  end
  object Editfirma: TEdit
    Left = 8
    Top = 88
    Width = 553
    Height = 24
    MaxLength = 100
    TabOrder = 2
    Text = 'Editfirma'
  end
  object Editulica: TEdit
    Left = 8
    Top = 144
    Width = 231
    Height = 24
    MaxLength = 30
    TabOrder = 3
    Text = 'Editulica'
  end
  object Editkodpoczt: TEdit
    Left = 245
    Top = 144
    Width = 60
    Height = 24
    MaxLength = 10
    TabOrder = 4
    Text = 'Editkodpoczt'
  end
  object Editmiejscowosc: TEdit
    Left = 312
    Top = 144
    Width = 249
    Height = 24
    MaxLength = 30
    TabOrder = 5
    Text = 'Editmiejscowosc'
  end
  object Edittel1: TEdit
    Left = 8
    Top = 200
    Width = 145
    Height = 24
    MaxLength = 20
    TabOrder = 6
    Text = 'Edittel1'
    OnChange = Edittel1Change
  end
  object Edittel2: TEdit
    Left = 161
    Top = 200
    Width = 145
    Height = 24
    MaxLength = 20
    TabOrder = 7
    Text = 'Edittel2'
  end
  object Editemail: TEdit
    Left = 312
    Top = 200
    Width = 249
    Height = 24
    MaxLength = 50
    TabOrder = 8
    Text = 'Editemail'
  end
  object Editnip: TEdit
    Left = 8
    Top = 256
    Width = 145
    Height = 24
    MaxLength = 20
    TabOrder = 9
    Text = 'Editnip'
  end
end
