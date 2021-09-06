unit uLog;

interface
uses Forms, System.SysUtils;

type
  TLog = class

  private
    { Private declarations }
    ArquivoLog: TextFile;
    constructor Create;

    destructor Destroy; override;

    class var FInstance: TLog;
    class function GetInstance: TLog; static;
  public
    class property Instance: TLog read GetInstance;
    procedure RegistrarLog(const Texto: string);
    procedure RegistrarLogPosts(const PTipo: String; const PId, PUserID: integer; const PTitle, PBody: string);
  end;

implementation

{ TLog }

constructor TLog.Create;
var
  DiretorioAplicacao: string;
begin
  DiretorioAplicacao := ExtractFilePath(Application.ExeName);
  AssignFile(ArquivoLog, DiretorioAplicacao + 'Log.txt');

  if not FileExists(DiretorioAplicacao + 'Log.txt') then
  begin
    Rewrite(ArquivoLog);
    CloseFile(ArquivoLog);
  end;
end;

destructor TLog.Destroy;
begin
  inherited;
end;

class function TLog.GetInstance: TLog;
begin
  If FInstance = nil Then
    FInstance := TLog.Create();

  Result := FInstance;
end;

procedure TLog.RegistrarLog(const Texto: string);
var
  sDataHora: string;
begin
  Append(ArquivoLog);

  sDataHora := FormatDateTime('[dd/mm/yyyy hh:nn:ss] ', Now);
  WriteLn(ArquivoLog, sDataHora + Texto);

  CloseFile(ArquivoLog);
end;


procedure TLog.RegistrarLogPosts(const PTipo: String; const PId, PUserID: integer; const PTitle,
  PBody: string);
var
  wTexto: string;
begin
  wTexto := ' - '+PTipo+' - Id: '+IntToStr(PId)+' - UserId: '+IntToStr(PUserID)+' - Title: '+PTitle+' - Body '+PBody;

  RegistrarLog(wTexto);
end;

initialization

finalization
  if Assigned(TLog.FInstance) then
    FreeAndNil(TLog.FInstance);

end.
