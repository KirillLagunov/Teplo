object Settings: TSettings
  Left = 481
  Top = 242
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 336
  ClientWidth = 363
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GRBUserSettings: TsGroupBox
    Left = 0
    Top = 0
    Width = 363
    Height = 113
    Align = alTop
    Caption = '   '#1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081'   '
    TabOrder = 0
    CaptionLayout = clTopCenter
    SkinData.SkinSection = 'GROUPBOX'
    object BTNUsers: TsBitBtn
      Left = 8
      Top = 24
      Width = 169
      Height = 73
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080#13#10' '#1089#1080#1089#1090#1077#1084#1099
      TabOrder = 0
      OnClick = BTNUsersClick
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 22
      Images = Res.ILPic
      Reflected = True
    end
  end
  object GRBBaseSettings: TsGroupBox
    Left = 0
    Top = 113
    Width = 363
    Height = 112
    Align = alTop
    Caption = '   '#1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093'   '
    TabOrder = 1
    CaptionLayout = clTopCenter
    SkinData.SkinSection = 'GROUPBOX'
    object BTNBaseBackup: TsBitBtn
      Left = 8
      Top = 23
      Width = 169
      Height = 73
      Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1088#1077#1079#1077#1088#1074#1085#1086#1081' '#13#10#1082#1086#1087#1080#1080' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
      TabOrder = 0
      OnClick = BTNBaseBackupClick
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 34
      Images = Res.ILPic
      Reflected = True
    end
    object BTNResetBase: TsBitBtn
      Left = 184
      Top = 24
      Width = 169
      Height = 73
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100#13#10' '#1073#1072#1079#1091' '#1076#1072#1085#1085#1099#1093#13#10' '#1080#1079' '#1088#1077#1079#1077#1088#1074#1085#1086#1081' '#1082#1086#1087#1080#1080
      Enabled = False
      TabOrder = 1
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 33
      Images = Res.ILPic
      Reflected = True
    end
  end
  object GRBOtherSettings: TsGroupBox
    Left = 0
    Top = 225
    Width = 363
    Height = 112
    Align = alTop
    Caption = '   '#1054#1089#1090#1072#1083#1100#1085#1099#1077' '#1092#1091#1085#1082#1094#1080#1080'   '
    TabOrder = 2
    CaptionLayout = clTopCenter
    SkinData.SkinSection = 'GROUPBOX'
    object BTNShowHistory: TsBitBtn
      Left = 8
      Top = 24
      Width = 169
      Height = 73
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1080#1089#1090#1086#1088#1080#1102#13#10' '#1087#1086' '#1089#1084#1077#1085#1072#1084
      TabOrder = 0
      OnClick = BTNShowHistoryClick
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 35
      Images = Res.ILPic
      Reflected = True
    end
    object BTNShowStat: TsBitBtn
      Left = 184
      Top = 24
      Width = 169
      Height = 73
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088#13#10' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080
      Enabled = False
      TabOrder = 1
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 23
      Images = Res.ILPic
      Reflected = True
    end
  end
end
