unit uDm;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBCustomDataSet, IBX.IBDatabase,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.Phys.IBBase, FireDAC.Comp.DataSet,
  REST.Response.Adapter, Vcl.Forms;

type
  TDataModule2 = class(TDataModule)
    RESTPosts: TRESTClient;
    ReqPostsGet: TRESTRequest;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    RESTResponse1: TRESTResponse;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


end.
