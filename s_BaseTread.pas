unit s_BaseTread;

interface
uses Classes;
type
  ThreadDemo = class(TThread)
  private
    { Private declarations }
  protected
    S: string;
    N: Integer;
    procedure UpdateMemo;
    procedure Execute; override;
  end;
var
  TDemo: ThreadDemo;

implementation

uses f_VisitorAdd, s_Base,SysUtils,Windows,Forms;

procedure ThreadDemo.Execute;
begin
 Synchronize(UpdateMemo);
 Application.ProcessMessages;
end;

procedure ThreadDemo.UpdateMemo;
begin
  Application.ProcessMessages;
  Base.SQLVisitor.Active:=False;
  Base.SQLVisitor.SQL.Clear;
  Base.SQLVisitor.SQL.Append('SELECT Visitor.email_visitor,Visitor.phone_visitor,Visitor.lastvisit_visitor,Visitor.id_visitor, Visitor.name_visitor, Visitor.discount_visitor, Blacklist.start_blacklist, Visitor.comment_visitor');
  Base.SQLVisitor.SQL.Append('FROM Visitor LEFT JOIN Blacklist ON Visitor.id_visitor = Blacklist.id_visitor');
  Base.SQLVisitor.SQL.Append('WHERE Visitor.name_visitor Like '+#39+'%'+VisitorAdd.EDITSearch.Text+'%'+#39);
  Base.SQLVisitor.SQL.Append('ORDER BY Visitor.name_visitor');
  Base.SQLVisitor.Active:=True;
  if Base.SQLVisitor.RecordCount=0 then VisitorAdd.BTNAddVisitor.Enabled:=True
  else VisitorAdd.BTNAddVisitor.Enabled:=False;
   Application.ProcessMessages;
end;

end.
