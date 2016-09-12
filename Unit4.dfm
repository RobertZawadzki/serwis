object uzytkownicy: Tuzytkownicy
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'U'#380'ytkownicy - Serwis'
  ClientHeight = 460
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 328
    Width = 25
    Height = 16
    Caption = 'Opis'
  end
  object btnnowy: TButton
    Left = 8
    Top = 417
    Width = 110
    Height = 35
    Caption = 'Nowy'
    TabOrder = 0
    OnClick = btnnowyClick
  end
  object btnedycja: TButton
    Left = 124
    Top = 417
    Width = 110
    Height = 35
    Caption = 'Edytuj'
    TabOrder = 1
    OnClick = btnedycjaClick
  end
  object btnanuluj: TButton
    Left = 554
    Top = 417
    Width = 110
    Height = 35
    Caption = 'Wyjd'#378
    TabOrder = 2
    OnClick = btnanulujClick
  end
  object smdbgrd1: TSMDBGrid
    Left = 8
    Top = 8
    Width = 656
    Height = 314
    DataSource = data.DSuzytkownicy
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = pm1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Flat = False
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'Tahoma'
    BandsFont.Style = []
    Groupings = <>
    GridStyle.Style = gsCustom
    GridStyle.OddColor = clWindow
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoFilterAutoApply]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 20
    ScrollBars = ssHorizontal
    Columns = <
      item
        Expanded = False
        FieldName = 'LOGIN'
        Title.Alignment = taCenter
        Title.Caption = 'Login'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMIE'
        Title.Alignment = taCenter
        Title.Caption = 'Imi'#281
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAZWISKO'
        Title.Alignment = taCenter
        Title.Caption = 'Nazwisko'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STANOWISKO'
        Title.Alignment = taCenter
        Title.Caption = 'Stanowisko'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_UTWORZENIA'
        Title.Alignment = taCenter
        Title.Caption = 'Data utworzenia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AKTYWNY'
        Title.Alignment = taCenter
        Title.Caption = 'Aktywny'
        Visible = True
        InplaceEditor = ieCheckbox
      end>
  end
  object dbmmo1: TDBMemo
    Left = 8
    Top = 350
    Width = 656
    Height = 49
    DataField = 'OPIS'
    DataSource = data.DSuzytkownicy
    ReadOnly = True
    TabOrder = 4
  end
  object pm1: TPopupMenu
    Left = 424
    Top = 416
    object Historiaoperacji1: TMenuItem
      Caption = 'Historia operacji'
      OnClick = Historiaoperacji1Click
    end
  end
end
