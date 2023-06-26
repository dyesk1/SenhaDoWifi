program SenhaDoWifi;

uses
  Vcl.Forms,
  uExecutaCmd in 'uExecutaCmd.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TClassExecutaCMD, ClassExecutaCMD);
  Application.Run;
end.
