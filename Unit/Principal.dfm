object frPrincipal: TfrPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Converter Script'
  ClientHeight = 689
  ClientWidth = 1063
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1063
    Height = 618
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 696
    object Memo1: TMemo
      AlignWithMargins = True
      Left = 11
      Top = 11
      Width = 512
      Height = 403
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alLeft
      CharCase = ecUpperCase
      ScrollBars = ssVertical
      TabOrder = 0
      WordWrap = False
      ExplicitHeight = 487
    end
    object Memo2: TMemo
      AlignWithMargins = True
      Left = 540
      Top = 11
      Width = 512
      Height = 403
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alRight
      CharCase = ecUpperCase
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
      WordWrap = False
      ExplicitLeft = 543
      ExplicitHeight = 487
    end
    object pnlQuery: TPanel
      Left = 1
      Top = 424
      Width = 1061
      Height = 193
      Align = alBottom
      TabOrder = 2
      object Memo3: TMemo
        AlignWithMargins = True
        Left = 11
        Top = 11
        Width = 862
        Height = 171
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alLeft
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
        ExplicitTop = 9
      end
      object btnCopiarQuery: TButton
        Left = 886
        Top = 61
        Width = 129
        Height = 70
        Caption = 'Copiar Par'#226'metros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        WordWrap = True
        OnClick = btnCopiarQueryClick
      end
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 618
    Width = 1063
    Height = 71
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 696
    object btnRemoverFormatacao: TButton
      Left = 540
      Top = 1
      Width = 522
      Height = 69
      Align = alRight
      Caption = 'Remover Formata'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnRemoverFormatacaoClick
    end
    object btnFormatar: TButton
      Left = 1
      Top = 1
      Width = 522
      Height = 69
      Align = alLeft
      Caption = 'Transformar e Copiar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnFormatarClick
    end
  end
end
