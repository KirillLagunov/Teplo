unit f_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sEdit, sLabel, pngimage, ExtCtrls;

type
  TLogin = class(TForm)
    LBLLoginUser: TsLabel;
    EDITLoginUser: TsEdit;
    LBLPwdUser: TsLabel;
    EDITPwdUser: TsEdit;
    BTNLogin: TsBitBtn;
    BTNCancel: TsBitBtn;
    IMGLoginUser: TImage;
    IMGPwdUser: TImage;
    procedure EDITPwdUserChange(Sender: TObject);
    procedure BTNCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTNLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Login: TLogin;

implementation

uses s_Base, s_constTeplo, f_Main, s_Res, s_procTeplo;

{$R *.dfm}

procedure TLogin.EDITPwdUserChange(Sender: TObject);
begin
 if (EDITLoginUser.Text='') or (EDITPwdUser.Text='') then
  BTNLogin.Enabled:=False
 else
  BTNLogin.Enabled:=True;
end;

procedure TLogin.BTNCancelClick(Sender: TObject);
begin
 Login.Close;
end;

procedure TLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TLogin.BTNLoginClick(Sender: TObject);
 var
   login_user,pwd_user:string;
begin
 login_user:=EDITLoginUser.Text;
 pwd_user:=EDITPwdUser.Text;
 if Base.SQLUsers.Locate('login_user',login_user,[])=False
 then
  ShowMessage(ERRORDBUSERNOTFOUND)
 else
 if Base.SQLUserspwd_user.Value<>pwd_user then
  ShowMessage(ERRORDBUSERNOTFOUND)
 else
 begin
  id_roul_user:=Base.SQLUsersid_roul.AsString;
  fio_user:=Base.SQLUsersfio_user.Value;
  id_user:=Base.SQLUsersid_user.AsString;
  Main.CPANMain.Visible:=True;
  if pwd_user='1' then
  begin
   ShowMessage('Необходимо изменить стандартный пароль!');
   Main.B1.Visible:=True;
  end;
  Main.Caption:=APPTITLE+' Версия : '+APPVER+' Вы вошли,как '+fio_user;
  if id_roul_user<=ADMIDROUL then
  begin
   Main.N9.Visible:=True;
   Main.PANBTNSettings.Visible:=True;
   Main.PANBTNChangeTime.Visible:=True;
  end;
  if id_roul_user='1' then Main.N8.Enabled:=True else Main.N8.Enabled:=False;

  if id_session_in_file<>'' then
  begin
   id_current_session:=id_session_in_file;
   Main.PANBTNOpenSession.Visible:=False;
   Main.PANBTNCloseSession.Visible:=True;
   Base.SQLVisitCurrentSession.Active:=False;
   Base.SQLVisitCurrentSession.Parameters.ParamByName('idS').Value:=id_current_session;
   Base.SQLVisitCurrentSession.Active:=True;
   CheckVisitorNow;
   Main.PANWork.Visible:=True;
   Main.CPANActions.Visible:=True;
   Main.CPANActions.Collapsed:=True;
   Base.SQLSessionOnStart.Active:=False;
   Base.SQLSessionOnStart.Parameters.ParamByName('idSession').Value:=id_session_in_file;
   Base.SQLSessionOnStart.Active:=True;
   if Base.SQLSessionOnStartdate_session.AsString<>DateToStr(date) then
    Main.Caption:=APPTITLE+' Версия : '+APPVER+' Вы вошли,как '+fio_user+' [НЕ ЗАКРЫТАЯ СМЕНА ЗА '+Base.SQLSessionOnStartdate_session.AsString+']';
   Base.SQLSessionOnStart.Active:=False;
  end
  else
  begin
   Main.PANBTNCloseSession.Visible:=False;
   Main.PANBTNOpenSession.Visible:=True;
  end;
   Main.PANMain.Visible:=True;
   Main.N3.Visible:=False;
   Main.N6.Visible:=True;
   Login.Close;
 end;
end;
end.
