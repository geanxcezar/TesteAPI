unit uCadastroPosts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uPosts, uDm, System.Rtti;

type
  TFRMCadastroPosts = class(TForm)
    userId: TLabel;
    title: TLabel;
    id: TLabel;
    EditUserId: TEdit;
    EditTitle: TEdit;
    EditId: TEdit;
    BtnGravar: TButton;
    BtnVoltar: TButton;
    body: TLabel;
    EditBody: TEdit;
    procedure BtnVoltarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMCadastroPosts: TFRMCadastroPosts;

implementation

{$R *.dfm}

uses uPostsDAO;

procedure TFRMCadastroPosts.BtnGravarClick(Sender: TObject);
var
  wPosts: TPosts;
  wPostsDAO: TPostsDAO;
begin
  wPosts := TPosts.Create;
  wPostsDAO := TPostsDAO.Create;
  try
    wPosts.UserId:= (StrToint(Self.EditUserId.Text));
    wPosts.Id    := (StrToint(Self.EditId.Text));
    wPosts.Title := (Self.EditTitle.Text);
    wPosts.Body  := (Self.EditBody.Text);

    wPostsDAO.Alterar(wPosts);
  finally
    FreeAndNil(wPosts);
    FreeAndNil(wPostsDAO);
  end;
  Close;
end;

procedure TFRMCadastroPosts.BtnVoltarClick(Sender: TObject);
begin
  close;
end;

end.
