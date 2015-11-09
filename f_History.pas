unit f_History;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
  DB, cxDBData, StdCtrls, Mask, DBCtrls, sDBEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, sGroupBox;

type
  THistory = class(TForm)
    GRBSessions: TsGroupBox;
    GRIDSessionsDBTableView1: TcxGridDBTableView;
    GRIDSessionsLevel1: TcxGridLevel;
    GRIDSessions: TcxGrid;
    GRIDSessionsDBTableView1date_session: TcxGridDBColumn;
    GRIDSessionsDBTableView1start_session: TcxGridDBColumn;
    GRIDSessionsDBTableView1end_session: TcxGridDBColumn;
    GRBVisitors: TsGroupBox;
    GRIDWork: TcxGrid;
    GRIDWorkDBTableView1: TcxGridDBTableView;
    GRIDWorkDBTableView1name_visitor: TcxGridDBColumn;
    GRIDWorkDBTableView1begin_visit: TcxGridDBColumn;
    GRIDWorkDBTableView1end_visit: TcxGridDBColumn;
    GRIDWorkDBTableView1TimeVisit: TcxGridDBColumn;
    GRIDWorkDBTableView1summ_visit: TcxGridDBColumn;
    GRIDWorkDBTableView1discount_visit: TcxGridDBColumn;
    GRIDWorkDBTableView1end_summ_visit: TcxGridDBColumn;
    GRIDWorkLevel1: TcxGridLevel;
    DBEDITSession: TsDBEdit;
    procedure DBEDITSessionChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  History: THistory;

implementation

uses s_Base;

{$R *.dfm}

procedure THistory.DBEDITSessionChange(Sender: TObject);
begin
 Base.SQLHistory.Active:=False;
 Base.SQLHistory.Parameters.ParamByName('idSession').Value:=Base.SQLAllSessionsid_session.Value;
 Base.SQLHistory.Active:=True;
end;

procedure THistory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

end.
