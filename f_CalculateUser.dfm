object CalculateUser: TCalculateUser
  Left = 380
  Top = 296
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1072#1089#1095#1077#1090' '#1087#1086#1089#1077#1090#1080#1090#1077#1083#1103
  ClientHeight = 305
  ClientWidth = 584
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
  object BTNCalculate: TsBitBtn
    Left = 88
    Top = 248
    Width = 169
    Height = 49
    Caption = #1056#1072#1089#1095#1080#1090#1072#1090#1100
    TabOrder = 0
    OnClick = BTNCalculateClick
    SkinData.SkinSection = 'BUTTON'
    ImageIndex = 24
    Images = Res.ILPic
  end
  object BTNCancel: TsBitBtn
    Left = 320
    Top = 248
    Width = 169
    Height = 49
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = BTNCancelClick
    SkinData.SkinSection = 'BUTTON'
    ImageIndex = 14
    Images = Res.ILPic
  end
  object GRIDTemp: TcxGrid
    Left = 0
    Top = 0
    Width = 585
    Height = 225
    TabOrder = 2
    object GRIDTempDBTableView1: TcxGridDBTableView
      DataController.DataSource = Base.DSTemp
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'paysale_visit'
          Column = GRIDTempDBTableView1paysale_visit
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      OptionsView.NewItemRowInfoText = 'Click here to add a new row'
      object GRIDTempDBTableView1fio_visitor: TcxGridDBColumn
        Caption = #1060#1048#1054' '#1087#1086#1089#1077#1090#1080#1090#1077#1083#1103
        Options.Filtering = False
        Options.Grouping = False
        Options.Sorting = False
        Width = 299
        DataBinding.FieldName = 'fio_visitor'
      end
      object GRIDTempDBTableView1dt_calc: TcxGridDBColumn
        Caption = #1042#1088#1077#1084#1103' '#1074' '#1090#1077#1087#1083#1077
        Options.Filtering = False
        Width = 91
        DataBinding.FieldName = 'dt_calc'
      end
      object GRIDTempDBTableView1pay_visit: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072
        Options.Filtering = False
        Width = 65
        DataBinding.FieldName = 'pay_visit'
      end
      object GRIDTempDBTableView1paysale_visit: TcxGridDBColumn
        Caption = #1050' '#1086#1087#1083#1072#1090#1077#13#10'('#1089' '#1091#1095#1077#1090#1086#1084' '#1089#1082#1080#1076#1082#1080')'
        Options.Filtering = False
        Width = 116
        DataBinding.FieldName = 'paysale_visit'
      end
    end
    object GRIDTempLevel1: TcxGridLevel
      GridView = GRIDTempDBTableView1
    end
  end
end
