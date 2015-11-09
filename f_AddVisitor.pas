unit f_AddVisitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sMemo, sEdit, sLabel, Buttons, sBitBtn, acPNG,
  ExtCtrls, acImage, sComboBox, pngimage;

type
  TAddVisitor = class(TForm)
    LBLFioVisitor: TsLabel;
    EDITfioVisitor: TsEdit;
    LBLPhoneVisitor: TsLabel;
    EDITPhoneVisitor: TsEdit;
    LBLEmailVisitor: TsLabel;
    EDITEmailVisitor: TsEdit;
    LBLCommentVisitor: TsLabel;
    MEMOCommentVisitor: TsMemo;
    IMGFio: TsImage;
    IMGPhone: TsImage;
    IMGEmail: TsImage;
    IMGComment: TsImage;
    BTNSave: TsBitBtn;
    BTNCancel: TsBitBtn;
    IMGSale: TsImage;
    LBLSale: TsLabel;
    CBBSale: TsComboBox;
    procedure BTNCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTNSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddVisitor: TAddVisitor;
  id,fio:string;
implementation

uses s_Res, s_Base, s_constTeplo, f_VisitorAdd;

{$R *.dfm}

procedure TAddVisitor.BTNCancelClick(Sender: TObject);
begin
 AddVisitor.Close;
end;

procedure TAddVisitor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TAddVisitor.BTNSaveClick(Sender: TObject);
begin
 id:=Base.SQLVisitorid_visitor.AsString;
 if visitor_action='add' then
 begin
  Base.SQLCheckVisitorAdd.Active:=False;
  Base.SQLCheckVisitorAdd.Parameters.ParamByName('nameV').Value:=EDITfioVisitor.Text;
  Base.SQLCheckVisitorAdd.Parameters.ParamByName('phone').Value:=EDITPhoneVisitor.Text;
  Base.SQLCheckVisitorAdd.Active:=True;
  if base.SQLCheckVisitorAdd.RecordCount<>0 then
   ShowMessage('Невозможно добавить посетителя : Номер телефона уже зарегистрирован')
  else
  begin
   with Base.SQLEdit do
   begin
    Active:=False;
    SQL.Clear;
    SQL.Append('INSERT INTO Visitor (name_visitor,phone_visitor,email_visitor,comment_visitor,alltime_visitor,discount_visitor)');
    SQL.Append('VALUES ('+#39+EDITFioVisitor.Text+#39+','+#39+EDITPhoneVisitor.Text+#39+','+#39+EDITEmailvisitor.Text+#39+','+#39+MEMOCommentVisitor.Text+#39+','+'0'+','+CBBSale.Text+')');
    ExecSQL;
   end;
   Base.SQLVisitor.Active:=False;
   Base.SQLVisitor.Active:=True;
   AddVisitor.Close;
  end;
 end
 else
 if visitor_action='edit' then
 begin
  with Base.SQLEdit do
  begin
   Active:=False;
   SQL.Clear;
   SQL.Append('UPDATE Visitor');
   SQL.Append('SET name_visitor='+#39+EDITFioVisitor.Text+#39+',phone_visitor='+#39+EDITPhoneVisitor.Text+#39+',email_visitor='+#39+EDITEmailvisitor.Text+#39+',comment_visitor='+#39+MEMOCommentVisitor.Text+#39);
   SQL.Append('WHERE id_visitor='+id);
   ExecSQL;
  end;
  VisitorAdd.EDITSearch.Clear;
  VisitorAdd.EDITSearch.Text:=EDITfioVisitor.Text;
  AddVisitor.Close;
 end;
end;

procedure TAddVisitor.FormShow(Sender: TObject);
begin
 if visitor_action='edit' then fio:=EDITfioVisitor.Text;
end;

end.


