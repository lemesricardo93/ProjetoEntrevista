program ENTREVISTA;

uses
  Vcl.Forms,
  UTelaPrincial in 'UTelaPrincial.pas' {Form1} ,
  UDM in 'UDM.pas' {dm: TDataModule} ,
  UTELACONSULTA in 'UTELACONSULTA.pas' {Form2} ,
  URELATORIO in 'URELATORIO.pas' {Form3} ,
  UFormatacao in 'UFormatacao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tdm, dm);
  Application.Run;

end.
