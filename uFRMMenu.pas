unit uFRMMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, Vcl.StdCtrls, REST.Client,
  REST.Authenticator.Basic, Data.Bind.Components, Data.Bind.ObjectScope,
  uConsultaPosts, uDM, uPosts, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, System.JSON, REST.Types, FireDAC.Phys.FBDef, FireDAC.Phys,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Phys.IBDef, FireDAC.Phys.IB,
  uPostsDAO, REST.Json;

type
  TFRMMenu = class(TForm)
    BtnPegar: TButton;
    MainMenu1: TMainMenu;
    Consultas1: TMenuItem;
    Sair1: TMenuItem;
    ConsultaPosts1: TMenuItem;
    btnIncluirTodos: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure BtnPegarClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure ConsultaPosts1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirTodosClick(Sender: TObject);
  private
    { Private declarations }
    FPostsDao : TPostsDAO;
    procedure GET_Posts;
    procedure ProcessarGET;
    procedure ProcessarGETErro(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FRMMenu: TFRMMenu;

implementation
{$R *.dfm}

procedure TFRMMenu.btnIncluirTodosClick(Sender: TObject);
var
  Item: TListItem;
  Posts: TPosts;
begin
  if Application.MessageBox('Deseja popular tabela Posts no banco dados?','Confirmação',MB_yesno+MB_iconInformation) = id_yes then
  begin
    //Limpar tabela para garantir dados
    FPostsDao.LimpaTabela;

    uDM.DataModule2.FDMemTable1.First;
    while not uDM.DataModule2.FDMemTable1.Eof do
    begin
      Posts := TPosts.Create;
      Posts.Id    := uDM.DataModule2.FDMemTable1.FieldByName('id').AsInteger;
      Posts.UserId:= uDM.DataModule2.FDMemTable1.FieldByName('Userid').AsInteger;
      Posts.Title := uDM.DataModule2.FDMemTable1.FieldByName('title').AsString;
      Posts.Body  := uDM.DataModule2.FDMemTable1.FieldByName('Body').AsString;
      FPostsDao.Incluir(Posts);
      uDM.DataModule2.FDMemTable1.Next;
    end;
    showmessage('População de dados no banco efetuada com sucesso!');
  end
  else
    showmessage('Inclusão de dados no banco interrompida!');
end;

procedure TFRMMenu.BtnPegarClick(Sender: TObject);
var
  Item: TListItem;
begin
  GET_Posts;
end;

procedure TFRMMenu.ConsultaPosts1Click(Sender: TObject);
var
  wFRMConsultaPosts: TFRMConsultaPosts;
begin
  wFRMConsultaPosts := TFRMConsultaPosts.Create(nil);
  try
    wFRMConsultaPosts.ShowModal;
  finally
    FreeAndNil(wFRMConsultaPosts);
  end;
end;

procedure TFRMMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FPostsDao);
end;

procedure TFRMMenu.FormCreate(Sender: TObject);
begin
  FPostsDao:= TPostsDao.Create;
end;

procedure TFRMMenu.GET_Posts;
begin
  try
    udm.DataModule2.ReqPostsGet.ExecuteAsync(ProcessarGET, true, true, ProcessarGETErro);

  Except on ex:Exception do
    ShowMessage('Erro ao acessar o servidor: '+ex.Message);
  end;
end;

procedure TFRMMenu.ProcessarGET;
var
  json : string;
  arrayPosts : TJsonArray;
  i : integer;
  Item: TListItem;
begin
 if udm.DataModule2.ReqPostsGet.Response.StatusCode  <> 200 then
  begin
    showmessage('Ocorreu um erro na consulta: ' +
    udm.DataModule2.ReqPostsGet.Response.StatusCode.ToString);
  end;
end;

procedure TFRMMenu.ProcessarGETErro(Sender: TObject);
begin
   if Assigned(Sender) and (Sender is Exception) then
     ShowMessage(Exception(Sender).Message);
end;

procedure TFRMMenu.Sair1Click(Sender: TObject);
begin
  Close;
end;

end.
