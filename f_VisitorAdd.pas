unit f_VisitorAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
  DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, sListBox, ExtCtrls, sPanel, DBCtrls, sDBMemo, sGroupBox, sEdit,
  sLabel, Buttons, sBitBtn, pngimage, sDBText, Mask, Menus;

type
  TVisitorAdd = class(TForm)
    PANMain: TsPanel;
    PANInviteVisitors: TsPanel;
    PANWork: TsPanel;
    LBVisitors: TsListBox;
    GRIDVisitorsDBTableView1: TcxGridDBTableView;
    GRIDLVLGRIDVisitorsLevel1: TcxGridLevel;
    GRIDVisitors: TcxGrid;
    GRIDVisitorsDBTableView1name_visitor: TcxGridDBColumn;
    PANCommentVisitor: TsPanel;
    LBLSearch: TsLabel;
    EDITSearch: TsEdit;
    GRBCommentVisitor: TsGroupBox;
    MEMOCommentVisitor: TsDBMemo;
    LBTemp: TsListBox;
    PANActions: TsPanel;
    BTNSave: TsBitBtn;
    BTNCancel: TsBitBtn;
    BTNAddVisitor: TsBitBtn;
    IMGSearch: TImage;
    IMGVisitors: TImage;
    LBLCommentVisitor: TsLabel;
    LBLVisitors: TsLabel;
    DBEDITId: TDBEdit;
    LBLCountVisit: TsLabel;
    DBTEXTCount: TsDBText;
    LBLTime: TsLabel;
    LBLCountTime: TsLabel;
    LBLLastVisit: TsLabel;
    DBTEXTLastVisit: TsDBText;
    LBLPhoneVisitor: TsLabel;
    DBTEXTPhonevisitor: TsDBText;
    pmvisitor: TPopupMenu;
    N1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EDITSearchChange(Sender: TObject);
    procedure GRIDVisitorsDBTableView1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LBVisitorsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LBVisitorsClick(Sender: TObject);
    procedure BTNCancelClick(Sender: TObject);
    procedure BTNSaveClick(Sender: TObject);
    procedure DBEDITIdChange(Sender: TObject);
    procedure CheckVisitor;
    procedure BTNAddVisitorClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VisitorAdd: TVisitorAdd;
  Count:Integer;
implementation

uses s_Base, s_BaseTread, s_constTeplo, s_procTeplo, s_Res, f_AddVisitor;

{$R *.dfm}
procedure TVisitorAdd.CheckVisitor;
var
  i:integer;
  flag:Boolean;
begin
 if LBVisitors.Items.Count=0 then
  begin
   LBVisitors.Items.Add(Base.SQLVisitorname_visitor.AsString);
   LBTemp.Items.Add(Base.SQLVisitorid_visitor.AsString);
  end
 else
  begin
   for i:=0 to LBTemp.Items.Count-1 do
   begin
    if LBVisitors.Items[i]=Base.SQLVisitorid_visitor.AsString
    then flag:=True;
   end;
    if flag=true then
    begin
     ShowMessage(ERRORADDVISITORINSESSION);
    end
    else
    begin
     LBVisitors.Items.Add(Base.SQLVisitorname_visitor.AsString);
     LBTemp.Items.Add(Base.SQLVisitorid_visitor.AsString);
    end;
  end;
end;

procedure TVisitorAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Application.ProcessMessages;
 Base.SQLVisitCurrentSession.Active:=False;
 Base.SQLVisitCurrentSession.Active:=True;
 Base.SQLVisitor.Active:=False;
 CheckVisitorNow;
 Action:=caFree;
end;

procedure TVisitorAdd.EDITSearchChange(Sender: TObject);
begin
 Application.ProcessMessages;
 TDemo := ThreadDemo.Create(False);
 Application.ProcessMessages;
 
end;

procedure TVisitorAdd.GRIDVisitorsDBTableView1DblClick(Sender: TObject);

begin
 CheckVisitorSession(Base.SQLVisitorid_visitor.AsString);
 if Base.SQLCheckVisitorSession.RecordCount<>0 then
  begin
    Base.SQLCheckVisitorSession.Last;
   if Base.SQLCheckVisitorSessionend_visit.AsString='' then
    ShowMessage('Посетитель уже присутствует на данный момент')
   else
    CheckVisitor
  end
 else
 begin
  CheckVisitor
 end;
 if LBVisitors.Items.Count=0 then BTNSave.Enabled:=False else BTNSave.Enabled:=True;
 LBLVisitors.Caption:='Добавленные посетители ('+inttostr(LBVisitors.Items.Count)+')';
end;

procedure TVisitorAdd.FormShow(Sender: TObject);
begin
 LBLVisitors.Caption:='Добавленные посетители ('+inttostr(LBVisitors.Items.Count)+')';
end;

procedure TVisitorAdd.LBVisitorsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_DELETE) then
 begin
  LBVisitors.DeleteSelected;
  LBTemp.DeleteSelected;
 end;
 if LBVisitors.Items.Count=0 then BTNSave.Enabled:=False else BTNSave.Enabled:=True;
 LBLVisitors.Caption:='Добавленные посетители ('+inttostr(LBVisitors.Items.Count)+')';
end;

procedure TVisitorAdd.LBVisitorsClick(Sender: TObject);
begin
 LBTemp.ItemIndex:=LBVisitors.ItemIndex;
end;

procedure TVisitorAdd.BTNCancelClick(Sender: TObject);
begin
 VisitorAdd.Close;
end;

procedure TVisitorAdd.BTNSaveClick(Sender: TObject);
var
  i:Integer;
  idV,dis:string;
  dateV:string;
begin
 for i:=0 to LBTemp.Items.Count-1 do
 begin
  Base.SQLDiscountVisitor.Active:=False;
  Base.SQLDiscountVisitor.Parameters.ParamByName('id').Value:=LBTemp.Items[i];
  Base.SQLDiscountVisitor.Active:=True;
  dis:=Base.SQLDiscountVisitordiscount_visitor.AsString;
  idV:=LBTemp.Items[i];
  dateV:=datetostr(Date)+' '+timetostr(Time);
  with Base.SQLEdit do
  begin
   Active:=False;
   SQL.Clear;
   SQL.Append('INSERT INTO Visit (id_session,id_visitor,begin_visit,discount_visit)');
   SQL.Append('VALUES ('+id_current_session+','+idV+',=:data,'+dis+')');
   Parameters.ParamByName('data').Value:=Now;
   ExecSQL;
  end;
 end;
 VisitorAdd.Close;
end;

procedure TVisitorAdd.DBEDITIdChange(Sender: TObject);
var
 H, M, S, ATime: Integer;
begin
 Base.SQLStat.Active:=False;
 Base.SQLStat.Parameters.ParamByName('idV').Value:=Base.SQLVisitorid_visitor.Value;
 Base.SQLStat.Active:=True;
 ATime :=Base.SQLStatS.AsInteger*60;
 H := ATime div 3600;
 M := (ATime - H * 3600) div 60;
 S := ATime - H * 3600 - M * 60;
 LBLCountTime.Caption := Format('%d ч %d м %d с', [H, M, S]);
end;

procedure TVisitorAdd.BTNAddVisitorClick(Sender: TObject);
begin
 Application.CreateForm(TAddVisitor,AddVisitor);
 AddVisitor.EDITfioVisitor.Text:=EDITSearch.Text;
 AddVisitor.CBBSale.ItemIndex:=0;
 visitor_action:='add';
 AddVisitor.Caption:='Добавление нового посетителя';
 AddVisitor.ShowModal;
end;

procedure TVisitorAdd.N1Click(Sender: TObject);
var
  i:integer;
begin
 Application.CreateForm(TAddVisitor,AddVisitor);
 AddVisitor.EDITfioVisitor.Text:=Base.SQLVisitorname_visitor.Value;
 AddVisitor.EDITPhoneVisitor.Text:=Base.SQLVisitorphone_visitor.Value;
 AddVisitor.MEMOCommentVisitor.Text:=Base.SQLVisitorcomment_visitor.Value;
 for i:=0 to AddVisitor.CBBSale.Items.Count do
 begin
  if AddVisitor.CBBSale.Items[i]=Base.SQLVisitordiscount_visitor.AsString then
   AddVisitor.CBBSale.ItemIndex:=i;
 end;
 visitor_action:='edit';
 AddVisitor.Caption:='Изменение выбранного посетителя';
 AddVisitor.ShowModal;
end;

end.
