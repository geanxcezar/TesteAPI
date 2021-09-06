program Project1;

uses
  Vcl.Forms,
  uFRMMenu in 'uFRMMenu.pas' {FRMMenu},
  uDm in 'uDm.pas' {DataModule2: TDataModule},
  uPosts in 'uPosts.pas',
  uConsultaPosts in 'uConsultaPosts.pas' {FRMConsultaPosts},
  uCadastroPosts in 'uCadastroPosts.pas' {FRMCadastroPosts},
  uConexao in 'uConexao.pas',
  uPostsDAO in 'uPostsDAO.pas',
  uLog in 'uLog.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFRMMenu, FRMMenu);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TFRMConsultaPosts, FRMConsultaPosts);
  Application.CreateForm(TFRMCadastroPosts, FRMCadastroPosts);
  Application.Run;
end.
