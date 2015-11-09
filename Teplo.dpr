program Teplo;

uses
  IniFiles,
  Dialogs,
  SysUtils,
  Forms,
  f_Main in 'f_Main.pas' {Main},
  s_Base in 's_Base.pas' {Base: TDataModule},
  s_constTeplo in 's_constTeplo.pas',
  f_Login in 'f_Login.pas' {Login},
  s_Res in 's_Res.pas' {Res: TDataModule},
  f_All_users in 'f_All_users.pas' {All_users},
  f_User_edit in 'f_User_edit.pas' {User_edit},
  s_procTeplo in 's_procTeplo.pas',
  f_Rouls in 'f_Rouls.pas' {Rouls},
  f_VisitorAdd in 'f_VisitorAdd.pas' {VisitorAdd},
  s_BaseTread in 's_BaseTread.pas',
  f_ChangeTime in 'f_ChangeTime.pas' {ChangeTime},
  f_CalculateUser in 'f_CalculateUser.pas' {CalculateUser},
  f_AddVisitor in 'f_AddVisitor.pas' {AddVisitor},
  f_Settings in 'f_Settings.pas' {Settings},
  f_History in 'f_History.pas' {History};

var
 config:TIniFile;

{$R *.res}

begin
  Application.Initialize;
  patch_app:=ExtractFileDir(ParamStr(0));
  config:=TIniFile.Create(patch_app+'\conf\settings.ini');
  id_session_in_file:=config.ReadString('APP','last_session_id',id_session_in_file);
  config.Destroy;
  patch_base:=patch_app+'\base\base.mdb';
  Application.CreateForm(TBase, Base);
  Application.CreateForm(TRes, Res);
  Res.SKINTeplo.SkinDirectory:=ExtractFileDir(ParamStr(0))+'\conf';
  Res.SKINTeplo.SkinName:='white';
  Res.SKINTeplo.Active:=True;
  Base.conBase.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+patch_base+';Persist Security Info=False;Jet OLEDB:Database Password='+PSWDBASE;
  try
   Base.conBase.Connected:=True;
   except
   ShowMessage(ERRORDBCONNECTED);
  end;
   if Base.conBase.Connected=True then
   begin
    Base.SQLUsers.Active:=True;
    Base.SQLConfig.Active:=True;
    Base.SQLConfig.Locate('name_config','FirstHourPay',[]);
    first_hour_pay:=Base.SQLConfigvalue_config.AsString;
    Base.SQLConfig.Locate('name_config','OneMinutePay',[]);
    one_minute_pay:=Base.SQLConfigvalue_config.AsString;
    Base.SQLConfig.Active:=False;
    Base.SQLVisitor.Active:=True;
    Application.CreateForm(TMain,Main);
    Main.Caption:=APPTITLE+' Версия : '+APPVER;
    Main.LBLDate.Caption:=DateToStr(date);
    Res.TMRDateTime.Enabled:=True;
    Main.ShowModal;
    Application.Run;
   end
   else Application.Terminate;
end.
