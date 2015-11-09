unit f_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,pngimage, ExtCtrls, acImage, StdCtrls, Buttons, sBitBtn,
  sPanel, acPNG, sLabel, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, CollapsePanel, sGroupBox, Mask, DBCtrls,
  sDBEdit, acSlider,IniFiles;

type
  TMain = class(TForm)
    MenuMain: TMainMenu;
    A1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    IMGMainImg: TsImage;
    B1: TMenuItem;
    PANWork: TsPanel;
    GRIDWorkDBTableView1: TcxGridDBTableView;
    GRIDWorkLevel1: TcxGridLevel;
    GRIDWork: TcxGrid;
    GRIDWorkDBTableView1name_visitor: TcxGridDBColumn;
    GRIDWorkDBTableView1begin_visit: TcxGridDBColumn;
    GRIDWorkDBTableView1end_visit: TcxGridDBColumn;
    GRIDWorkDBTableView1summ_visit: TcxGridDBColumn;
    GRIDWorkDBTableView1discount_visit: TcxGridDBColumn;
    GRIDWorkDBTableView1end_summ_visit: TcxGridDBColumn;
    CPANMain: TCollapsePanel;
    PANMain: TsPanel;
    PANBTNOpenSession: TsPanel;
    BTNOpenSession: TsBitBtn;
    PANBTNCloseSession: TsPanel;
    BTNCloseSession: TsBitBtn;
    PANBTNExit: TsPanel;
    BTNExit: TsBitBtn;
    PANBTNSettings: TsPanel;
    BTNSettings: TsBitBtn;
    PANDateTime: TsPanel;
    LBLDate: TsLabelFX;
    LBLTime: TsLabelFX;
    CPANActions: TCollapsePanel;
    PANActions: TsPanel;
    PANBTNAddVisitor: TsPanel;
    BTNAddVisitor: TsBitBtn;
    PANBTNPay: TsPanel;
    BTNPay: TsBitBtn;
    PANSessionInfo: TsPanel;
    PANBTNChangeTime: TsPanel;
    BTNChangeTime: TsBitBtn;
    GRBSessionInfo: TsGroupBox;
    GRIDWorkDBTableView1TimeVisit: TcxGridDBColumn;
    LBLNow: TsLabel;
    pmedit: TPopupMenu;
    N8: TMenuItem;
    edtid_visit: TsDBEdit;
    SLIDENow: TsSlider;
    N9: TMenuItem;
    BTNCheck: TsBitBtn;
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BTNExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N2Click(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure BTNAddVisitorClick(Sender: TObject);
    procedure BTNPayClick(Sender: TObject);
    procedure BTNChangeTimeClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure edtid_visitChange(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure BTNOpenSessionClick(Sender: TObject);
    procedure BTNCloseSessionClick(Sender: TObject);
    procedure SLIDENowClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure BTNSettingsClick(Sender: TObject);
    procedure BTNCheckClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;
  config:TIniFile;
implementation

uses f_Login, s_Res, f_All_users, s_Base, s_constTeplo, s_procTeplo,
  f_VisitorAdd,DateUtils, f_ChangeTime, f_CalculateUser, f_Settings;

{$R *.dfm}

procedure TMain.N5Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TMain.N3Click(Sender: TObject);
begin
 Application.CreateForm(TLogin,Login);
 Login.ShowModal;
end;

procedure TMain.BTNExitClick(Sender: TObject);
begin
 N5.Click;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Application.Terminate;
end;

procedure TMain.N2Click(Sender: TObject);
begin
 Base.SQLAllUsers.Active:=True;
 Application.CreateForm(TAll_users,All_users);

 if Base.SQLAllUsers.RecordCount=0 then All_users.PANEditClient.Visible:=False
 else All_users.PANEditClient.Visible:=True;

 All_users.ShowModal;
end;

procedure TMain.B1Click(Sender: TObject);
 var
   FullProgPath: PChar;
   pswd:string;
begin
 pswd:=InputBox(Application.Title,'Введите новый пароль :',' ');
 ChangeUserPwd(id_user,pswd);
 ShowMessage('Программа будет перезапущена');
 FullProgPath:=PChar(Application.ExeName);
 WinExec(FullProgPath,SW_SHOW);
 Application.Terminate;
end;

procedure TMain.BTNAddVisitorClick(Sender: TObject);
begin
 ShowVisitorAdd;
end;

procedure TMain.BTNPayClick(Sender: TObject);
var
  id_visitor:string;
  a:int64;
  i,sale,minute:integer;
  pay:Real;
  H, M, S: Integer;
begin
 for i:=0 to GRIDWorkDBTableView1.Controller.SelectedRowCount-1 do
 begin
  GRIDWorkDBTableView1.DataController.FocusedRecordIndex:=GRIDWorkDBTableView1.Controller.SelectedRows[i].Index;
  id_visitor:=GRIDWorkDBTableView1.DataController.DataSet.FieldValues['id_visitor'];
  //--------------   Для проверки на повторное посещение
  Base.SQLPayClient.Active:=False;
  Base.SQLPayClient.Parameters.ParamByName('idSession').Value:=id_current_session;
  Base.SQLPayClient.Parameters.ParamByName('idVisitor').Value:=id_visitor;
  Base.SQLPayClient.Active:=True;
  //--------------

  sale:=Base.SQLVisitCurrentSessiondiscount_visit.Value;
  A:=SecondsBetween(Base.SQLVisitCurrentSessionbegin_visit.value,now);
  end_user_visit:=DateTimeToStr(Now);
  minute:=strtoint(FormatFloat('0',((a/3600)*60)));
  if base.SQLPayClient.RecordCount=1 then
  begin
   if minute<=10 then
   begin
    pay:=0;
    pay_user_visit:=FloatToStr(pay);
   end
   else
    if (minute>10) and (minute<=60) then
    begin
     pay:=StrToFloat(first_hour_pay);
     pay_user_visit:=FloatToStr(pay);
    end
    else
     if minute>60 then
     begin
      pay:=StrToFloat(first_hour_pay)+((minute-60)*strtofloat(one_minute_pay));
      pay_user_visit:=FloatToStr(pay);
     end;
  end
  else if Base.SQLPayClient.RecordCount>1 then
  begin
   pay:=minute*strtofloat(one_minute_pay);
   pay_user_visit:=FloatToStr(pay);
  end;
  pay:=pay-((pay/100)*sale);
  paysale_user_visit:=(FormatFloat('0',(pay)));
  minute_user_visit:=IntToStr(minute);
  H := (minute*60) div 3600;
  M := ((minute*60) - H * 3600) div 60;
  ShowMessage('Провел в "Тепле" : '+Format('%d ч %d м %', [H, M]));
  


 end;
 //Application.CreateForm(TCalculateUser,CalculateUser);
 {CalculateUser.LBLFioUser.Caption:=Base.SQLVisitCurrentSessionname_visitor.AsString;
 CalculateUser.LBLMinute.Caption:='Провел в "Тепле" : '+Format('%d ч %d м %', [H, M]);
 CalculateUser.LBLPay.Caption:='К оплате : '+paysale_user_visit+' руб.';
 CalculateUser.ShowModal;   }
end;

procedure TMain.BTNChangeTimeClick(Sender: TObject);
begin
 Application.CreateForm(TChangeTime,ChangeTime);
 ChangeTime.ShowModal;
end;

procedure TMain.N8Click(Sender: TObject);
begin
 DeleteSelectedVisitor;
end;

procedure TMain.edtid_visitChange(Sender: TObject);
begin
 if Base.SQLVisitCurrentSessiontime_visit.AsString<>'0' then
 begin
  BTNChangeTime.Enabled:=False;
  BTNPay.Enabled:=False;
 end
 else
 begin
  BTNChangeTime.Enabled:=True;
  BTNPay.Enabled:=True;
 end;
end;

procedure TMain.N6Click(Sender: TObject);
var
   FullProgPath: PChar;
begin
 FullProgPath := PChar(Application.ExeName);
 WinExec(FullProgPath, SW_SHOW);
 Application.Terminate;
end;

procedure TMain.BTNOpenSessionClick(Sender: TObject);
begin
 OpenNewSession;
end;

procedure TMain.BTNCloseSessionClick(Sender: TObject);
begin
 if Application.MessageBox('Вы точно хотите закрыть смену?','Антикафе "Тепло!"',  MB_YESNO + MB_ICONWARNING + MB_TOPMOST)=mrYes then
 begin
  Base.SQLCloseSession.Active:=False;
  Base.SQLCloseSession.Parameters.ParamByName('endSession').Value:=Now;
  Base.SQLCloseSession.Parameters.ParamByName('idSession').Value:=id_current_session;
  Base.SQLCloseSession.ExecSQL;
  config:=TIniFile.Create(patch_app+'\conf\settings.ini');
  config.WriteString('APP','last_session_id','');
  config.Destroy;
  Main.N5.Click;
 end;
end;

procedure TMain.SLIDENowClick(Sender: TObject);
begin
 if SLIDENow.SliderOn=False then
 begin
  Base.SQLVisitCurrentSession.Filtered:=False;
 end
 else
 begin
  Base.SQLVisitCurrentSession.Filtered:=False;
  Base.SQLVisitCurrentSession.Filter:='summ_visit=0';
  Base.SQLVisitCurrentSession.Filtered:=True;
 end;
end;

procedure TMain.N9Click(Sender: TObject);
var
  sale,id:string;
begin
 if Base.SQLVisitCurrentSessiondiscount_visitor.AsString='0' then
 begin
  sale:=InputBox(Application.Title,'Установить скидку на посещение (единоразовая) :','0');
  id:=Base.SQLVisitCurrentSessionid_visit.AsString;
  with Base.SQLEdit do
  begin
   Active:=False;
   SQL.Clear;
   SQL.Append('UPDATE Visit');
   SQL.Append('SET discount_visit='+sale);
   SQL.Append('WHERE id_visit='+id);
   ExecSQL;
  end;
  Base.SQLVisitCurrentSession.Active:=False;
  Base.SQLVisitCurrentSession.Active:=True;
 end
 else
  ShowMessage('Нельзя изменять постоянную скидку'); 
end;

procedure TMain.BTNSettingsClick(Sender: TObject);
begin
 Application.CreateForm(TSettings,Settings);
 Settings.ShowModal;
end;

procedure TMain.BTNCheckClick(Sender: TObject);
var
  i:integer;
begin
 for i:=0 to GRIDWorkDBTableView1.Controller.SelectedRowCount-1 do
 begin
   GRIDWorkDBTableView1.DataController.FocusedRecordIndex:=GRIDWorkDBTableView1.Controller.SelectedRows[i].Index;
   ShowMessage(GRIDWorkDBTableView1.DataController.DataSet.FieldValues['id_visitor']);
 end;
end;

end.
