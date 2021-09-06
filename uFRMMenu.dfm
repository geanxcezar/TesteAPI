object FRMMenu: TFRMMenu
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 377
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BtnPegar: TButton
    Left = 12
    Top = 12
    Width = 165
    Height = 49
    Caption = 'Pegar POSTS API'
    TabOrder = 0
    OnClick = BtnPegarClick
  end
  object btnIncluirTodos: TButton
    Left = 193
    Top = 12
    Width = 165
    Height = 49
    Caption = 'Gravar Dados no Banco'
    TabOrder = 1
    OnClick = btnIncluirTodosClick
  end
  object DBGrid1: TDBGrid
    Left = 12
    Top = 69
    Width = 708
    Height = 295
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UserId'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'title'
        Width = 271
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'body'
        Width = 313
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 392
    Top = 16
    object Consultas1: TMenuItem
      Caption = 'Consultas'
      object ConsultaPosts1: TMenuItem
        Caption = 'Consulta Posts no Banco de Dados'
        OnClick = ConsultaPosts1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModule2.FDMemTable1
    Left = 440
    Top = 16
  end
end
