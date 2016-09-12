object edit_user: Tedit_user
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Edycja u'#380'ytkownika - Serwis'
  ClientHeight = 324
  ClientWidth = 424
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
    Width = 42
    Height = 16
    Caption = 'Login*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 207
    Top = 8
    Width = 44
    Height = 16
    Caption = 'Has'#322'o*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 25
    Height = 16
    Caption = 'Imi'#281
  end
  object Label4: TLabel
    Left = 207
    Top = 58
    Width = 53
    Height = 16
    Caption = 'Nazwisko'
  end
  object Label5: TLabel
    Left = 8
    Top = 104
    Width = 82
    Height = 16
    Caption = 'Stanowisko*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 152
    Width = 25
    Height = 16
    Caption = 'Opis'
  end
  object Label7: TLabel
    Left = 8
    Top = 261
    Width = 102
    Height = 16
    Caption = '* pola wymagane'
  end
  object btnzapisz: TButton
    Left = 8
    Top = 281
    Width = 110
    Height = 35
    Caption = 'Zapisz'
    TabOrder = 7
    OnClick = btnzapiszClick
  end
  object btnanuluj: TButton
    Left = 307
    Top = 281
    Width = 110
    Height = 35
    Caption = 'Anuluj'
    TabOrder = 8
    OnClick = btnanulujClick
  end
  object cbbstanowisko: TComboBox
    Left = 8
    Top = 124
    Width = 240
    Height = 24
    Style = csDropDownList
    TabOrder = 4
    OnChange = cbbstanowiskoChange
    Items.Strings = (
      'Administrator'
      'Kierownik'
      'Serwisant')
  end
  object Editlogin: TEdit
    Left = 8
    Top = 28
    Width = 193
    Height = 24
    MaxLength = 30
    TabOrder = 0
    Text = 'Editlogin'
    OnChange = EditloginChange
  end
  object Edithaslo: TEdit
    Left = 207
    Top = 28
    Width = 210
    Height = 24
    MaxLength = 100
    PasswordChar = '*'
    TabOrder = 1
    Text = 'Edithaslo'
    OnChange = EdithasloChange
  end
  object Editimie: TEdit
    Left = 8
    Top = 74
    Width = 193
    Height = 24
    MaxLength = 30
    TabOrder = 2
    Text = 'Editimie'
  end
  object Editnazwisko: TEdit
    Left = 207
    Top = 74
    Width = 210
    Height = 24
    MaxLength = 30
    TabOrder = 3
    Text = 'Editnazwisko'
  end
  object mmoopis: TMemo
    Left = 8
    Top = 172
    Width = 409
    Height = 50
    Lines.Strings = (
      'mmoopis')
    MaxLength = 250
    TabOrder = 5
  end
  object chkaktywny: TCheckBox
    Left = 8
    Top = 232
    Width = 97
    Height = 17
    Caption = 'Aktywny'
    TabOrder = 6
  end
end
