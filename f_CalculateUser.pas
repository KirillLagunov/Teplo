unit f_CalculateUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sLabel, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TCalculateUser = class(TForm)
    LBLFioUser: TsLabel;
    LBLMinute: TsLabel;
    LBLPay: TsLabel;
    BTNCalculate: TsBitBtn;
    BTNCancel: TsBitBtn;
    GRIDTempDBTableView1: TcxGridDBTableView;
    GRIDTempLevel1: TcxGridLevel;
    GRIDTemp: TcxGrid;
    GRIDTempDBTableView1pay_visit: TcxGridDBColumn;
    GRIDTempDBTableView1minute_visit: TcxGridDBColumn;
    GRIDTempDBTableView1paysale_visit: TcxGridDBColumn;
    GRIDTempDBTableView1fio_visitor: TcxGridDBColumn;
    procedure BTNCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTNCalculateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CalculateUser: TCalculateUser;

implementation

uses s_Res, s_Base, s_constTeplo, s_procTeplo;

{$R *.dfm}

procedure TCalculateUser.BTNCancelClick(Sender: TObject);
begin
 CalculateUser.Close;
end;

procedure TCalculateUser.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TCalculateUser.BTNCalculateClick(Sender: TObject);
var
  id:string;
begin
 id:=Base.SQLVisitCurrentSessionid_visit.AsString;
 Base.SQLUpdateVisit.Active:=False;
 Base.SQLUpdateVisit.Parameters.ParamByName('dateFinish').Value:=StrToDateTime(end_user_visit);
 Base.SQLUpdateVisit.Parameters.ParamByName('payVisit').Value:=pay_user_visit;
 Base.SQLUpdateVisit.Parameters.ParamByName('minuteVisit').Value:=minute_user_visit;
 Base.SQLUpdateVisit.Parameters.ParamByName('paysaleVisit').Value:=paysale_user_visit;
 Base.SQLUpdateVisit.Parameters.ParamByName('idVisit').Value:=Base.SQLVisitCurrentSessionid_visit.Value;
 Base.SQLUpdateVisit.ExecSQL;
 Base.SQLUpdateVisitor.Active:=False;
 Base.SQLUpdateVisitor.Parameters.ParamByName('dateFinish').Value:=StrToDateTime(end_user_visit);
 Base.SQLUpdateVisitor.Parameters.ParamByName('minuteVisit').Value:=minute_user_visit;
 Base.SQLUpdateVisitor.Parameters.ParamByName('idVisitor').Value:=Base.SQLVisitCurrentSessionid_visitor.Value;
 Base.SQLUpdateVisitor.ExecSQL;
 Base.SQLVisitCurrentSession.Active:=False;
 Base.SQLVisitCurrentSession.Active:=True;
 Base.SQLVisitCurrentSession.Locate('id_visit',id,[]);
 CheckVisitorNow;
 CalculateUser.Close;
end;

end.
