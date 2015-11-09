object History: THistory
  Left = 286
  Top = 395
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1048#1089#1090#1086#1088#1080#1103
  ClientHeight = 398
  ClientWidth = 902
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
  object GRBSessions: TsGroupBox
    Left = 0
    Top = 0
    Width = 902
    Height = 161
    Align = alTop
    Caption = '   '#1057#1084#1077#1085#1099'   '
    TabOrder = 0
    CaptionLayout = clTopCenter
    SkinData.SkinSection = 'GROUPBOX'
    object GRIDSessions: TcxGrid
      Left = 2
      Top = 15
      Width = 898
      Height = 144
      Align = alClient
      TabOrder = 0
      object GRIDSessionsDBTableView1: TcxGridDBTableView
        DataController.DataSource = Base.DSAllSessions
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        OptionsView.Indicator = True
        OptionsView.NewItemRowInfoText = 'Click here to add a new row'
        object GRIDSessionsDBTableView1date_session: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1084#1077#1085#1099
          DataBinding.FieldName = 'date_session'
        end
        object GRIDSessionsDBTableView1start_session: TcxGridDBColumn
          Caption = #1054#1090#1082#1088#1099#1090#1080#1077' '#1089#1084#1077#1085#1099
          DataBinding.FieldName = 'start_session'
        end
        object GRIDSessionsDBTableView1end_session: TcxGridDBColumn
          Caption = #1047#1072#1082#1088#1099#1090#1080#1077' '#1089#1084#1077#1085#1099
          DataBinding.FieldName = 'end_session'
        end
      end
      object GRIDSessionsLevel1: TcxGridLevel
        GridView = GRIDSessionsDBTableView1
      end
    end
    object DBEDITSession: TsDBEdit
      Left = 888
      Top = 40
      Width = 9
      Height = 21
      DataField = 'id_session'
      DataSource = Base.DSAllSessions
      TabOrder = 1
      Visible = False
      OnChange = DBEDITSessionChange
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
  end
  object GRBVisitors: TsGroupBox
    Left = 0
    Top = 161
    Width = 902
    Height = 237
    Align = alClient
    Caption = '  '#1054#1087#1080#1089#1072#1085#1080#1077' '#1089#1084#1077#1085#1099'   '
    TabOrder = 1
    CaptionLayout = clTopCenter
    SkinData.SkinSection = 'GROUPBOX'
    object GRIDWork: TcxGrid
      Left = 2
      Top = 15
      Width = 898
      Height = 220
      Align = alClient
      TabOrder = 0
      object GRIDWorkDBTableView1: TcxGridDBTableView
        DataController.DataSource = Base.DSHistory
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skSum
            FieldName = 'end_summ_visit'
            Column = GRIDWorkDBTableView1end_summ_visit
          end
          item
            Kind = skSum
            FieldName = 'summ_visit'
            Column = GRIDWorkDBTableView1summ_visit
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        OptionsView.Indicator = True
        OptionsView.NewItemRowInfoText = 'Click here to add a new row'
        object GRIDWorkDBTableView1name_visitor: TcxGridDBColumn
          Caption = #1055#1086#1089#1077#1090#1080#1090#1077#1083#1100
          Width = 200
          DataBinding.FieldName = 'name_visitor'
        end
        object GRIDWorkDBTableView1begin_visit: TcxGridDBColumn
          Caption = #1055#1088#1080#1096#1077#1083
          DataBinding.FieldName = 'begin_visit'
        end
        object GRIDWorkDBTableView1end_visit: TcxGridDBColumn
          Caption = #1059#1096#1077#1083
          DataBinding.FieldName = 'end_visit'
        end
        object GRIDWorkDBTableView1TimeVisit: TcxGridDBColumn
          Caption = #1055#1088#1086#1074#1077#1083' '#1074#1088#1077#1084#1077#1085#1080
          DataBinding.FieldName = 'TimeVisit'
        end
        object GRIDWorkDBTableView1summ_visit: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072
          DataBinding.FieldName = 'summ_visit'
        end
        object GRIDWorkDBTableView1discount_visit: TcxGridDBColumn
          Caption = #1057#1082#1080#1076#1082#1072
          DataBinding.FieldName = 'discount_visit'
        end
        object GRIDWorkDBTableView1end_summ_visit: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072' ('#1089' '#1091#1095#1077#1090#1086#1084' '#1089#1082#1080#1076#1082#1080')'
          Width = 150
          DataBinding.FieldName = 'end_summ_visit'
        end
      end
      object GRIDWorkLevel1: TcxGridLevel
        GridView = GRIDWorkDBTableView1
      end
    end
  end
end
