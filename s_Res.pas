unit s_Res;

interface

uses
  SysUtils, Classes, ImgList, Controls, sSkinManager, ExtCtrls;

type
  TRes = class(TDataModule)
    ILPic: TImageList;
    SKINTeplo: TsSkinManager;
    TMRDateTime: TTimer;
    procedure TMRDateTimeTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Res: TRes;

implementation

uses f_Main;

{$R *.dfm}

procedure TRes.TMRDateTimeTimer(Sender: TObject);
begin
 Main.LBLTime.Caption:=TimeToStr(Time);
 Main.LBLTime.Repaint;
end;

end.
