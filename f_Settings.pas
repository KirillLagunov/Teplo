unit f_Settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sGroupBox,IniFiles;

type
  TSettings = class(TForm)
    GRBUserSettings: TsGroupBox;
    BTNUsers: TsBitBtn;
    GRBBaseSettings: TsGroupBox;
    BTNBaseBackup: TsBitBtn;
    BTNResetBase: TsBitBtn;
    GRBOtherSettings: TsGroupBox;
    BTNShowHistory: TsBitBtn;
    BTNShowStat: TsBitBtn;
    procedure BTNUsersClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTNBaseBackupClick(Sender: TObject);
    procedure BTNShowHistoryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Settings: TSettings;
  config:TIniFile;
implementation

uses s_Base, f_All_users, s_Res, s_constTeplo, f_History;

{$R *.dfm}

procedure TSettings.BTNUsersClick(Sender: TObject);
begin
 Base.SQLAllUsers.Active:=True;
 Application.CreateForm(TAll_users,All_users);

 if Base.SQLAllUsers.RecordCount=0 then All_users.PANEditClient.Visible:=False
 else All_users.PANEditClient.Visible:=True;

 All_users.ShowModal;
end;

procedure TSettings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TSettings.BTNBaseBackupClick(Sender: TObject);
var
  base,backup:PChar;
begin
 if not DirectoryExists(patch_app+'\base\backup') then
  ForceDirectories(patch_app+'\base\backup');
 if CopyFile(PChar(patch_base),PChar(patch_app+'\base\backup\base_'+datetostr(date)),True) then
 begin
  ShowMessage('Копия базы данных успешно создана');
  config:=TIniFile.Create(patch_app+'\conf\settings.ini');
  config.WriteString('BASE','last_backup',DateTimeToStr(now));
  config.Destroy;
 end
 else
   ShowMessage('Ошибка '+IntToStr(GetLastError));
end;

procedure TSettings.BTNShowHistoryClick(Sender: TObject);
begin
 Application.CreateForm(THistory,History);
 Base.SQLAllSessions.Active:=True;
 Base.SQLHistory.Active:=True;
 History.ShowModal;
end;

end.
