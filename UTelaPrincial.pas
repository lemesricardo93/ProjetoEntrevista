unit UTelaPrincial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Data.DB, IBCustomDataSet, IBQuery, IBDatabase, UTELACONSULTA, UFormatacao,
  RLConsts,
  UDM;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtNOME: TEdit;
    edtENDERECO: TEdit;
    edtCIDADE: TEdit;
    Label6: TLabel;
    cbxUF: TComboBox;
    Salvar: TButton;
    Alterar: TButton;
    Localizar: TButton;
    Excluir: TButton;
    Label7: TLabel;
    edtIE: TEdit;
    Label8: TLabel;
    cbxFUNCIONARIO: TComboBox;
    Button5: TButton;
    mskTELEFONE: TMaskEdit;
    edtCPF: TMaskEdit;
    Label9: TLabel;
    mskCELULAR: TMaskEdit;
    Label10: TLabel;
    edtCODIGO: TEdit;
    Label11: TLabel;
    Data: TDateTimePicker;
    Label12: TLabel;
    cbxSITUACAO: TComboBox;
    Label13: TLabel;
    memoOBSERVACAO: TMemo;
    IBTra: TIBTransaction;
    IBQuery: TIBQuery;
    procedure SalvarClick(Sender: TObject);
    procedure AlterarClick(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
    procedure LocalizarClick(Sender: TObject);
    procedure focus(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Form1troy(Sender: TObject);
  private
    function verificaOs(pCODIGO: Integer): Boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.verificaOs(pCODIGO: Integer): Boolean;
BEGIN
  if pCODIGO > 0 then
  begin
    result := True;
  end
  else
  begin
    result := false;
  end;

END;

procedure TForm1.AlterarClick(Sender: TObject);
var
  strAtendente: string;
  intID: Integer;
  strIDAtendente: string;

BEGIN
  strAtendente := Trim(cbxFUNCIONARIO.Text);
  strIDAtendente := '';

  for intID := 1 to Length(strAtendente) do
  begin
    if (strAtendente[intID] = '-') then
    begin
      Break;
    end;
    strIDAtendente := strIDAtendente + Trim(strAtendente[intID]);
  end;

  begin

    if (verificaOs(StrToIntDef(edtCODIGO.Text, 0))) then
    BEGIN
      if (IBTra.Active) then

        IBTra.Commit;

      IBTra.StartTransaction;
      try

        with (IBQuery) do
        begin
          CLOSE;
          sql.Clear;
          sql.Add('UPDATE CANDIDATO SET');
          sql.Add('NOME_CAND = :pNOME,');
          sql.Add('CPF_CAND = :pCPF,');
          sql.Add('IE_CAND =:pIE,');
          sql.Add('ENDERECO_CAND = :pENDERECO,');
          sql.Add('CIDADE_CAND = :pCIDADE,');
          sql.Add('UF_CAND = :pUF ,');
          sql.Add('TELEFONE = :pTELEFONE,');
          sql.Add('CELULAR = :pCELULAR,');
          sql.Add('OBSERVACAO = :pOBSERVACAO,');
          sql.Add('COD_FUNCIONARIO = :pCODFUNCIONARIO,');
          sql.Add('SITUACAO = :pSITUACAO,');
          sql.Add('DATA =:pDATA');
          sql.Add('where CODIGO_CAND =' + quotedSTr(edtCODIGO.Text));

          ParamByName('pNOME').AsString := Trim(edtNOME.Text);
          ParamByName('pCPF').AsString := EliminarFOrmatacao(edtCPF.Text);
          ParamByName('pIE').AsString := (edtIE.Text);
          ParamByName('pENDERECO').AsString := Trim(edtENDERECO.Text);
          ParamByName('pCIDADE').AsString := Trim(edtCIDADE.Text);
          ParamByName('pUF').AsInteger := cbxUF.ItemIndex;
          ParamByName('pTELEFONE').AsString :=
            EliminarFOrmatacao(mskTELEFONE.Text);
          ParamByName('pCELULAR').AsString :=
            EliminarFOrmatacao(mskCELULAR.Text);
          ParamByName('pOBSERVACAO').AsString := Trim(memoOBSERVACAO.Text);
          ParamByName('pCODFUNCIONARIO').AsInteger := StrToInt(strIDAtendente);
          ParamByName('pSITUACAO').AsInteger := cbxSITUACAO.ItemIndex;
          ParamByName('pDATA').asdate := Data.Date;

          ExecSQL;
          IBTra.Commit;
          ShowMessage('CANDIDATO ALTERADO COM SUCESSO!');
        END
      except
        on E: Exception do
        begin
          IBTra.Rollback;
        end;
      END;

    END;
  END;

end;

procedure TForm1.ExcluirClick(Sender: TObject);
begin
  try
    if (IBTra.Active) then
    BEGIN
      IBTra.Commit;
    END;

    IBTra.StartTransaction;
    try
      with IBQuery do
      begin
        sql.Add('select');
        sql.Add('C.CODIGO_CAND,');
        sql.Add('C.NOME_CAND,');
        sql.Add('C.CPF_CAND,');
        sql.Add('C.IE_CAND,');
        sql.Add('C.ENDERECO_CAND,');
        sql.Add('C.CIDADE_CAND,');
        sql.Add('C.UF_CAND,');
        sql.Add('C.TELEFONE,');
        sql.Add('C.CELULAR,');
        sql.Add('C.OBSERVACAO');
        sql.Add('C.COD_FUN,');
        sql.Add('C.SITUACAO,');
        sql.Add('C.DATA');

        sql.Add('FROM CANDIDATO C');
      end;
      IBTra.Rollback;
    finally

    end;
  finally

  END;
end;

procedure TForm1.LocalizarClick(Sender: TObject);
begin
  try
    Application.CreateFORM(TFORM2, FORM2);
    FORM2.SHOWMODAL;
  finally
    FORM2.CloseQuery;
  end;

end;

procedure TForm1.SalvarClick(Sender: TObject);
var
  strAtendente: string;
  intID: Integer;
  strIDAtendente: string;
begin
  if cbxSITUACAO.ItemIndex = -1 then
  begin
    ShowMessage('Status nao Informado');
    exit;
  end;
  if edtNOME.Text = '' then
  begin
    ShowMessage('Erro Solicitade nao Informado');
    exit;
  end;

  strAtendente := Trim(cbxFUNCIONARIO.Text);
  strIDAtendente := '';

  for intID := 1 to Length(strAtendente) do
  begin
    if (strAtendente[intID] = '-') then
    begin
      Break;
    end;
    strIDAtendente := strIDAtendente + Trim(strAtendente[intID]);
  end;

  if (IBTra.Active) then
  BEGIN
    IBTra.Commit;

    IBTra.StartTransaction;
    try
      with (IBQuery) do
      begin
        CLOSE;
        sql.Clear;
        sql.Add('insert into candidato  (');
        sql.Add('CODIGO_CAND,');
        sql.Add('NOME_CAND,');
        sql.Add('CPF_CAND,');
        sql.Add('IE_CAND,');
        sql.Add('ENDERECO_CAND,');
        sql.Add('CIDADE_CAND,');
        sql.Add('UF_CAND,');
        sql.Add('TELEFONE,');
        sql.Add('CELULAR,');
        sql.Add('OBSERVACAO,');
        sql.Add('COD_FUNCIONARIO,');
        sql.Add('SITUACAO,');
        sql.Add('DATA');
        sql.Add(') Values (');
        sql.Add(':pCODIGO,');
        sql.Add(':pNOME,');
        sql.Add(':pCPF,');
        sql.Add(':pIE,');
        sql.Add(':pENDERECO,');
        sql.Add(':pCIDADE,');
        sql.Add(':pUF,');
        sql.Add(':pTELEFONE,');
        sql.Add(':pCELULAR,');
        sql.Add(':pOBSERVACAO,');
        sql.Add(':pCODFUNCIONARIO,');
        sql.Add(':pSITUACAO,');
        sql.Add(':pDATA)');

        ParamByName('pCODIGO').AsInteger;
        ParamByName('pNOME').AsString := Trim(edtNOME.Text);
        ParamByName('pCPF').AsString := EliminarFOrmatacao(edtCPF.Text);
        ParamByName('pIE').AsString := (edtIE.Text);
        ParamByName('pENDERECO').AsString := Trim(edtENDERECO.Text);
        ParamByName('pCIDADE').AsString := Trim(edtCIDADE.Text);
        ParamByName('pUF').AsInteger := cbxUF.ItemIndex;
        ParamByName('pTELEFONE').AsString :=
          EliminarFOrmatacao(mskTELEFONE.Text);
        ParamByName('pCELULAR').AsString := EliminarFOrmatacao(mskCELULAR.Text);
        ParamByName('pOBSERVACAO').AsString := Trim(memoOBSERVACAO.Text);
        ParamByName('pCODFUNCIONARIO').AsInteger := StrToInt(strIDAtendente);
        ParamByName('pSITUACAO').AsInteger := cbxSITUACAO.ItemIndex;
        ParamByName('pDATA').asdate := Data.Date;

        ExecSQL;
        IBTra.Commit;
        ShowMessage('Candidato Inserido com Sucesso!');
      END
    except
      on E: Exception do
      begin
        IBTra.Rollback;
        // ShowMessage('Erro nos Parametros' + 'motivo' + E.message);

      end;
    end;

  end;

END;

procedure TForm1.focus(Sender: TObject);
var
  objQuery: TIBQuery;
  objTrasacao: TIBTransaction;
  intID: Integer;
begin
  Data.Date := Date;
  objQuery := TIBQuery.Create(nil);
  objTrasacao := TIBTransaction.Create(nil);
  objQuery.Database := dm.IBDatabase1;
  objTrasacao.DefaultDatabase := dm.IBDatabase1;
  objQuery.Transaction := objTrasacao;
  edtNOME.setFocus;

  if (objTrasacao.Active) then
    objTrasacao.Commit;
  objTrasacao.StartTransaction;
  try
    try
      with (objQuery) do
      begin
        CLOSE;
        sql.Clear;
        sql.Add('SELECT');
        sql.Add('cod_fun,');
        sql.Add('nome_fun');
        sql.Add('FROM funcionario ');
        Open;
        while (not objQuery.Eof) do
        begin
          cbxFUNCIONARIO.Items.Add(StringOfChar('0',
            2 - Length(objQuery.FieldByName('cod_fun').AsString)) +
            (objQuery.FieldByName('cod_fun').AsString) + ' - ' +
            (objQuery.FieldByName('nome_fun').AsString));
          next;
        end;
      end;
      objTrasacao.Commit;
    except
      on E: Exception do
      begin
        objTrasacao.Rollback;
      end;
    end;
  finally
    FreeAndNil(objQuery);
    FreeAndNil(objTrasacao);
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  intRow: Integer;
begin
  if IBTra.Active then

    IBTra.Commit;
  IBQuery.CLOSE;
  Action := caFree;

end;

procedure TForm1.Form1troy(Sender: TObject);
begin
  Form1 := NIL;
end;

initialization

RLConsts.SetVersion(3, 71, 'B');

end.
