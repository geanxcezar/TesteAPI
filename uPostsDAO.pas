unit uPostsDAO;

interface

uses
  uDM, uPosts, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, System.SysUtils,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;
type
  TPostsDAO = class

  private
    FQuery : TFDQuery;

  public
    constructor Create;
    destructor Destroy; override;

    function Consultar(PPosts: TPosts): TDataSet;
    procedure Alterar(PPosts: TPosts);
    procedure Incluir(PPosts: TPosts);
    procedure Excluir(PId: Integer);
    procedure LimpaTabela;
end;

implementation

{ TPostsDAO }

uses uConexao, uLog;

constructor TPostsDAO.Create;
begin
  inherited Create;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := TConexao.Instance.Connection;
end;

destructor TPostsDAO.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

procedure TPostsDAO.Excluir(PId: Integer);
var
  wId, wUserId : Integer;
  wTitle, wBody : String;
begin
  FQuery.Close;
  FQuery.SQL.Text:= ' Select * from TABPOSTS where id = :P1 ';
  FQuery.ParamByName('P1').AsInteger:= PId;
  FQuery.Open;

  if FQuery.IsEmpty then
   Exit;

  wId    := FQuery.FieldByName('Id').AsInteger;
  wUserId:= FQuery.FieldByName('UserId').AsInteger;
  wTitle := FQuery.FieldByName('Title').AsString;
  wBody  := FQuery.FieldByName('Body').AsString;

  try
    FQuery.Connection.StartTransaction;


    FQuery.Close;
    FQuery.SQL.Text:= ' delete FROM TABPOSTS where id = :P1';
    FQuery.ParamByName('P1').AsInteger:= PId;
    FQuery.ExecSQL;

    FQuery.Connection.Commit;

    TLog.Instance.RegistrarLogPosts('EXCLUSAO', wId, wUserId, wTitle, wBody);
  Except
    FQuery.Connection.Rollback;
  end;
end;

procedure TPostsDAO.Incluir(PPosts: TPosts);
begin
  try
    FQuery.Connection.StartTransaction;
    FQuery.Close;
    FQuery.SQL.Text:= ' Insert Into TABPOSTS (id, userId, title, body ) '+
                      '                Values(:P1, :P2, :P3, :P4) ';
    FQuery.ParamByName('P1').AsInteger:= PPosts.Id;
    FQuery.ParamByName('P2').AsInteger:= PPosts.UserId;
    FQuery.ParamByName('P3').AsString := PPosts.Title;
    FQuery.ParamByName('P4').AsString := PPosts.Body;
    FQuery.ExecSQL;
    FQuery.Connection.Commit;
  Except
    FQuery.Connection.Rollback;
  end;
end;

procedure TPostsDAO.LimpaTabela;
begin
  try
    FQuery.Connection.StartTransaction;
    FQuery.Close;
    FQuery.SQL.Text:= ' DELETE FROM TABPOSTS ';
    FQuery.ExecSQL;
    FQuery.Connection.Commit;
  Except
    FQuery.Connection.Rollback;
  end;
end;

{ TPostsDAO }

procedure TPostsDAO.Alterar(PPosts: TPosts);
begin
  try
    FQuery.Connection.StartTransaction;

    FQuery.Close;
    FQuery.SQL.Text:= ' Update TABPOSTS set title = :P3, body= :P4  '+
                       ' where id = :P1  ' ;
    FQuery.ParamByName('P1').AsInteger:= PPosts.Id;
    FQuery.ParamByName('P3').AsString := PPosts.Title;
    FQuery.ParamByName('P4').AsString := PPosts.Body;
    FQuery.ExecSQL;
    FQuery.Connection.Commit;

    TLog.Instance.RegistrarLogPosts('EDICAO',PPosts.Id,PPosts.UserId, PPosts.Title,PPosts.Body);
  Except
    FQuery.Connection.Rollback;
  end;

end;

function TPostsDAO.Consultar(PPosts: TPosts): TDataSet;
var
  wSql : String;
begin
  if Assigned(PPosts) then
  begin
    if PPosts.UserId > 0 then
       wSql := 'and userId = ' + QuotedStr(IntToStr(PPosts.UserId))
    else if PPosts.Id > 0 then
       wSql := 'and  Id = ' + QuotedStr(IntToStr(PPosts.Id))
    else if PPosts.Title <> '' then
       wSql := 'and title like ' +QuotedStr('%'+PPosts.Title+'%');

  end;

  FQuery.Close;
  FQuery.SQL.Text:= ' Select * from TABPOSTS where 1 = 1 ' +wSql;
  FQuery.Open;

  result := FQuery;
end;

end.


