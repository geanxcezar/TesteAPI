object FRMCadastroPosts: TFRMCadastroPosts
  Left = 0
  Top = 0
  Caption = 'Cadastro de Posts Banco de Dados'
  ClientHeight = 213
  ClientWidth = 759
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object userId: TLabel
    Left = 15
    Top = 60
    Width = 31
    Height = 13
    Caption = 'userId'
  end
  object title: TLabel
    Left = 28
    Top = 94
    Width = 18
    Height = 13
    Caption = 'title'
  end
  object id: TLabel
    Left = 38
    Top = 27
    Width = 8
    Height = 13
    Caption = 'id'
  end
  object body: TLabel
    Left = 28
    Top = 126
    Width = 24
    Height = 13
    Caption = 'body'
  end
  object EditUserId: TEdit
    Left = 64
    Top = 57
    Width = 97
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object EditTitle: TEdit
    Left = 64
    Top = 91
    Width = 633
    Height = 21
    TabOrder = 2
  end
  object EditId: TEdit
    Left = 64
    Top = 24
    Width = 97
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object BtnGravar: TButton
    Left = 64
    Top = 165
    Width = 97
    Height = 30
    Caption = 'Gravar'
    TabOrder = 4
    OnClick = BtnGravarClick
  end
  object BtnVoltar: TButton
    Left = 600
    Top = 165
    Width = 97
    Height = 30
    Caption = 'Voltar'
    TabOrder = 5
    OnClick = BtnVoltarClick
  end
  object EditBody: TEdit
    Left = 64
    Top = 123
    Width = 633
    Height = 21
    TabOrder = 3
  end
end
