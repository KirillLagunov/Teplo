unit f_ChangeTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, acPNG, ExtCtrls, sLabel, Mask,
  sMaskEdit, sCustomComboEdit, sToolEdit, acImage;

type
  TChangeTime = class(TForm)
    MEDITTime: TsMaskEdit;
    LBLSetTime: TsLabel;
    BTNSave: TsBitBtn;
    BTNCancel: TsBitBtn;
    LBLDate: TsLabel;
    IMGDate: TsImage;
    IMGTime: TsImage;
    DTPDate: TsDateEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTNCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTNSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangeTime: TChangeTime;

implementation

uses s_Res, s_Base;

{$R *.dfm}

procedure TChangeTime.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TChangeTime.BTNCancelClick(Sender: TObject);
begin
 ChangeTime.Close;
end;

procedure TChangeTime.FormShow(Sender: TObject);
begin
 DTPDate.Date:=Date;
end;

procedure TChangeTime.BTNSaveClick(Sender: TObject);
var
  id,s:string;
begin
 id:=Base.SQLVisitCurrentSessionid_visit.AsString;
 s:=(DateToStr(DTPDate.Date)+' '+MEDITTime.Text+':00');
 Base.SQLUpdateTime.Active:=False;
 Base.SQLUpdateTime.Parameters.ParamByName('idVisit').Value:=id;
 Base.SQLUpdateTime.Parameters.ParamByName('dateB').Value:=StrToDateTime(S);
 Base.SQLUpdateTime.ExecSQL;
 Base.SQLVisitCurrentSession.Active:=False;
 Base.SQLVisitCurrentSession.Active:=True;
 Base.SQLVisitCurrentSession.Locate('id_visit',id,[]);
 ChangeTime.Close;
end;

end.
