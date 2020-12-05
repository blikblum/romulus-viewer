program RomulusViewer;

uses
  Vcl.Forms,
  MainView in 'MainView.pas' {MainForm},
  RomulusDatabase in 'src\RomulusDatabase.pas',
  DbUtils in 'src\DbUtils.pas',
  Utils in 'src\Utils.pas',
  RomulusProfile in 'src\RomulusProfile.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
