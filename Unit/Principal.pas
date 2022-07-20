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
    Memo3: TMemo;
    procedure btnFormatarClick(Sender: TObject);
    procedure btnRemoverFormatacaoClick(Sender: TObject);
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
  vAux, vTextoLinha, vTextoAux : String;
  i, x : Integer;
  vRecomeca : Boolean;
begin
  if Trim(Memo1.Lines.Text) = '' then
  begin
    Application.MessageBox(PChar('Campo de origem vazio, favor preencher antes de continuar!'), 'Mais Soluções', MB_OK + MB_ICONSTOP + MB_TOPMOST);
    Memo1.SetFocus;
    Exit;
  end;

  if Copy(Trim(memo1.Lines.Text), 1, pos(' ', Trim(memo1.Lines.Text)) - 1) = 'INSERT' then
  begin
    memo2.lines.clear;
    vAux := Trim(Memo1.Lines.Text.Replace(#13#10, '')); // Retira o enter da string
    vAux := Trim(vAux.Replace(')', sLineBreak + ') ')); // Dá Enter quando encontrar o ")"
    vAux := Trim(vAux.Replace('(', '(' + sLineBreak));  // Da enter depois do "("
    vAux := Trim(vAux.Replace(',', ',' + sLineBreak));  // Insere Enter depois da Vírgula
    vAux := Trim(vAux.Replace(sLineBreak + ' ', '' + sLineBreak)); // Retira o enter e esaço e apenas coloca o Enter
    vAux := Trim(vAux.Replace('''', '"')); // Troca áspas simples por áspas duplas
    memo2.Lines.Add(Trim(vAux));
    vRecomeca := False;
    x := 000;
    for i := 0 to Memo2.Lines.Count -1 do
    begin
      if (not (Pos('(', memo2.Lines.Strings[i]) <> 0) and not(Pos(')', memo2.Lines.Strings[i]) <> 0)) then
      begin
        vTextoLinha := vTextoLinha + '{' + FormatFloat('000',x) + '}  ''' + memo2.Lines.Strings[i] + ' '' + ' + sLineBreak;
      end
      else if (Pos('VALUES', memo2.Lines.Strings[i]) <> 0) then
      begin
        x := 000;
        vTextoLinha := vTextoLinha + sLineBreak + '{' + FormatFloat('000',x) + '}  ''' + memo2.Lines.Strings[i] + ' '' + ' + sLineBreak;
        vRecomeca := True;
      end
      else
        vTextoLinha := vTextoLinha + '{' + FormatFloat('000',x) + '}  ''' + memo2.Lines.Strings[i] + ' '' + ' + sLineBreak;
      x := X + 1;
    end;

    memo2.Lines.Clear;
    memo2.Lines.Add(Trim(Copy(Trim(vTextoLinha), 1, Length(Trim(vTextoLinha)) - 1).Replace('"', '''' + '''')) + ';');
    Memo2.SelectAll;
    memo2.CopyToClipboard;
    ShowMessage('Copiado!');
  end
  else if Copy(Trim(memo1.Lines.Text), 1, pos(' ', Trim(memo1.Lines.Text)) - 1) = 'UPDATE' then
  begin
    memo2.lines.clear;
    vAux := Trim(Memo1.Lines.Text.Replace(#13#10, '')); // Retira o enter da string
    vAux := Trim(vAux.Replace(')', sLineBreak + ') ')); // Dá Enter quando encontrar o ")"
    vAux := Trim(vAux.Replace('(', '(' + sLineBreak));  // Da enter depois do "("
    vAux := Trim(vAux.Replace(',', ',' + sLineBreak));  // Insere Enter depois da Vírgula
    vAux := Trim(vAux.Replace(sLineBreak + ' ', '' + sLineBreak)); // Retira o enter e esaço e apenas coloca o Enter
    vAux := Trim(vAux.Replace('WHERE', sLineBreak + 'WHERE ')); // Faz quebra de linha no where
    vAux := Trim(vAux.Replace('FROM ', sLineBreak + 'FROM ')); // Faz quebra de linha no FROM
    vAux := Trim(vAux.Replace('AND ', sLineBreak + 'AND ')); // Faz quebra de linha no AND
    vAux := Trim(vAux.Replace('INNER JOIN ', sLineBreak + 'INNER JOIN ')); // Faz quebra de linha no INNER JOIN
    vAux := Trim(vAux.Replace('LEFT JOIN ', sLineBreak + 'LEFT JOIN ')); // Faz quebra de linha no LEFT JOIN
    vAux := Trim(vAux.Replace('RIGHT JOIN ', sLineBreak + 'RIGHT JOIN ')); // Faz quebra de linha no RIGHT JOIN
    vAux := Trim(vAux.Replace('''', '"')); // Troca áspas simples por áspas duplas
    memo2.Lines.Add(Trim(vAux));
    x := 000;
    for i := 0 to Memo2.Lines.Count -1 do
    begin
      vTextoLinha := vTextoLinha + '{' + FormatFloat('000',x) + '}  ''' + memo2.Lines.Strings[i] + ' '' + ' + sLineBreak;
      x := X + 1;
    end;

    memo2.Lines.Clear;
    memo2.Lines.Add(Trim(Copy(Trim(vTextoLinha), 1, Length(Trim(vTextoLinha)) - 1).Replace('"', '''' + '''')) + ';');
    Memo2.SelectAll;
    memo2.CopyToClipboard;
    ShowMessage('Copiado!');
  end
  else if Copy(Trim(memo1.Lines.Text), 1, pos(' ', Trim(memo1.Lines.Text)) - 1) = 'SELECT' then
  begin
    memo2.lines.clear;
    vAux := Trim(Memo1.Lines.Text.Replace(#13#10, '')); // Retira o enter da string
//    vAux := Trim(vAux.Replace(')', sLineBreak + ') ')); // Dá Enter quando encontrar o ")"
//    vAux := Trim(vAux.Replace('(', '(' + sLineBreak));  // Da enter depois do "("
    vAux := Trim(vAux.Replace(',', ',' + sLineBreak));  // Insere Enter depois da Vírgula
    vAux := Trim(vAux.Replace(sLineBreak + ' ', '' + sLineBreak)); // Retira o enter e esaço e apenas coloca o Enter
    vAux := Trim(vAux.Replace('WHERE', sLineBreak + 'WHERE ')); // Faz quebra de linha no where
    vAux := Trim(vAux.Replace('FROM ', sLineBreak + 'FROM ')); // Faz quebra de linha no FROM
    vAux := Trim(vAux.Replace('AND ', sLineBreak + 'AND ')); // Faz quebra de linha no AND
    vAux := Trim(vAux.Replace('INNER JOIN ', sLineBreak + 'INNER JOIN ')); // Faz quebra de linha no INNER JOIN
    vAux := Trim(vAux.Replace('LEFT JOIN ', sLineBreak + 'LEFT JOIN ')); // Faz quebra de linha no LEFT JOIN
    vAux := Trim(vAux.Replace('RIGHT JOIN ', sLineBreak + 'RIGHT JOIN ')); // Faz quebra de linha no RIGHT JOIN
    vAux := Trim(vAux.Replace('''', '"')); // Troca áspas simples por áspas duplas
    memo2.Lines.Add(Trim(vAux));
    x := 000;
    for i := 0 to Memo2.Lines.Count -1 do
    begin
      vTextoLinha := vTextoLinha + '{' + FormatFloat('000',x) + '}  ''' + memo2.Lines.Strings[i] + ' '' + ' + sLineBreak;
      x := X + 1;
    end;

    memo2.Lines.Clear;
    memo2.Lines.Add(Trim(Copy(Trim(vTextoLinha), 1, Length(Trim(vTextoLinha)) - 1).Replace('"', '''' + '''')) + ';');
    Memo2.SelectAll;
    memo2.CopyToClipboard;
    ShowMessage('Copiado!');
  end;

  x := 1;
  for i := 0 to Memo2.Lines.Count - 1 do
  begin
    if Pos(':', Memo2.Lines.Strings[i]) > 0 then
    begin
      vTextoAux := Memo2.Lines.Strings[i];
      Memo3.Lines.Add('vQuery.ParamByName(''' + Copy(vTextoAux, Pos(':', vTextoAux) + 1, Pos(',', vTextoAux) - Pos(':', vTextoAux) -1) + ''').AsString := Auxiliar' + IntToStr(x) + ';');
      Inc(x);
    end;
  end;
end;

procedure TfrPrincipal.btnRemoverFormatacaoClick(Sender: TObject);
var
  i : integer;
  vTextoLinha : String;
begin
  memo1.Lines.Clear;

  for i := 0 to memo2.Lines.Count -1 do
  begin
    vTextoLinha := Trim(memo2.Lines.Strings[i].Replace('  ', ' ').Replace(''' +', ''));
    if i = memo2.Lines.Count -1 then
    begin
      memo1.Lines.Add(Copy(vTextoLinha.Replace(''';', ''), Pos('''', vTextoLinha) + 1, Length(vTextoLinha)));
    end
    else
      memo1.Lines.Add(Copy(vTextoLinha.Replace('''' + '''', ''''), Pos('''', vTextoLinha) + 1, Length(vTextoLinha)));
  end;
end;

procedure TfrPrincipal.FormShow(Sender: TObject);
begin
  memo1.lines.Clear;
  memo2.lines.clear;
end;

end.
