unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrPrincipal = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    Memo2: TMemo;
    pnlFooter: TPanel;
    btnRemoverFormatacao: TButton;
    btnFormatar: TButton;
    procedure btnFormatarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPrincipal: TfrPrincipal;

implementation

{$R *.dfm}

procedure TfrPrincipal.btnFormatarClick(Sender: TObject);
var
  vAux, vLinha : String;
  i, x : Integer;
  vRecomeca : Boolean;
begin
  memo2.lines.clear;
  vAux := Trim(Memo1.Lines.Text.Replace(#13#10, ''));
  vAux := Trim(vAux.Replace(')', sLineBreak + ') '));
  vAux := Trim(vAux.Replace('(', '(' + sLineBreak));
  vAux := Trim(vAux.Replace(',', ',' + sLineBreak));
  vAux := Trim(vAux.Replace(sLineBreak + ' ', '' + sLineBreak));
  memo2.Lines.Add(Trim(vAux));
  vRecomeca := False;
  x := 000;
  for i := 0 to Memo2.Lines.Count -1 do
  begin
    if (not (Pos('(', memo2.Lines.Strings[i]) <> 0) and not(Pos(')', memo2.Lines.Strings[i]) <> 0)) then
    begin
      vLinha := vLinha + '{' + FormatFloat('000',x) + '}  ''' + memo2.Lines.Strings[i] + ' '' + ' + sLineBreak;
    end
    else if (Pos('VALUES', memo2.Lines.Strings[i]) <> 0) then
    begin
      x := 000;
      vLinha := vLinha + sLineBreak + '{' + FormatFloat('000',x) + '}  ''' + memo2.Lines.Strings[i] + ' '' + ' + sLineBreak;
      vRecomeca := True;
    end
    else
      vLinha := vLinha + '{' + FormatFloat('000',x) + '}  ''' + memo2.Lines.Strings[i] + ' '' + ' + sLineBreak;
    x := X + 1;
  end;

  memo2.Lines.Clear;
  memo2.Lines.Add(Trim(Copy(Trim(vLinha), 1, Length(Trim(vLinha)) - 1)) + ';');
  Memo2.SelectAll;
  memo2.CopyToClipboard;
  ShowMessage('Copiado!');
end;

procedure TfrPrincipal.FormShow(Sender: TObject);
begin
  memo1.lines.Clear;
  memo2.lines.clear;
end;

end.
