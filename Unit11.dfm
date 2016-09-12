object historia: Thistoria
  Left = 0
  Top = 0
  Caption = 'Historia operacji'
  ClientHeight = 547
  ClientWidth = 597
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
  object smdbgrd1: TSMDBGrid
    Left = 8
    Top = 8
    Width = 581
    Height = 249
    DataSource = data.DShistoria
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
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
        FieldName = 'DATA'
        Title.Alignment = taCenter
        Title.Caption = 'Data operacji'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOGIN'
        Title.Alignment = taCenter
        Title.Caption = 'Login u'#380'ytkownika'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STANOWISKO'
        Title.Alignment = taCenter
        Title.Caption = 'Stanowisko'
        Width = 170
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
      end>
  end
  object dbmmo1: TDBMemo
    Left = 8
    Top = 263
    Width = 581
    Height = 234
    TabStop = False
    DataField = 'OPERACJA'
    DataSource = data.DShistoria
    ReadOnly = True
    TabOrder = 1
  end
  object btnanuluj: TButton
    Left = 479
    Top = 504
    Width = 110
    Height = 35
    Caption = 'Wyjd'#378
    TabOrder = 2
    OnClick = btnanulujClick
  end
end
