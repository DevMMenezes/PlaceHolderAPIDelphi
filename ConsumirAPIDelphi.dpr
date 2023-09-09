program ConsumirAPIDelphi;

uses
  Vcl.Forms,
  uMain in 'Source\uMain.pas' {uFrmMain},
  Services.Users in 'Source\Services\Services.Users.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TuFrmMain, uFrmMain);
  Application.Run;
end.
