object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Romulus Viewer'
  ClientHeight = 620
  ClientWidth = 889
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    889
    620)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 158
    Top = 0
    Width = 30
    Height = 13
    Caption = 'Profile'
  end
  object OpenDatafileButton: TButton
    Left = 3
    Top = 13
    Width = 121
    Height = 25
    Caption = 'Open Datafile'
    TabOrder = 0
    OnClick = OpenDatafileButtonClick
  end
  object ProfileComboBox: TComboBox
    Left = 158
    Top = 15
    Width = 187
    Height = 21
    AutoComplete = False
    Style = csDropDownList
    TabOrder = 1
    OnChange = ProfileComboBoxChange
  end
  object GamesListView: TVirtualStringTree
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 883
    Height = 573
    Margins.Top = 44
    Align = alClient
    Header.AutoSizeIndex = 0
    Header.Options = [hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
    TabOrder = 2
    TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toThemeAware, toUseBlendedImages]
    OnGetText = GamesListViewGetText
    Columns = <
      item
        Position = 0
        Text = 'Description'
        Width = 267
      end
      item
        Position = 1
        Text = 'Folder'
        Width = 170
      end
      item
        Position = 2
        Text = 'Clone of'
        Width = 286
      end>
  end
  object ExportButton: TButton
    Left = 773
    Top = 13
    Width = 113
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Export'
    TabOrder = 3
    OnClick = ExportButtonClick
  end
  object ABSTable1: TABSTable
    CurrentVersion = '7.92 '
    InMemory = False
    ReadOnly = False
    Exclusive = False
    Left = 472
    Top = 328
  end
  object ABSDatabase1: TABSDatabase
    CurrentVersion = '7.92 '
    Exclusive = False
    MaxConnections = 500
    MultiUser = False
    SessionName = 'Default'
    Left = 744
    Top = 448
  end
  object DatabaseOpenDialog: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 552
    Top = 192
  end
  object ProfilesDataSource: TDataSource
    Left = 160
    Top = 64
  end
end
