object klienci: Tklienci
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Klienci'
  ClientHeight = 578
  ClientWidth = 838
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object btnnowy: TButton
    Left = 8
    Top = 535
    Width = 110
    Height = 35
    Caption = 'Nowy'
    TabOrder = 0
    OnClick = btnnowyClick
  end
  object btnedycja: TButton
    Left = 132
    Top = 535
    Width = 110
    Height = 35
    Caption = 'Edycja'
    TabOrder = 1
    OnClick = btnedycjaClick
  end
  object btnanuluj: TButton
    Left = 720
    Top = 535
    Width = 110
    Height = 35
    Caption = 'Wyjd'#378
    TabOrder = 2
    OnClick = btnanulujClick
  end
  object smdbgrd1: TSMDBGrid
    Left = 8
    Top = 37
    Width = 822
    Height = 481
    DataSource = data.DSklienci
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = smdbgrd1TitleClick
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
        SortType = stAscending
      end
      item
        Expanded = False
        FieldName = 'FIRMA'
        Title.Alignment = taCenter
        Title.Caption = 'Firma'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ULICA'
        Title.Alignment = taCenter
        Title.Caption = 'Ulica'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOD_POCZT'
        Title.Alignment = taCenter
        Title.Caption = 'Kod poczt.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MIEJSCOWOSC'
        Title.Alignment = taCenter
        Title.Caption = 'Miejscowo'#347#263
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEL1'
        Title.Alignment = taCenter
        Title.Caption = 'Telefon 1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEL2'
        Title.Alignment = taCenter
        Title.Caption = 'Telefon 2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Title.Alignment = taCenter
        Title.Caption = 'Email'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NIP'
        Title.Alignment = taCenter
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
  object Editszukaj: TEdit
    Left = 8
    Top = 10
    Width = 177
    Height = 24
    TabOrder = 4
    OnChange = EditszukajChange
    OnKeyPress = EditszukajKeyPress
  end
  object chkdynamiczne: TCheckBox
    Left = 191
    Top = 14
    Width = 154
    Height = 17
    Caption = 'Wyszukiwanie dynamiczne'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = chkdynamiczneClick
  end
  object btnfiltr: TButton
    Left = 755
    Top = 8
    Width = 75
    Height = 25
    Caption = 'filtr'
    TabOrder = 6
    OnClick = btnfiltrClick
  end
end
