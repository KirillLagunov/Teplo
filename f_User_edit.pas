unit f_User_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, acPNG, ExtCtrls, DBCtrls, sDBLookupComboBox, StdCtrls, sEdit,
  sLabel, Buttons, sBitBtn;

type
  TUser_edit = class(TForm)
    LBLLoginUser: TsLabel;
    LBLFioUser: TsLabel;
    LBLRoulUser: TsLabel;
    EDITLoginUser: TsEdit;
    EDITFioUser: TsEdit;
    DBLUCBRouls: TsDBLookupComboBox;
    IMGLoginUser: TImage;
    IMGFioUser: TImage;
    IMGRoulUser: TImage;
    BTNSave: TsBitBtn;
    BTNCancel: TsBitBtn;
    procedure BTNSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTNCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  User_edit: TUser_edit;

implementation

uses s_Base, s_Res, s_procTeplo, f_Login, f_All_users, s_constTeplo;

{$R *.dfm}

procedure TUser_edit.BTNSaveClick(Sender: TObject);
begin

 if edit_user_value='add' then CreateNewUser(EDITLoginUser.Text,EDITFioUser.Text)
 else UpdateUser(EDITLoginUser.Text,EDITFioUser.Text,Base.SQLAllUsersid_user.AsString);
 
 User_edit.Close;
end;

procedure TUser_edit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Base.SQLAllUsers.Active:=False;
 Base.SQLAllUsers.Active:=True;

 If base.SQLAllUsers.RecordCount=0 then All_users.PANEditClient.Visible:=False
 else All_users.PANEditClient.Visible:=True;
 
end;

procedure TUser_edit.BTNCancelClick(Sender: TObject);
begin
 User_edit.Close;
end;

end.
