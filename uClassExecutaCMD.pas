unit uClassExecutaCMD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TClassExecutaCMD = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecutarComando(const Comando: string): string;
  end;

var
  ClassExecutaCMD: TClassExecutaCMD;

implementation

{$R *.dfm}

function TClassExecutaCMD.ExecutarComando(const Comando: string): string;
const
  ReadBuffer = 2400;
var
  Security: TSecurityAttributes;
  ReadPipe, WritePipe: THandle;
  StartInfo: TStartUpInfo;
  ProcessInfo: TProcessInformation;
  Buffer: PAnsiChar;
  BytesRead: Cardinal;
  Apprunning: DWord;
begin
  Security.nLength := SizeOf(TSecurityAttributes);
  Security.bInheritHandle := True;
  Security.lpSecurityDescriptor := nil;

  if CreatePipe(ReadPipe, WritePipe, @Security, 0) then
  begin
    Buffer := AllocMem(ReadBuffer + 1);
    FillChar(StartInfo, SizeOf(TStartUpInfo), #0);
    StartInfo.cb := SizeOf(TStartUpInfo);
    StartInfo.hStdOutput := WritePipe;
    StartInfo.hStdInput := ReadPipe;
    StartInfo.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
    StartInfo.wShowWindow := SW_HIDE;

    if CreateProcess(nil, PChar('cmd.exe /C ' + Comando), @Security, @Security,
      True, NORMAL_PRIORITY_CLASS, nil, nil, StartInfo, ProcessInfo) then
    begin
      repeat
        Apprunning := WaitForSingleObject(ProcessInfo.hProcess, 100);
        Application.ProcessMessages;
      until (Apprunning <> WAIT_TIMEOUT);

      repeat
        BytesRead := 0;
        ReadFile(ReadPipe, Buffer[0], ReadBuffer, BytesRead, nil);
        Buffer[BytesRead] := #0;
        OemToAnsi(Buffer, Buffer);
        Result := Result + string(Buffer);
      until (BytesRead < ReadBuffer);
    end;

    FreeMem(Buffer);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
    CloseHandle(ReadPipe);
    CloseHandle(WritePipe);
  end;
end;

procedure TClassExecutaCMD.Button1Click(Sender: TObject);
var
  Comando: string;
  Resultado: string;
begin
  Comando := 'dir'; // Substitua pelo comando desejado
  Resultado := ExecutarComando(Comando);
  Memo1.Lines.Add(Resultado);
end;

end.

