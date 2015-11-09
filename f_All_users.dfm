object All_users: TAll_users
  Left = 552
  Top = 430
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080' '#1089#1080#1089#1090#1077#1084#1099
  ClientHeight = 484
  ClientWidth = 580
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
  object PANUsersMenu: TsPanel
    Left = 0
    Top = 0
    Width = 580
    Height = 97
    Align = alTop
    Color = clWindow
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object PANAddUser: TsPanel
      Left = 1
      Top = 1
      Width = 144
      Height = 95
      Align = alLeft
      Color = clWindow
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object BTNAddUser: TsBitBtn
        Left = 0
        Top = 0
        Width = 144
        Height = 96
        Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        TabOrder = 0
        OnClick = BTNAddUserClick
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 18
        Images = Res.ILPic
      end
    end
    object PANEditClient: TsPanel
      Left = 145
      Top = 1
      Width = 144
      Height = 95
      Align = alLeft
      Color = clWindow
      TabOrder = 1
      SkinData.SkinSection = 'PANEL'
      object BTNEditClient: TsBitBtn
        Left = 0
        Top = 0
        Width = 144
        Height = 96
        Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        TabOrder = 0
        OnClick = BTNEditClientClick
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 19
        Images = Res.ILPic
      end
    end
    object PANExit: TsPanel
      Left = 435
      Top = 1
      Width = 144
      Height = 95
      Align = alRight
      Color = clWindow
      TabOrder = 2
      SkinData.SkinSection = 'PANEL'
      object BTNExit: TsBitBtn
        Left = 0
        Top = 0
        Width = 144
        Height = 96
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 0
        OnClick = BTNExitClick
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 14
        Images = Res.ILPic
      end
    end
    object PANPwdChange: TsPanel
      Left = 291
      Top = 1
      Width = 144
      Height = 95
      Align = alRight
      TabOrder = 3
      SkinData.SkinSection = 'PANEL'
      object BTNPwdChange: TsBitBtn
        Left = 0
        Top = 0
        Width = 144
        Height = 96
        Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#13#10#1089#1090#1072#1085#1076#1072#1088#1090#1085#1099#1081' '#13#10#1087#1072#1088#1086#1083#1100' '#13#10#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1102
        TabOrder = 0
        OnClick = BTNPwdChangeClick
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 6
        Images = Res.ILPic
      end
    end
  end
  object GRIDAllUsers: TcxGrid
    Left = 0
    Top = 97
    Width = 580
    Height = 387
    Align = alClient
    TabOrder = 0
    object GRIDGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = Base.DSAlUsers
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.NewItemRowInfoText = 'Click here to add a new row'
      object GRIDGrid1DBTableView1login_user: TcxGridDBColumn
        Caption = #1051#1086#1075#1080#1085' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        Width = 150
        DataBinding.FieldName = 'login_user'
      end
      object GRIDGrid1DBTableView1fio_user: TcxGridDBColumn
        Caption = #1060#1048#1054' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        DataBinding.FieldName = 'fio_user'
      end
    end
    object GRIDLVLGrid1Level1: TcxGridLevel
      GridView = GRIDGrid1DBTableView1
    end
  end
end
