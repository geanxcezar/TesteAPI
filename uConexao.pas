unit uConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, Forms;

type
  TConexao = class
  private
    FConnection: TFDConnection;

    class var FInstance: TConexao;
    class function GetInstance: TConexao; static;

    constructor Create();
    destructor Destroy(); override;
  public
    class property Instance : TConexao read GetInstance;
    property Connection: TFDConnection read FConnection;
  end;

implementation

constructor TConexao.Create;
begin
  FConnection := TFDConnection.Create(nil);
  FConnection.Connected := False;
  FConnection.LoginPrompt := False;
  FConnection.Params.Clear;
  FConnection.Params.Add('DriverID=IB');
  FConnection.Params.Add('Database=C:\TesteAPI\BASE_API.FDB');
  FConnection.Params.Add('User_Name=SYSDBA');
  FConnection.Params.Add('Password=masterkey');
  FConnection.Connected := True;
end;

destructor TConexao.Destroy;
begin
  if Assigned(FConnection) then
  begin
    if FConnection.Connected then
      FConnection.Close;

    FreeAndNil(FConnection);
  end;

  inherited;
end;

class function TConexao.GetInstance: TConexao;
begin
  If FInstance = nil Then
    FInstance := TConexao.Create();

  Result := FInstance;
end;

initialization

finalization
  if Assigned(TConexao.FInstance) then
    FreeAndNil(TConexao.FInstance);

end.