unit uConsultaPosts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, uCadastroPosts, uPosts, Udm, uPostsDAO;

type
  TFRMConsultaPosts = class(TForm)
    Codigo: TLabel;
    EditConsulta: TEdit;
    BtnConsultar: TButton;
    DBGridPosts: TDBGrid;
    BtnEditar: TButton;
    BtnVoltar: TButton;
    BtnExcluir: TButton;
    ComboBoxTipPesq: TComboBox;
    DSConsulta: TDataSource;
    procedure BtnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    FPostsDao : TPostsDAO;
    FPosts : TPosts;
  public
    { Public declarations }
  end;

var
  FRMConsultaPosts: TFRMConsultaPosts;

implementation

{$R *.dfm}

procedure TFRMConsultaPosts.BtnConsultarClick(Sender: TObject);
begin
  FPosts.Id     := 0;
  FPosts.UserId := 0;
  FPosts.Title  :='';
  case ComboBoxTipPesq.ItemIndex of
    0: FPosts.Id     := StrToIntDef(EditConsulta.Text,0);
    1: FPosts.UserId := StrToIntDef(EditConsulta.Text,0);
    2: FPosts.Title  := Trim(EditConsulta.Text);
  end;

  DSConsulta.DataSet := FPostsDao.Consultar(FPosts);
end;

procedure TFRMConsultaPosts.BtnEditarClick(Sender: TObject);
var
  wFRMCadastroPosts : TFRMCadastroPosts;
begin
  if DSConsulta.DataSet.IsEmpty then
  begin
    ShowMessage('Não existe arquivo na consulta!');
    exit;
  end;

  wFRMCadastroPosts:= TFRMCadastroPosts.Create(nil);
  try
    wFRMCadastroPosts.EditUserId.Text:=  DSConsulta.DataSet.FieldByName('UserId').AsString;
    wFRMCadastroPosts.EditId.Text    :=  DSConsulta.DataSet.FieldByName('Id').AsString;
    wFRMCadastroPosts.EditTitle.Text :=  DSConsulta.DataSet.FieldByName('Title').AsString;
    wFRMCadastroPosts.EditBody.Text  :=  DSConsulta.DataSet.FieldByName('Body').AsString;
    wFRMCadastroPosts.ShowModal;
  finally
    FreeAndNil(wFRMCadastroPosts);
  end;
  BtnConsultar.Click;
end;

procedure TFRMConsultaPosts.BtnExcluirClick(Sender: TObject);
begin
  if DSConsulta.DataSet.IsEmpty then
  begin
    ShowMessage('Não existe arquivo na consulta!');
    exit;
  end;

  if Application.MessageBox('Deseja excluir registro no Banco?','Confirmação',MB_yesno+MB_iconInformation) = id_yes then
  begin
    FPostsDao.Excluir(DSConsulta.DataSet.FieldByName('Id').AsInteger);
  end;
  BtnConsultar.Click;
end;

procedure TFRMConsultaPosts.BtnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFRMConsultaPosts.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FPostsDao);
  FreeAndNil(FPosts);
end;

procedure TFRMConsultaPosts.FormCreate(Sender: TObject);
begin
  FPostsDao:= TPostsDao.Create;
  FPosts:= TPosts.Create;
end;

procedure TFRMConsultaPosts.FormShow(Sender: TObject);
begin
  BtnConsultar.Click;
end;

end.
