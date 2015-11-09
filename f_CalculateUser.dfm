object CalculateUser: TCalculateUser
  Left = 417
  Top = 261
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
  object LBLFioUser: TsLabel
    Left = 8
    Top = 192
    Width = 96
    Height = 20
    Caption = 'LBLFioUser'
    ParentFont = False
    Visible = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
  end
  object LBLMinute: TsLabel
    Left = 8
    Top = 232
    Width = 87
    Height = 20
    Caption = 'LBLMinute'
    ParentFont = False
    Visible = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
  end
  object LBLPay: TsLabel
    Left = 8
    Top = 272
    Width = 62
    Height = 20
    Caption = 'LBLPay'
    ParentFont = False
    Visible = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
  end
  object BTNCalculate: TsBitBtn
    Left = 112
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
    Height = 241
    TabOrder = 2
    object GRIDTempDBTableView1: TcxGridDBTableView
      DataController.DataSource = Base.DSTemp
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.NewItemRowInfoText = 'Click here to add a new row'
      object GRIDTempDBTableView1fio_visitor: TcxGridDBColumn
        DataBinding.FieldName = 'fio_visitor'
      end
      object GRIDTempDBTableView1minute_visit: TcxGridDBColumn
        DataBinding.FieldName = 'minute_visit'
      end
      object GRIDTempDBTableView1pay_visit: TcxGridDBColumn
        DataBinding.FieldName = 'pay_visit'
      end
      object GRIDTempDBTableView1paysale_visit: TcxGridDBColumn
        DataBinding.FieldName = 'paysale_visit'
      end
    end
    object GRIDTempLevel1: TcxGridLevel
      GridView = GRIDTempDBTableView1
    end
  end
end
