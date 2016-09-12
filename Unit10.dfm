object firma: Tfirma
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Firma'
  ClientHeight = 285
  ClientWidth = 481
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
    Width = 38
    Height = 16
    Caption = 'Nazwa'
  end
  object Label2: TLabel
    Left = 8
    Top = 60
    Width = 27
    Height = 16
    Caption = 'Ulica'
  end
  object Label3: TLabel
    Left = 206
    Top = 60
    Width = 59
    Height = 16
    Caption = 'Kod poczt.'
  end
  object Label4: TLabel
    Left = 280
    Top = 60
    Width = 72
    Height = 16
    Caption = 'Miejscowo'#347#263
  end
  object Label5: TLabel
    Left = 8
    Top = 112
    Width = 19
    Height = 16
    Caption = 'NIP'
  end
  object Label6: TLabel
    Left = 152
    Top = 112
    Width = 54
    Height = 16
    Caption = 'Telefon 1'
  end
  object Label7: TLabel
    Left = 312
    Top = 112
    Width = 54
    Height = 16
    Caption = 'Telefon 2'
  end
  object Label8: TLabel
    Left = 8
    Top = 164
    Width = 31
    Height = 16
    Caption = 'email'
  end
  object Label9: TLabel
    Left = 239
    Top = 164
    Width = 30
    Height = 16
    Caption = 'www'
  end
  object btnzapisz: TButton
    Left = 8
    Top = 242
    Width = 110
    Height = 35
    Caption = 'Zapisz'
    TabOrder = 9
    OnClick = btnzapiszClick
  end
  object btnanuluj: TButton
    Left = 363
    Top = 242
    Width = 110
    Height = 35
    Caption = 'Wyjd'#378
    TabOrder = 10
    OnClick = btnanulujClick
  end
  object Editnazwa: TEdit
    Left = 8
    Top = 30
    Width = 465
    Height = 24
    MaxLength = 100
    TabOrder = 0
    Text = 'Editnazwa'
  end
  object Editulica: TEdit
    Left = 8
    Top = 82
    Width = 192
    Height = 24
    MaxLength = 30
    TabOrder = 1
    Text = 'Editulica'
  end
  object Editkodpoczt: TEdit
    Left = 206
    Top = 82
    Width = 68
    Height = 24
    MaxLength = 10
    TabOrder = 2
    Text = 'Editkodpoczt'
  end
  object Editmiejscowosc: TEdit
    Left = 280
    Top = 82
    Width = 193
    Height = 24
    MaxLength = 30
    TabOrder = 3
    Text = 'Editmiejscowosc'
  end
  object Editnip: TEdit
    Left = 8
    Top = 134
    Width = 138
    Height = 24
    MaxLength = 20
    TabOrder = 4
    Text = 'Editnip'
  end
  object Edittel1: TEdit
    Left = 152
    Top = 134
    Width = 154
    Height = 24
    MaxLength = 20
    TabOrder = 5
    Text = 'Edittel1'
  end
  object Edittel2: TEdit
    Left = 312
    Top = 134
    Width = 161
    Height = 24
    MaxLength = 20
    TabOrder = 6
    Text = 'Edittel2'
  end
  object Editemail: TEdit
    Left = 8
    Top = 186
    Width = 225
    Height = 24
    MaxLength = 30
    TabOrder = 7
    Text = 'Editemail'
  end
  object Editwww: TEdit
    Left = 239
    Top = 186
    Width = 234
    Height = 24
    MaxLength = 30
    TabOrder = 8
    Text = 'Editwww'
  end
end
