object frPrincipal: TfrPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Converter Script'
  ClientHeight = 767
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
    Height = 680
    Align = alClient
    TabOrder = 0
    object Memo1: TMemo
      AlignWithMargins = True
      Left = 11
      Top = 11
      Width = 512
      Height = 658
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alLeft
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object Memo2: TMemo
      AlignWithMargins = True
      Left = 540
      Top = 11
      Width = 512
      Height = 658
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alRight
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 680
    Width = 1063
    Height = 87
    Align = alBottom
    TabOrder = 1
    object btnRemoverFormatacao: TButton
      Left = 540
      Top = 1
      Width = 522
      Height = 85
      Align = alRight
      Caption = 'Remover Formata'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Visible = False
    end
    object btnFormatar: TButton
      Left = 1
      Top = 1
      Width = 522
      Height = 85
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
