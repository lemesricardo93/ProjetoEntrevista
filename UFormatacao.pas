unit UFormatacao;

interface

uses System.SysUtils,IniFiles,ibdatabase,data.db;

function FormatarCPFCNPJ(const Doc: String): String;
function EliminarFormatacao(sTexto: String): String;
//function LeIni(strArqIni, strSecao, strVariavel: string): string;

implementation

function FormatarCPFCNPJ(const Doc: String): String;
begin
  if (Length(Doc) = 11) then
  begin
    Result := Copy(Doc, 1, 3) + '.' + Copy(Doc, 4, 3) + '.' + Copy(Doc, 7, 3) +
      '-' + Copy(Doc, 10, 2);
  end;
  if (Length(Doc) = 10) then
  begin

    Result := '(' + Copy(Doc, 1, 1) + Copy(Doc, 2, 1) + ')' + Copy(Doc, 3, 4) +
      '-' + Copy(Doc, 7, 4);
  end;
  if (Length(Doc) = 14) then
  begin
    Result := Copy(Doc, 1, 2) + '.' + Copy(Doc, 3, 3) + '.' + Copy(Doc, 6, 3) +
      '/' + Copy(Doc, 9, 4) + '-' + Copy(Doc, 13, 2);
  end;
end;
{
function LeIni(strArqIni, strSecao, strVariavel: string): string;
  var
    objArqIni: TIniFile;
    strString: string;
  begin
    Result := '';
    objArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + '/' +
      strArqIni);
    try
      Result := objArqIni.ReadString(strSecao, strVariavel, strString);
    finally
      objArqIni.Free;
    end;
  end;
      }
function EliminarFormatacao(sTexto: String): String;
var
  iPos: Integer;
  iTamanho: Integer;
  sTextoSemFormato: String;
  sCaractere: String;
  sCaracMascaras: String;
begin
  Result := sTexto;
  if Trim(sTexto) = '' then
  begin
    Exit;
  end;
  sTextoSemFormato := '';
  sCaracMascaras := './><_+=[]{}()-$&@*';
  iTamanho := Length(sTexto);
  for iPos := 1 to iTamanho do
  begin
    sCaractere := Trim(Copy(sTexto, iPos, 1));
    if (Pos(sCaractere, sCaracMascaras) = 0) AND (sCaractere <> '') then
    begin
      sTextoSemFormato := sTextoSemFormato + sCaractere;
    end;
  end;
  Result := sTextoSemFormato;
end;

end.
