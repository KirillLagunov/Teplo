unit s_Base;

interface

uses
  Forms,SysUtils, Classes, DB, ADODB;

type
  TBase = class(TDataModule)
    conBase: TADOConnection;
    SQLUsers: TADOQuery;
    SQLUsersid_user: TAutoIncField;
    SQLUserslogin_user: TWideStringField;
    SQLUserspwd_user: TWideStringField;
    SQLUsersfio_user: TWideStringField;
    SQLUsersid_roul: TIntegerField;
    SQLUsersname_roul: TWideStringField;
    SQLAllUsers: TADOQuery;
    SQLAllUserslogin_user: TWideStringField;
    SQLAllUsersfio_user: TWideStringField;
    SQLAllUsersid_user: TAutoIncField;
    DSAlUsers: TDataSource;
    SQLShowRouls: TADOQuery;
    SQLShowRoulsid_roul: TAutoIncField;
    SQLShowRoulsname_roul: TWideStringField;
    DSShowRouls: TDataSource;
    SQLEdit: TADOQuery;
    SQLCurrentSession: TADOQuery;
    SQLCurrentSessiondate_session: TDateTimeField;
    SQLCurrentSessionstate_session: TIntegerField;
    SQLCurrentSessionid_session: TAutoIncField;
    SQLVisitCurrentSession: TADOQuery;
    SQLVisitCurrentSessionname_visitor: TWideStringField;
    SQLVisitCurrentSessionid_session: TIntegerField;
    SQLVisitCurrentSessionbegin_visit: TDateTimeField;
    SQLVisitCurrentSessionend_visit: TDateTimeField;
    SQLVisitCurrentSessionsumm_visit: TIntegerField;
    SQLVisitCurrentSessiontime_visit: TIntegerField;
    SQLVisitCurrentSessiondiscount_visit: TIntegerField;
    SQLVisitCurrentSessionend_summ_visit: TIntegerField;
    DSVisitCurrentSession: TDataSource;
    SQLVisitor: TADOQuery;
    SQLVisitorname_visitor: TWideStringField;
    SQLVisitorid_visitor: TAutoIncField;
    SQLVisitordiscount_visitor: TIntegerField;
    SQLVisitorstart_blacklist: TDateTimeField;
    SQLVisitorcomment_visitor: TMemoField;
    DSVisitor: TDataSource;
    SQLCheckVisitorSession: TADOQuery;
    SQLCheckVisitorSessionid_session: TIntegerField;
    SQLCheckVisitorSessionid_visitor: TIntegerField;
    SQLCheckVisitorSessionbegin_visit: TDateTimeField;
    SQLCheckVisitorSessionend_visit: TDateTimeField;
    SQLDiscountVisitor: TADOQuery;
    SQLDiscountVisitorid_visitor: TAutoIncField;
    SQLDiscountVisitordiscount_visitor: TIntegerField;
    SQLVisitCurrentSessionid_visit: TAutoIncField;
    SQLStat: TADOQuery;
    SQLStatC: TIntegerField;
    SQLStatS: TFloatField;
    DSStat: TDataSource;
    SQLVisitorlastvisit_visitor: TDateTimeField;
    SQLConfig: TADOQuery;
    SQLConfigname_config: TWideStringField;
    SQLConfigvalue_config: TWideStringField;
    SQLPayClient: TADOQuery;
    SQLVisitCurrentSessionid_visitor: TIntegerField;
    SQLUpdateTime: TADOQuery;
    SQLUpdateVisitor: TADOQuery;
    SQLUpdateVisit: TADOQuery;
    SQLVisitCurrentSessionTimeVisit: TStringField;
    SQLCreateSession: TADOQuery;
    SQLCloseSession: TADOQuery;
    SQLCheckVisitorAdd: TADOQuery;
    SQLVisitorphone_visitor: TWideStringField;
    SQLVisitCurrentSessiondiscount_visitor: TIntegerField;
    SQLSessionOnStart: TADOQuery;
    SQLSessionOnStartid_session: TAutoIncField;
    SQLSessionOnStartid_user: TIntegerField;
    SQLSessionOnStartdate_session: TDateTimeField;
    SQLHistory: TADOQuery;
    DSHistory: TDataSource;
    SQLHistorydiscount_visitor: TIntegerField;
    SQLHistoryid_visitor: TIntegerField;
    SQLHistoryid_visit: TAutoIncField;
    SQLHistoryname_visitor: TWideStringField;
    SQLHistoryid_session: TIntegerField;
    SQLHistorybegin_visit: TDateTimeField;
    SQLHistoryend_visit: TDateTimeField;
    SQLHistorysumm_visit: TIntegerField;
    SQLHistorytime_visit: TIntegerField;
    SQLHistorydiscount_visit: TIntegerField;
    SQLHistoryend_summ_visit: TIntegerField;
    SQLAllSessions: TADOQuery;
    SQLAllSessionsid_session: TAutoIncField;
    SQLAllSessionsdate_session: TDateTimeField;
    SQLAllSessionsstart_session: TDateTimeField;
    SQLAllSessionsend_session: TDateTimeField;
    SQLAllSessionsid_user: TIntegerField;
    SQLAllSessionsstate_session: TIntegerField;
    DSAllSessions: TDataSource;
    SQLHistoryTimeVisit: TStringField;
    SQLTemp: TADOQuery;
    SQLTempid: TAutoIncField;
    SQLTempdate_finish: TDateTimeField;
    SQLTemppay_visit: TIntegerField;
    SQLTempminute_visit: TIntegerField;
    SQLTemppaysale_visit: TIntegerField;
    SQLTempid_visit: TIntegerField;
    SQLTempid_visitor: TIntegerField;
    SQLTempfio_visitor: TWideStringField;
    DSTemp: TDataSource;
    SQLTempdt_calc: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure SQLVisitCurrentSessionCalcFields(DataSet: TDataSet);
    procedure SQLHistoryCalcFields(DataSet: TDataSet);
    procedure SQLTempCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Base: TBase;

implementation

uses s_constTeplo, f_VisitorAdd;

{$R *.dfm}

procedure TBase.DataModuleCreate(Sender: TObject);
begin
 Application.Title:=APPTITLE;
end;

procedure TBase.SQLVisitCurrentSessionCalcFields(DataSet: TDataSet);
var
   minute,H, M, S: Integer;
begin
 minute:=Base.SQLVisitCurrentSessiontime_visit.AsInteger;
 H := (minute*60) div 3600;
 M := ((minute*60) - H * 3600) div 60;
 if minute<>0 then
  Base.SQLVisitCurrentSessionTimeVisit.Value:=Format('%d ÷ %d ì %', [H, M])
 else Base.SQLVisitCurrentSessionTimeVisit.Value:='';
end;

procedure TBase.SQLHistoryCalcFields(DataSet: TDataSet);
var
   minute,H, M, S: Integer;
begin
 minute:=Base.SQLHistorytime_visit.Value;
 H := (minute*60) div 3600;
 M := ((minute*60) - H * 3600) div 60;
 if minute<>0 then
  Base.SQLHistoryTimeVisit.Value:=Format('%d ÷ %d ì %', [H, M])
 else Base.SQLHistoryTimeVisit.Value:='';
end;
procedure TBase.SQLTempCalcFields(DataSet: TDataSet);
var
   minute,H, M, S: Integer;
begin
 minute:=Base.SQLTempminute_visit.Value;
 H := (minute*60) div 3600;
 M := ((minute*60) - H * 3600) div 60;
 if minute<>0 then
  Base.SQLTempdt_calc.Value:=Format('%d ÷ %d ì %', [H, M])
 else Base.SQLTempdt_calc.Value:='';
end;

end.
