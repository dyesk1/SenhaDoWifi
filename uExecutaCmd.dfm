object ClassExecutaCMD: TClassExecutaCMD
  Left = 0
  Top = 0
  Caption = 'Senhas Salvas no Notebook'
  ClientHeight = 508
  ClientWidth = 867
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    867
    508)
  TextHeight = 15
  object LabelChave: TLabel
    Left = 8
    Top = 481
    Width = 851
    Height = 21
    Alignment = taCenter
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
    Caption = '(senha)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 199
    ExplicitWidth = 533
  end
  object Label1: TLabel
    Left = 8
    Top = 451
    Width = 169
    Height = 15
    AutoSize = False
    Caption = 'Digite o nome da rede aqui ->'
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 867
    Height = 440
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object editNomeRede: TEdit
    Left = 168
    Top = 447
    Width = 218
    Height = 23
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object Button2: TButton
    Left = 392
    Top = 446
    Width = 96
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Ver Senha'
    TabOrder = 2
    OnClick = Button2Click
  end
  object pnTopo: TPanel
    Left = 0
    Top = 0
    Width = 867
    Height = 41
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    ExplicitLeft = 136
    ExplicitTop = 152
    ExplicitWidth = 185
    DesignSize = (
      867
      41)
    object Button1: TButton
      Left = 8
      Top = 9
      Width = 153
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Procurar Redes'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
