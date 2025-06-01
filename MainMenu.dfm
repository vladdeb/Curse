object mnMain: TmnMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'BsuirGuide'
  ClientHeight = 445
  ClientWidth = 610
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object butClose: TButton
    Left = 200
    Top = 264
    Width = 199
    Height = 34
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 0
    OnClick = butCloseClick
  end
  object butPathMenu: TButton
    Left = 200
    Top = 224
    Width = 199
    Height = 34
    Caption = #1053#1072#1081#1090#1080' '#1087#1091#1090#1100
    TabOrder = 1
    OnClick = butPathMenuClick
  end
  object butClassMenu: TButton
    Left = 200
    Top = 184
    Width = 199
    Height = 34
    Caption = #1053#1072#1081#1090#1080' '#1072#1091#1076#1080#1090#1086#1088#1080#1102
    TabOrder = 2
    OnClick = butClassMenuClick
  end
end
