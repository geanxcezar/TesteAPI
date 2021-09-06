object FRMConsultaPosts: TFRMConsultaPosts
  Left = 0
  Top = 0
  Caption = 'Consulta Posts Banco Dados'
  ClientHeight = 394
  ClientWidth = 841
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Codigo: TLabel
    Left = 16
    Top = 20
    Width = 42
    Height = 13
    Caption = 'Consulta'
  end
  object EditConsulta: TEdit
    Left = 16
    Top = 37
    Width = 569
    Height = 21
    TabOrder = 0
  end
  object BtnConsultar: TButton
    Left = 728
    Top = 33
    Width = 97
    Height = 30
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = BtnConsultarClick
  end
  object DBGridPosts: TDBGrid
    Left = 17
    Top = 72
    Width = 809
    Height = 272
    DataSource = DSConsulta
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BtnEditar: TButton
    Left = 16
    Top = 356
    Width = 94
    Height = 30
    Caption = 'Editar'
    TabOrder = 3
    OnClick = BtnEditarClick
  end
  object BtnVoltar: TButton
    Left = 731
    Top = 356
    Width = 94
    Height = 30
    Caption = 'Voltar'
    TabOrder = 4
    OnClick = BtnVoltarClick
  end
  object BtnExcluir: TButton
    Left = 128
    Top = 356
    Width = 94
    Height = 30
    Caption = 'Excluir'
    TabOrder = 5
    OnClick = BtnExcluirClick
  end
  object ComboBoxTipPesq: TComboBox
    Left = 591
    Top = 37
    Width = 132
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 6
    Text = 'id'
    Items.Strings = (
      'id'
      'userId'
      'title')
  end
  object DSConsulta: TDataSource
    Left = 328
    Top = 200
  end
end
