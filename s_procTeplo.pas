unit s_procTeplo;

interface

 procedure ShowAddNewUser;
 procedure ShowEditUser;
 procedure CreateNewUser (LoginUser,FioUser:string);
 procedure UpdateUser (LoginUser,FioUser,id:string);
 procedure SetDefaultPwd (id:string);
 procedure ChangeUserPwd (id,pwd:string);
 procedure CheckVisitorSession (id:string);
 procedure CheckVisitorNow;
 procedure DeleteSelectedVisitor;
 procedure ShowVisitorAdd;
 procedure OpenNewSession;

implementation

uses f_User_edit,SysConst,SysUtils,Forms,Dialogs, s_Base, s_constTeplo,
  f_Main, f_VisitorAdd,IniFiles;

procedure ShowAddNewUser;
begin
 Application.CreateForm(TUser_edit,User_edit);
 Base.SQLShowRouls.Active:=True;
 User_edit.Caption:='Создание нового пользователя';
 User_edit.ShowModal;
end;

procedure ShowEditUser;
begin
 Application.CreateForm(TUser_edit,User_edit);
 Base.SQLShowRouls.Active:=True;
 edit_login_user:=Base.SQLAllUserslogin_user.Value;
 User_edit.Caption:='Редактирование пользователя '+Base.SQLAllUsersfio_user.Value;
 User_edit.EDITLoginUser.Text:=Base.SQLAllUserslogin_user.Value;
 User_edit.EDITFioUser.Text:=Base.SQLAllUsersfio_user.Value;
 User_edit.ShowModal;
end;

procedure CreateNewUser (LoginUser,FioUser:string);
begin
 Base.SQLEdit.Active:=False;
 Base.SQLEdit.SQL.Clear;
 Base.SQLEdit.SQL.Append('SELECT * FROM Users');
 Base.SQLEdit.SQL.Append('WHERE login_user='+#39+LoginUser+#39);
 Base.SQLEdit.Active:=True;
 If Base.SQLEdit.RecordCount<>0 then
  ShowMessage(ERRORDBCREATEUSER)
 else
 begin
  Base.SQLEdit.Active:=False;
  Base.SQLEdit.SQL.Clear;
  Base.SQLEdit.SQL.Append('INSERT INTO Users (login_user,pwd_user,fio_user,id_roul)');
  Base.SQLEdit.SQL.Append('VALUES ('+#39+LoginUser+#39+','+#39+'1'+#39+','+#39+FioUser+#39+','+Base.SQLShowRoulsid_roul.AsString+')');
  Base.SQLEdit.ExecSQL;
 end;
end;

procedure UpdateUser(LoginUser,FioUser,id:string);
begin
 if edit_login_user<>LoginUser then
 begin
  Base.SQLEdit.Active:=False;
  Base.SQLEdit.SQL.Clear;
  Base.SQLEdit.SQL.Append('SELECT * FROM Users');
  Base.SQLEdit.SQL.Append('WHERE login_user='+#39+LoginUser+#39);
  Base.SQLEdit.Active:=True;
  If Base.SQLEdit.RecordCount<>0 then
   ShowMessage(ERRORDBCREATEUSER);
 end
 else
  begin
   Base.SQLEdit.Active:=False;
   Base.SQLEdit.SQL.Clear;
   Base.SQLEdit.SQL.Append('UPDATE Users');
   Base.SQLEdit.SQL.Append('SET login_user='+#39+LoginUser+#39+',fio_user='+#39+FioUser+#39+',id_roul='+Base.SQLShowRoulsid_roul.AsString);
   Base.SQLEdit.SQL.Append('WHERE id_user='+id);
   Base.SQLEdit.ExecSQL;
  end;
end;

procedure SetDefaultPwd(id:string);
begin
 Base.SQLEdit.Active:=False;
 Base.SQLEdit.SQL.Clear;
 Base.SQLEdit.SQL.Append('UPDATE Users');
 Base.SQLEdit.SQL.Append('SET pwd_user='+#39+'1'+#39);
 Base.SQLEdit.SQL.Append('WHERE id_user='+id);
 Base.SQLEdit.ExecSQL;
 Base.SQLUsers.Active:=False;
 Base.SQLUsers.Active:=True;
 Base.SQLUsers.Locate('id_user',id,[]);
end;

procedure ChangeUserPwd (id,pwd:string);
begin
 Base.SQLEdit.Active:=False;
 Base.SQLEdit.SQL.Clear;
 Base.SQLEdit.SQL.Append('UPDATE Users');
 Base.SQLEdit.SQL.Append('SET pwd_user='+#39+pwd+#39);
 Base.SQLEdit.SQL.Append('WHERE id_user='+id);
 Base.SQLEdit.ExecSQL;
 Base.SQLUsers.Active:=False;
 Base.SQLUsers.Active:=True;
end;

procedure CheckVisitorSession(id:string);
begin
 with Base.SQLCheckVisitorSession do
 begin
  Active:=False;
  Parameters.ParamByName('idVisitor').Value:=StrToInt(id);
  Parameters.ParamByName('idSession').Value:=StrToInt(id_current_session);
  Active:=True;
 end; 
end;

procedure CheckVisitorNow;
begin
 with Base.SQLEdit do
 begin
  Active:=False;
  SQL.Clear;
  SQL.Append('SELECT * FROM Visit');
  SQL.Append('WHERE (id_session='+id_current_session+') AND (time_visit=0)');
  Active:=True;
 end;
 Main.LBLNow.Caption:='Сейчас у нас '+inttostr(Base.SQLEdit.RecordCount)+' посетителей';
 if Base.SQLEdit.RecordCount=0 then
 begin
  Main.BTNCloseSession.Enabled:=True;
  Main.BTNChangeTime.Enabled:=False;
  //Main.BTNPay.Enabled:=False;
 end
 else
 begin
  Main.BTNCloseSession.Enabled:=False;
  Main.BTNCloseSession.Enabled:=True;
  //Main.BTNPay.Enabled:=True;
 end;
 Base.SQLEdit.Active:=False;
end;

procedure DeleteSelectedVisitor;
begin
 Base.SQLEdit.Active:=False;
 Base.SQLEdit.SQL.Clear;
 Base.SQLEdit.SQL.Append('DELETE * FROM Visit');
 Base.SQLEdit.SQL.Append('WHERE id_visit='+Base.SQLVisitCurrentSessionid_visit.AsString);
 Base.SQLEdit.ExecSQL;
 Base.SQLVisitCurrentSession.Active:=False;
 Base.SQLVisitCurrentSession.Active:=True;
 CheckVisitorNow;
end;

procedure ShowVisitorAdd;
begin
 Application.ProcessMessages;
 Application.CreateForm(TVisitorAdd,VisitorAdd);
 Application.ProcessMessages;
 Base.SQLVisitor.SQL.Clear;
 Base.SQLVisitor.SQL.Append('SELECT Visitor.phone_visitor,Visitor.lastvisit_visitor,Visitor.id_visitor, Visitor.name_visitor, Visitor.discount_visitor, Blacklist.start_blacklist, Visitor.comment_visitor');
 Base.SQLVisitor.SQL.Append('FROM Visitor LEFT JOIN Blacklist ON Visitor.id_visitor = Blacklist.id_visitor');
 Base.SQLVisitor.SQL.Append('ORDER BY Visitor.name_visitor');
 Base.SQLVisitor.Active:=True;
 Base.SQLStat.Active:=False;
 Base.SQLStat.Parameters.ParamByName('idV').Value:=Base.SQLVisitorid_visitor.Value;
 Base.SQLStat.Active:=True;
 Application.ProcessMessages;
 VisitorAdd.ShowModal;
end;

procedure OpenNewSession;
begin
 Base.SQLCurrentSession.Active:=False;
 Base.SQLCurrentSession.Parameters.ParamByName('dat').Value:=Date;
 Base.SQLCurrentSession.Active:=True;
 if Base.SQLCurrentSession.RecordCount=0 then
 begin
  Base.SQLCreateSession.Active:=False;
  Base.SQLCreateSession.Parameters.ParamByName('dateSession').Value:=Date;
  Base.SQLCreateSession.Parameters.ParamByName('startSession').Value:=Now;
  Base.SQLCreateSession.Parameters.ParamByName('idUser').Value:=id_user;
  Base.SQLCreateSession.ExecSQL;
  Base.SQLCurrentSession.Active:=False;
  Base.SQLCurrentSession.Parameters.ParamByName('dat').Value:=Date;
  Base.SQLCurrentSession.Active:=True;
  id_current_session:=Base.SQLCurrentSessionid_session.AsString;
  config:=TIniFile.Create(patch_app+'\conf\settings.ini');
  config.WriteString('APP','last_session_id',id_current_session);
  config.Destroy;
  Main.PANBTNOpenSession.Visible:=False;
  Main.PANBTNCloseSession.Visible:=True;
  Base.SQLVisitCurrentSession.Active:=False;
  Base.SQLVisitCurrentSession.Parameters.ParamByName('idS').Value:=id_current_session;
  Base.SQLVisitCurrentSession.Active:=True;
  CheckVisitorNow;
  Main.PANWork.Visible:=True;
  Main.CPANActions.Visible:=True;
  Main.CPANActions.Collapsed:=True;
 end
 else
 ShowMessage('Смена '+datetostr(date)+' закрыта');
end;

end.
