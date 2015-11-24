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
    BTNCalculate: TsBitBtn;
    BTNCancel: TsBitBtn;
    GRIDTempDBTableView1: TcxGridDBTableView;
    GRIDTempLevel1: TcxGridLevel;
    GRIDTemp: TcxGrid;
    GRIDTempDBTableView1pay_visit: TcxGridDBColumn;
    GRIDTempDBTableView1paysale_visit: TcxGridDBColumn;
    GRIDTempDBTableView1fio_visitor: TcxGridDBColumn;
    GRIDTempDBTableView1dt_calc: TcxGridDBColumn;
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
 Base.SQLEdit.Active:=False;
 Base.SQLEdit.SQL.Clear;
 BAse.SQLEdit.SQL.Append('DELETE * From Temp');
 Base.SQLEdit.ExecSQL;
 Base.SQLEdit.Active:=False;
 Base.SQLEdit.SQL.Clear;
 Base.SQLEdit.SQL.Append('Alter table Temp alter column id autoincrement(1,1)');
 Base.SQLEdit.ExecSQL;
 Action:=caFree;
end;

procedure TCalculateUser.BTNCalculateClick(Sender: TObject);
begin
 Base.SQLTemp.First;
 while not Base.SQLTemp.Eof do
 begin
  Base.SQLUpdateVisit.Active:=False;
  Base.SQLUpdateVisit.Parameters.ParamByName('dateFinish').Value:=Base.SQLTempdate_finish.Value;
  Base.SQLUpdateVisit.Parameters.ParamByName('payVisit').Value:=Base.SQLTemppay_visit.Value;
  Base.SQLUpdateVisit.Parameters.ParamByName('minuteVisit').Value:=Base.SQLTempminute_visit.Value;
  Base.SQLUpdateVisit.Parameters.ParamByName('paysaleVisit').Value:=Base.SQLTemppaysale_visit.Value;
  Base.SQLUpdateVisit.Parameters.ParamByName('idVisit').Value:=Base.SQLTempid_visit.Value;
  Base.SQLUpdateVisit.ExecSQL;
  Base.SQLUpdateVisitor.Active:=False;
  Base.SQLUpdateVisitor.Parameters.ParamByName('dateFinish').Value:=Base.SQLTempdate_finish.Value;
  Base.SQLUpdateVisitor.Parameters.ParamByName('minuteVisit').Value:=Base.SQLTempminute_visit.Value;
  Base.SQLUpdateVisitor.Parameters.ParamByName('idVisitor').Value:=Base.SQLTempid_visitor.Value;
  Base.SQLUpdateVisitor.ExecSQL;
  Base.SQLTemp.Next;
 end;
  Base.SQLVisitCurrentSession.Active:=False;
  Base.SQLVisitCurrentSession.Active:=True;
  CheckVisitorNow;
  CalculateUser.Close;
end;

end.
