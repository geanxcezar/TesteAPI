object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 269
  Width = 360
  object RESTPosts: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://jsonplaceholder.typicode.com'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 152
    Top = 32
  end
  object ReqPostsGet: TRESTRequest
    Client = RESTPosts
    Params = <>
    Resource = 'posts'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 152
    Top = 88
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    Left = 264
    Top = 32
  end
  object FDMemTable1: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 264
    Top = 96
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 160
    Top = 152
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 56
    Top = 24
  end
end
