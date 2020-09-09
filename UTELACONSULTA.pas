unit UTELACONSULTA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.DB, IBCustomDataSet, IBQuery, URELATORIO, IBDatabase,
  UFormatacao;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    cbxConsulta: TComboBox;
    grpPESQUISA: TGroupBox;
    edtCONSULTA: TEdit;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    Button1: TButton;
    IBQCONSULTA: TIBQuery;
    DataCONSULTA: TDataSource;
    IBTCONSULTA: TIBTransaction;
    procedure cbxConsultaChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtCONSULTAKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses UDM, UTelaPrincial;

procedure TForm2.Button1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFORM3, FORM3);
    FORM3.RLReport1.Preview;
  finally
    FORM3.FREE;
  end;

end;

procedure TForm2.cbxConsultaChange(Sender: TObject);
begin
  case cbxConsulta.ItemIndex of
    0:

      grpPESQUISA.Caption := 'C�digo';

    1:

      grpPESQUISA.Caption := 'Nome';
    2:

      grpPESQUISA.Caption := 'Cpf';

    3:
      grpPESQUISA.Caption := 'Cidade';

  end;

end;

procedure TForm2.DBGrid1DblClick(Sender: TObject);
var
  intRow: Integer;
begin
  with FORM1 do
  begin
    edtCODIGO.Text := IBQCONSULTA.FieldByName('CODIGO_CAND').AsString;
    Data.Date := IBQCONSULTA.FieldByName('DATA').AsDateTime;
    edtNOME.Text := IBQCONSULTA.FieldByName('NOME_CAND').AsString;
    MEMOOBSERVACAO.Text := IBQCONSULTA.FieldByName('OBSERVACAO').AsString;
    edtCPF.Text := FormatarCPFCNPJ(IBQCONSULTA.FieldByName('CPF_CAND')
      .AsString);
    msktelefone.Text := FormatarCPFCNPJ(IBQCONSULTA.FieldByName('TELEFONE')
      .AsString);
    mskcelular.Text := FormatarCPFCNPJ(IBQCONSULTA.FieldByName('celular')
      .AsString);
    edtCIDADE.Text := IBQCONSULTA.FieldByName('CIDADE_CAND').AsString;
    edtENDERECO.Text := IBQCONSULTA.FieldByName('ENDERECO_CAND').AsString;
    edtIE.Text := IBQCONSULTA.FieldByName('IE_CAND').AsString;

    for intRow := 0 to CbxFUNCIONARIO.Items.Count do
    begin

      CbxFUNCIONARIO.ItemIndex := intRow;
      if (IBQCONSULTA.FieldByName('COD_FUNCIONARIO').AsInteger)
        = StrToInt(copy(CbxFUNCIONARIO.Items.Strings[intRow], 1, 2)) then

      BEGIN
        break;
      END;
      begin
        CbxFUNCIONARIO.ItemIndex := -1;
      end;
    end;
    case IBQCONSULTA.FieldByName('SITUACAO').AsInteger of
      0:
        begin
          cbxSITUACAO.ItemIndex := 0;
        end;
      1:
        begin
          cbxSITUACAO.ItemIndex := 1;
        end;
      2:
        begin
          cbxSITUACAO.ItemIndex := 2;
        end;
      3:
        begin
          cbxSITUACAO.ItemIndex := 3;
        end;
    end;

    case IBQCONSULTA.FieldByName('UF_CAND').AsInteger of
      0:
        begin
          cbxUF.ItemIndex := 0;
        end;
      1:
        begin
          cbxUF.ItemIndex := 1;
        end;
      2:
        begin
          cbxUF.ItemIndex := 2;
        end;
      3:
        begin
          cbxUF.ItemIndex := 3;
        end;

    end;
    Form2.close;
  end;

end;



procedure TForm2.edtCONSULTAKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
SpeedButton1.Click;
end;

end;
procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  if (IBTCONSULTA.Active) then

    IBTCONSULTA.Commit;
  IBTCONSULTA.StartTransaction;

  with IBQCONSULTA DO
  begin
    close;
    sql.Clear;
    sql.Add('select');
    sql.Add('C.CODIGO_CAND,  C.NOME_CAND, C.CPF_CAND, C.IE_CAND, C.ENDERECO_CAND,');

    sql.Add(' C.CIDADE_CAND, C.UF_CAND, C.TELEFONE, C.CELULAR, C.OBSERVACAO,C.COD_FUNCIONARIO, F.NOME_FUN, C.SITUACAO, C.DATA,');
    sql.Add('(F.COD_FUN || ' + quotedStr('-') + ' || F.NOME_FUN)');
    sql.Add('FROM CANDIDATO C');
    sql.Add('LEFT JOIN FUNCIONARIO F ON (F.COD_FUN = C.COD_FUNCIONARIO)');

  end;

  if (cbxConsulta.ItemIndex = 0) then
  begin
    with IBQCONSULTA do
    begin

      sql.Add('where c.CODIGO_CAND like' +
        quotedStr('%%' + edtCONSULTA.Text + '%%'));
      sql.Add('order by codigo_cand');

      // ParamByName('CODIGO_CAN').AsInteger := StrTOInt;
      open;

    end;

  end

  else if (cbxConsulta.ItemIndex = 1) then
  begin
    with IBQCONSULTA do
    begin
      sql.Add('where C.NOME_CAND like' +
        quotedStr('%%' + Trim(edtCONSULTA.Text + '%%')));
      // ParamByName('CODIGO_FUNCIONARIO').AsString :=

      open;
    end;
  end
  else if (cbxConsulta.ItemIndex = 3) then
  begin
    with IBQCONSULTA do
    begin
      sql.Add('where C.CIDADE_CAND like :CIDADE_CAND');
      ParamByName('CIDADE_CAND').AsString := Trim(edtCONSULTA.Text) + '%';
      open;
    end

  end;

end;

end.
