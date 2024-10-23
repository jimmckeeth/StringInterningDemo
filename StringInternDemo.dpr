program StringInternDemo;

uses
  FastMM4,
  Vcl.Forms,
  StringInternMain in 'StringInternMain.pas' {StringInternForm},
  StringPool in 'StringPool.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TStringInternForm, StringInternForm);
  Application.Run;
end.
