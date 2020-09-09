unit URELATORIO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, RLReport;

type
  TForm3 = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLBand2: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel9: TRLLabel;
    DataSourceRELATORIO: TDataSource;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel11: TRLLabel;
    RLLabel10: TRLLabel;
    RLDBText5: TRLDBText;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses UTELACONSULTA;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form3.Free;
end;

procedure TForm3.RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  DataSourceRELATORIO.DataSet.Open;

end;

end.
