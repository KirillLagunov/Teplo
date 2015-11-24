object Base: TBase
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 189
  Top = 369
  Height = 417
  Width = 797
  object conBase: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\teplo\base\base.' +
      'mdb;Persist Security Info=False;Jet OLEDB:Database Password=Tepl' +
      'o51;'
    KeepConnection = False
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 16
    Top = 8
  end
  object SQLUsers: TADOQuery
    Connection = conBase
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM ShowUsers')
    Left = 72
    Top = 8
    object SQLUsersid_user: TAutoIncField
      FieldName = 'id_user'
      ReadOnly = True
    end
    object SQLUserslogin_user: TWideStringField
      FieldName = 'login_user'
      Size = 50
    end
    object SQLUserspwd_user: TWideStringField
      FieldName = 'pwd_user'
      Size = 50
    end
    object SQLUsersfio_user: TWideStringField
      FieldName = 'fio_user'
      Size = 50
    end
    object SQLUsersid_roul: TIntegerField
      FieldName = 'id_roul'
    end
    object SQLUsersname_roul: TWideStringField
      FieldName = 'name_roul'
      Size = 50
    end
  end
  object SQLAllUsers: TADOQuery
    Connection = conBase
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM ShowAllUsers')
    Left = 152
    Top = 8
    object SQLAllUserslogin_user: TWideStringField
      FieldName = 'login_user'
      Size = 50
    end
    object SQLAllUsersfio_user: TWideStringField
      FieldName = 'fio_user'
      Size = 50
    end
    object SQLAllUsersid_user: TAutoIncField
      FieldName = 'id_user'
      ReadOnly = True
    end
  end
  object DSAlUsers: TDataSource
    DataSet = SQLAllUsers
    Left = 152
    Top = 64
  end
  object SQLShowRouls: TADOQuery
    Connection = conBase
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM ShowRouls')
    Left = 224
    Top = 8
    object SQLShowRoulsid_roul: TAutoIncField
      FieldName = 'id_roul'
      ReadOnly = True
    end
    object SQLShowRoulsname_roul: TWideStringField
      FieldName = 'name_roul'
      Size = 50
    end
  end
  object DSShowRouls: TDataSource
    DataSet = SQLShowRouls
    Left = 224
    Top = 64
  end
  object SQLEdit: TADOQuery
    Connection = conBase
    Parameters = <>
    Left = 472
    Top = 64
  end
  object SQLCurrentSession: TADOQuery
    Connection = conBase
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dat'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Sessions.date_session, Sessions.id_session, Sessions.stat' +
        'e_session'
      'FROM Sessions'
      
        'WHERE (((Sessions.date_session)=:dat) AND ((Sessions.state_sessi' +
        'on)<>1));')
    Left = 472
    Top = 8
    object SQLCurrentSessiondate_session: TDateTimeField
      FieldName = 'date_session'
    end
    object SQLCurrentSessionstate_session: TIntegerField
      FieldName = 'state_session'
    end
    object SQLCurrentSessionid_session: TAutoIncField
      FieldName = 'id_session'
      ReadOnly = True
    end
  end
  object SQLVisitCurrentSession: TADOQuery
    Connection = conBase
    CursorType = ctStatic
    OnCalcFields = SQLVisitCurrentSessionCalcFields
    Parameters = <
      item
        Name = 'idS'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Visitor.discount_visitor,Visit.id_visitor,Visit.id_visit,' +
        'Visitor.name_visitor, Visit.id_session, Visit.begin_visit, Visit' +
        '.end_visit, Visit.summ_visit, Visit.time_visit, Visit.discount_v' +
        'isit, Visit.end_summ_visit'
      
        'FROM Visit INNER JOIN Visitor ON Visit.id_visitor = Visitor.id_v' +
        'isitor'
      'WHERE (Visit.id_session)=:idS')
    Left = 320
    Top = 8
    object SQLVisitCurrentSessionid_visit: TAutoIncField
      FieldName = 'id_visit'
      ReadOnly = True
    end
    object SQLVisitCurrentSessionid_session: TIntegerField
      FieldName = 'id_session'
    end
    object SQLVisitCurrentSessionname_visitor: TWideStringField
      FieldName = 'name_visitor'
      Size = 50
    end
    object SQLVisitCurrentSessionbegin_visit: TDateTimeField
      FieldName = 'begin_visit'
    end
    object SQLVisitCurrentSessionend_visit: TDateTimeField
      FieldName = 'end_visit'
    end
    object SQLVisitCurrentSessionsumm_visit: TIntegerField
      FieldName = 'summ_visit'
    end
    object SQLVisitCurrentSessiontime_visit: TIntegerField
      FieldName = 'time_visit'
    end
    object SQLVisitCurrentSessiondiscount_visit: TIntegerField
      FieldName = 'discount_visit'
    end
    object SQLVisitCurrentSessionend_summ_visit: TIntegerField
      FieldName = 'end_summ_visit'
    end
    object SQLVisitCurrentSessionid_visitor: TIntegerField
      FieldName = 'id_visitor'
    end
    object SQLVisitCurrentSessionTimeVisit: TStringField
      FieldKind = fkCalculated
      FieldName = 'TimeVisit'
      Calculated = True
    end
    object SQLVisitCurrentSessiondiscount_visitor: TIntegerField
      FieldName = 'discount_visitor'
    end
  end
  object DSVisitCurrentSession: TDataSource
    DataSet = SQLVisitCurrentSession
    Left = 320
    Top = 64
  end
  object SQLVisitor: TADOQuery
    Connection = conBase
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Visitor.phone_visitor,Visitor.lastvisit_visitor,Visitor.i' +
        'd_visitor, Visitor.name_visitor, Visitor.discount_visitor, Black' +
        'list.start_blacklist, Visitor.comment_visitor'
      
        'FROM Visitor LEFT JOIN Blacklist ON Visitor.id_visitor = Blackli' +
        'st.id_visitor'
      'ORDER BY Visitor.name_visitor;')
    Left = 152
    Top = 136
    object SQLVisitorname_visitor: TWideStringField
      FieldName = 'name_visitor'
      Size = 50
    end
    object SQLVisitorid_visitor: TAutoIncField
      FieldName = 'id_visitor'
      ReadOnly = True
    end
    object SQLVisitordiscount_visitor: TIntegerField
      FieldName = 'discount_visitor'
    end
    object SQLVisitorstart_blacklist: TDateTimeField
      FieldName = 'start_blacklist'
    end
    object SQLVisitorcomment_visitor: TMemoField
      FieldName = 'comment_visitor'
      BlobType = ftMemo
    end
    object SQLVisitorlastvisit_visitor: TDateTimeField
      FieldName = 'lastvisit_visitor'
    end
    object SQLVisitorphone_visitor: TWideStringField
      FieldName = 'phone_visitor'
      Size = 12
    end
  end
  object DSVisitor: TDataSource
    DataSet = SQLVisitor
    Left = 152
    Top = 200
  end
  object SQLCheckVisitorSession: TADOQuery
    Connection = conBase
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'idSession'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idVisitor'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Visit.id_session, Visit.id_visitor, Visit.begin_visit, Vi' +
        'sit.end_visit'
      'FROM Visit'
      
        'WHERE (Visit.id_session= :idSession) AND (Visit.id_visitor= :idV' +
        'isitor)')
    Left = 472
    Top = 120
    object SQLCheckVisitorSessionid_session: TIntegerField
      FieldName = 'id_session'
    end
    object SQLCheckVisitorSessionid_visitor: TIntegerField
      FieldName = 'id_visitor'
    end
    object SQLCheckVisitorSessionbegin_visit: TDateTimeField
      FieldName = 'begin_visit'
    end
    object SQLCheckVisitorSessionend_visit: TDateTimeField
      FieldName = 'end_visit'
    end
  end
  object SQLDiscountVisitor: TADOQuery
    Connection = conBase
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Visitor.id_visitor, Visitor.discount_visitor'
      'FROM Visitor'
      'WHERE (((Visitor.id_visitor)=:id));')
    Left = 472
    Top = 176
    object SQLDiscountVisitorid_visitor: TAutoIncField
      FieldName = 'id_visitor'
      ReadOnly = True
    end
    object SQLDiscountVisitordiscount_visitor: TIntegerField
      FieldName = 'discount_visitor'
    end
  end
  object SQLStat: TADOQuery
    Connection = conBase
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'idV'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Count([Visit]![begin_visit]) AS C, Sum([Visit]![time_visi' +
        't]) AS S'
      'FROM Visit'
      'WHERE Visit.id_visitor=:idV;')
    Left = 472
    Top = 232
    object SQLStatC: TIntegerField
      FieldName = 'C'
    end
    object SQLStatS: TFloatField
      FieldName = 'S'
    end
  end
  object DSStat: TDataSource
    DataSet = SQLStat
    Left = 472
    Top = 288
  end
  object SQLConfig: TADOQuery
    Connection = conBase
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM AllConfig')
    Left = 568
    Top = 8
    object SQLConfigname_config: TWideStringField
      FieldName = 'name_config'
      Size = 50
    end
    object SQLConfigvalue_config: TWideStringField
      FieldName = 'value_config'
      Size = 50
    end
  end
  object SQLPayClient: TADOQuery
    Connection = conBase
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'idSession'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idVisitor'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Visit.id_session, Visit.id_visitor'
      'FROM Visit'
      
        'WHERE ( Visit.id_session=:idSession ) AND ( Visit.id_visitor=:id' +
        'Visitor )')
    Left = 568
    Top = 232
  end
  object SQLUpdateTime: TADOQuery
    Connection = conBase
    Parameters = <
      item
        Name = 'dateB'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idVisit'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE Visit'
      'SET begin_visit=:dateB'
      'WHERE id_visit=:idVisit')
    Left = 568
    Top = 120
  end
  object SQLUpdateVisitor: TADOQuery
    Connection = conBase
    Parameters = <
      item
        Name = 'dateFinish'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'minuteVisit'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idVisitor'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE Visitor'
      
        'SET lastvisit_visitor=:dateFinish , alltime_visitor=alltime_visi' +
        'tor+:minuteVisit'
      'WHERE id_visitor=:idVisitor')
    Left = 568
    Top = 176
  end
  object SQLUpdateVisit: TADOQuery
    Connection = conBase
    Parameters = <
      item
        Name = 'dateFinish'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'payVisit'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'minuteVisit'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'paysaleVisit'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idVisit'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE Visit'
      
        'SET end_visit=:dateFinish ,summ_visit=:payVisit ,time_visit=:min' +
        'uteVisit ,end_summ_visit=:paysaleVisit'
      'WHERE id_visit=:idVisit')
    Left = 568
    Top = 64
  end
  object SQLCreateSession: TADOQuery
    Connection = conBase
    Parameters = <
      item
        Name = 'dateSession'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'startSession'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idUser'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO Sessions (date_session,start_session,id_user)'
      'VALUES (:dateSession, :startSession, :idUser)')
    Left = 568
    Top = 288
  end
  object SQLCloseSession: TADOQuery
    Connection = conBase
    Parameters = <
      item
        Name = 'endSession'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idSession'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE Sessions'
      'SET end_session=:endSession , state_session=1'
      'WHERE id_session=:idSession')
    Left = 664
    Top = 8
  end
  object SQLCheckVisitorAdd: TADOQuery
    Connection = conBase
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'nameV'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'phone'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM Visitor'
      'WHERE (name_visitor=:nameV) AND (phone_visitor=:phone)')
    Left = 664
    Top = 64
  end
  object SQLSessionOnStart: TADOQuery
    Connection = conBase
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'idSession'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM Sessions'
      'WHERE id_session=:idSession')
    Left = 664
    Top = 120
    object SQLSessionOnStartid_session: TAutoIncField
      FieldName = 'id_session'
      ReadOnly = True
    end
    object SQLSessionOnStartid_user: TIntegerField
      FieldName = 'id_user'
    end
    object SQLSessionOnStartdate_session: TDateTimeField
      FieldName = 'date_session'
    end
  end
  object SQLHistory: TADOQuery
    Connection = conBase
    CursorType = ctStatic
    OnCalcFields = SQLHistoryCalcFields
    Parameters = <
      item
        Name = 'idSession'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Visitor.discount_visitor,Visit.id_visitor,Visit.id_visit,' +
        'Visitor.name_visitor, Visit.id_session, Visit.begin_visit, Visit' +
        '.end_visit, Visit.summ_visit, Visit.time_visit, Visit.discount_v' +
        'isit, Visit.end_summ_visit'
      
        'FROM Visit INNER JOIN Visitor ON Visit.id_visitor = Visitor.id_v' +
        'isitor'
      'WHERE (Visit.id_session)=:idSession')
    Left = 320
    Top = 136
    object SQLHistorydiscount_visitor: TIntegerField
      FieldName = 'discount_visitor'
    end
    object SQLHistoryid_visitor: TIntegerField
      FieldName = 'id_visitor'
    end
    object SQLHistoryid_visit: TAutoIncField
      FieldName = 'id_visit'
      ReadOnly = True
    end
    object SQLHistoryname_visitor: TWideStringField
      FieldName = 'name_visitor'
      Size = 50
    end
    object SQLHistoryid_session: TIntegerField
      FieldName = 'id_session'
    end
    object SQLHistorybegin_visit: TDateTimeField
      FieldName = 'begin_visit'
    end
    object SQLHistoryend_visit: TDateTimeField
      FieldName = 'end_visit'
    end
    object SQLHistorysumm_visit: TIntegerField
      FieldName = 'summ_visit'
    end
    object SQLHistorytime_visit: TIntegerField
      FieldName = 'time_visit'
    end
    object SQLHistorydiscount_visit: TIntegerField
      FieldName = 'discount_visit'
    end
    object SQLHistoryend_summ_visit: TIntegerField
      FieldName = 'end_summ_visit'
    end
    object SQLHistoryTimeVisit: TStringField
      FieldKind = fkCalculated
      FieldName = 'TimeVisit'
      Calculated = True
    end
  end
  object DSHistory: TDataSource
    DataSet = SQLHistory
    Left = 320
    Top = 200
  end
  object SQLAllSessions: TADOQuery
    Connection = conBase
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Sessions'
      'WHERE state_session<>0'
      'ORDER BY id_session DESC')
    Left = 232
    Top = 136
    object SQLAllSessionsid_session: TAutoIncField
      FieldName = 'id_session'
      ReadOnly = True
    end
    object SQLAllSessionsdate_session: TDateTimeField
      FieldName = 'date_session'
    end
    object SQLAllSessionsstart_session: TDateTimeField
      FieldName = 'start_session'
    end
    object SQLAllSessionsend_session: TDateTimeField
      FieldName = 'end_session'
    end
    object SQLAllSessionsid_user: TIntegerField
      FieldName = 'id_user'
    end
    object SQLAllSessionsstate_session: TIntegerField
      FieldName = 'state_session'
    end
  end
  object DSAllSessions: TDataSource
    DataSet = SQLAllSessions
    Left = 232
    Top = 200
  end
  object SQLTemp: TADOQuery
    Connection = conBase
    CursorType = ctStatic
    OnCalcFields = SQLTempCalcFields
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Temp')
    Left = 152
    Top = 264
    object SQLTempid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object SQLTempdate_finish: TDateTimeField
      FieldName = 'date_finish'
    end
    object SQLTemppay_visit: TIntegerField
      FieldName = 'pay_visit'
    end
    object SQLTempminute_visit: TIntegerField
      FieldName = 'minute_visit'
    end
    object SQLTemppaysale_visit: TIntegerField
      FieldName = 'paysale_visit'
    end
    object SQLTempid_visit: TIntegerField
      FieldName = 'id_visit'
    end
    object SQLTempid_visitor: TIntegerField
      FieldName = 'id_visitor'
    end
    object SQLTempfio_visitor: TWideStringField
      FieldName = 'fio_visitor'
      Size = 50
    end
    object SQLTempdt_calc: TStringField
      FieldKind = fkCalculated
      FieldName = 'dt_calc'
      Calculated = True
    end
  end
  object DSTemp: TDataSource
    DataSet = SQLTemp
    Left = 152
    Top = 328
  end
end
