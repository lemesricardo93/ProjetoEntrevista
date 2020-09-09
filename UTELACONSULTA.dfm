object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Candidato'
  ClientHeight = 320
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 424
    Top = 24
    Width = 97
    Height = 41
    Caption = 'Localizar'
    OnClick = SpeedButton1Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 162
    Height = 57
    Caption = 'Consulta por'
    TabOrder = 0
    object cbxConsulta: TComboBox
      Left = 3
      Top = 16
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'CODIGO'
      OnChange = cbxConsultaChange
      Items.Strings = (
        'CODIGO'
        'NOME'
        'CPF'
        'CIDADE')
    end
  end
  object grpPESQUISA: TGroupBox
    Left = 176
    Top = 8
    Width = 233
    Height = 57
    Caption = 'C'#243'digo'
    TabOrder = 1
    object edtCONSULTA: TEdit
      Left = 0
      Top = 16
      Width = 217
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyPress = edtCONSULTAKeyPress
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 71
    Width = 513
    Height = 248
    DataSource = DataCONSULTA
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_CAND'
        Title.Caption = 'C'#243'digo'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CAND'
        Title.Caption = 'Nome Candidato'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO_CAND'
        Title.Caption = 'Endere'#231'o '
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Title.Caption = 'Telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE_CAND'
        Title.Caption = 'Cidade'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONCATENATION'
        Title.Caption = 'Atendente'
        Width = 156
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 527
    Top = 71
    Width = 84
    Height = 58
    Caption = 'Relat'#243'rio'
    TabOrder = 3
    OnClick = Button1Click
  end
  object IBQCONSULTA: TIBQuery
    Database = dm.IBDatabase1
    Transaction = Form1.IBTra
    SQL.Strings = (
      'select'
      
        '     C.CODIGO_CAND,  C.NOME_CAND, C.CPF_CAND, C.IE_CAND, C.ENDER' +
        'ECO_CAND,'
      ''
      
        '    C.CIDADE_CAND, C.UF_CAND, C.TELEFONE, C.CELULAR, C.OBSERVACA' +
        'O, C.COD_FUNCIONARIO,F.NOME_FUN, C.SITUACAO, C.DATA, F.COD_FUN,'
      '      F.COD_FUN || '#39'-'#39
      '         || F.NOME_FUN '
      '         FROM CANDIDATO C'
      '      LEFT JOIN FUNCIONARIO F ON  F.COD_FUN = C.COD_FUNCIONARIO')
    Left = 544
    Top = 208
  end
  object DataCONSULTA: TDataSource
    DataSet = IBQCONSULTA
    Left = 552
    Top = 264
  end
  object IBTCONSULTA: TIBTransaction
    DefaultDatabase = dm.IBDatabase1
    DefaultAction = TACommitRetaining
    Left = 552
    Top = 152
  end
end
