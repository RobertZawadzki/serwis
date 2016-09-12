object main: Tmain
  Left = 0
  Top = 0
  Caption = 'Serwis'
  ClientHeight = 606
  ClientWidth = 1039
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object stat1: TStatusBar
    Left = 0
    Top = 587
    Width = 1039
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
    ExplicitTop = 591
    ExplicitWidth = 954
  end
  object pnlfiltry: TPanel
    Left = 0
    Top = 0
    Width = 1039
    Height = 87
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 1038
    object lab1: TLabel
      Left = 8
      Top = 14
      Width = 80
      Height = 16
      Caption = 'Wyszukiwanie'
    end
    object lab2: TLabel
      Left = 168
      Top = 37
      Width = 28
      Height = 16
      Caption = 'Od...'
    end
    object lab3: TLabel
      Left = 264
      Top = 37
      Width = 26
      Height = 16
      Caption = '...do'
    end
    object lab4: TLabel
      Left = 368
      Top = 14
      Width = 99
      Height = 16
      Caption = 'Status reklamacji'
    end
    object Editszukaj: TEdit
      Left = 8
      Top = 32
      Width = 145
      Height = 24
      TabOrder = 0
      Text = 'Editszukaj'
    end
    object chkdynamiczne: TCheckBox
      Left = 8
      Top = 62
      Width = 154
      Height = 17
      Caption = 'Wyszukiwanie dynamiczne'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object cbbwyborokresu: TComboBox
      Left = 168
      Top = 4
      Width = 185
      Height = 24
      Style = csDropDownList
      ItemIndex = 3
      TabOrder = 2
      Text = 'Ostanie 30 dni'
      OnChange = cbbwyborokresuChange
      Items.Strings = (
        'Aktualny miesi'#261'c'
        'Poprzedni miesi'#261'c'
        'Ostanie 7 dni'
        'Ostanie 30 dni'
        'Aktualny rok'
        'Poprzedni rok'
        'Wszystkie'
        'Dowolny okres')
    end
    object dtpod: TDateTimePicker
      Left = 168
      Top = 55
      Width = 89
      Height = 24
      Date = 42509.836303333330000000
      Time = 42509.836303333330000000
      TabOrder = 3
    end
    object dtpdo: TDateTimePicker
      Left = 264
      Top = 55
      Width = 89
      Height = 24
      Date = 42509.836303333330000000
      Time = 42509.836303333330000000
      TabOrder = 4
    end
    object cbbstatus: TComboBox
      Left = 368
      Top = 32
      Width = 185
      Height = 24
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 5
      Text = 'W trakcie'
      Items.Strings = (
        'W trakcie'
        'Nowe'
        'Realizowane'
        'Odrzucone'
        'Anulowane'
        'Zako'#324'czone'
        '(Wszystkie)')
    end
  end
  object pnlnowe: TPanel
    Left = 0
    Top = 500
    Width = 1039
    Height = 87
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 504
    ExplicitWidth = 954
    object btnnowa: TButton
      Left = 8
      Top = 16
      Width = 168
      Height = 57
      Caption = 'Nowa reklamacja'
      TabOrder = 0
    end
    object btnedycja: TButton
      Left = 182
      Top = 16
      Width = 168
      Height = 57
      Caption = 'Edycja reklamacji'
      TabOrder = 1
    end
  end
  object pnlreklamacje: TPanel
    Left = 0
    Top = 87
    Width = 797
    Height = 413
    Align = alClient
    TabOrder = 3
    ExplicitTop = 81
    ExplicitWidth = 673
    ExplicitHeight = 423
    object smdbgrd1: TSMDBGrid
      Left = 1
      Top = 1
      Width = 795
      Height = 411
      Align = alClient
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
    end
  end
  object pnlszczegoly: TPanel
    Left = 797
    Top = 87
    Width = 242
    Height = 413
    Align = alRight
    TabOrder = 4
    ExplicitLeft = 712
    ExplicitTop = 81
    ExplicitHeight = 423
  end
  object mm1: TMainMenu
    Left = 680
    Top = 576
    object Program1: TMenuItem
      Caption = 'Program'
      object Koniec1: TMenuItem
        Caption = 'Koniec'
        OnClick = Koniec1Click
      end
    end
    object Raporty1: TMenuItem
      Caption = 'Raporty'
    end
    object Kartoteki1: TMenuItem
      Caption = 'Kartoteki'
      object Klienci1: TMenuItem
        Caption = 'Klienci'
        OnClick = Klienci1Click
      end
    end
    object Ustawienia1: TMenuItem
      Caption = 'Ustawienia'
      object Uytkownicy1: TMenuItem
        Caption = 'U'#380'ytkownicy'
        OnClick = Uytkownicy1Click
      end
      object Firma1: TMenuItem
        Caption = 'Firma'
        OnClick = Firma1Click
      end
      object Konfiguracja1: TMenuItem
        Caption = 'Konfiguracja'
      end
      object Drukarki1: TMenuItem
        Caption = 'Drukarki'
      end
    end
    object Pomoc1: TMenuItem
      Caption = 'Pomoc'
      object OProgramie1: TMenuItem
        Caption = 'O Programie'
        OnClick = OProgramie1Click
      end
    end
  end
end
