unit f_All_users;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
  DB, cxDBData, StdCtrls, Buttons, sBitBtn, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, sPanel;

type
  TAll_users = class(TForm)
    PANUsersMenu: TsPanel;
    GRIDGrid1DBTableView1: TcxGridDBTableView;
    GRIDLVLGrid1Level1: TcxGridLevel;
    GRIDAllUsers: TcxGrid;
    GRIDGrid1DBTableView1login_user: TcxGridDBColumn;
    GRIDGrid1DBTableView1fio_user: TcxGridDBColumn;
    PANAddUser: TsPanel;
    BTNAddUser: TsBitBtn;
    PANEditClient: TsPanel;
    BTNEditClient: TsBitBtn;
    PANExit: TsPanel;
    BTNExit: TsBitBtn;
    PANPwdChange: TsPanel;
    BTNPwdChange: TsBitBtn;
    procedure BTNExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTNAddUserClick(Sender: TObject);
    procedure BTNEditClientClick(Sender: TObject);
    procedure BTNPwdChangeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  All_users: TAll_users;

implementation

uses s_Base, s_procTeplo, s_constTeplo, s_Res;

{$R *.dfm}

procedure TAll_users.BTNExitClick(Sender: TObject);
begin
 All_users.Close;
end;

procedure TAll_users.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
 Base.SQLAllUsers.Active:=False;
end;

procedure TAll_users.BTNAddUserClick(Sender: TObject);
begin
 edit_user_value:='add';
 ShowAddNewUser;
end;

procedure TAll_users.BTNEditClientClick(Sender: TObject);
begin
 edit_user_value:='edit';
 ShowEditUser;
end;

procedure TAll_users.BTNPwdChangeClick(Sender: TObject);
begin
 SetDefaultPwd(Base.SQLAllUsersid_user.AsString);
 if Base.SQLUserspwd_user.Value='1' then
  ShowMessage(ACCEPTUSERCHANGEPWD)
 else ShowMessage(ERRORUSERCHANGEPWD);
end;

end.
