unit f_Rouls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, ExtCtrls, sPanel;

type
  TRouls = class(TForm)
    PANRoulsBTN: TsPanel;
    PANExit: TsPanel;
    BTNExit: TsBitBtn;
    PANAddRoul: TsPanel;
    BTNAddRoul: TsBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rouls: TRouls;

implementation

uses s_Base, s_Res;

{$R *.dfm}

end.
