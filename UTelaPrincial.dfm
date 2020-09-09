object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Sistema para Entrevista'
  ClientHeight = 469
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = focus
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 104
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label2: TLabel
    Left = 16
    Top = 123
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label3: TLabel
    Left = 16
    Top = 153
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label4: TLabel
    Left = 16
    Top = 180
    Width = 14
    Height = 13
    Caption = 'RG'
  end
  object Label5: TLabel
    Left = 17
    Top = 217
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label6: TLabel
    Left = 380
    Top = 217
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object Label7: TLabel
    Left = 17
    Top = 253
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label8: TLabel
    Left = 17
    Top = 280
    Width = 51
    Height = 13
    Caption = 'Atendente'
  end
  object Label9: TLabel
    Left = 177
    Top = 258
    Width = 33
    Height = 13
    Caption = 'Celular'
  end
  object Label10: TLabel
    Left = 17
    Top = 72
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label11: TLabel
    Left = 19
    Top = 320
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object Label12: TLabel
    Left = 335
    Top = 77
    Width = 41
    Height = 13
    Caption = 'Situa'#231#227'o'
  end
  object Label13: TLabel
    Left = 19
    Top = 339
    Width = 58
    Height = 13
    Caption = 'Observa'#231#227'o'
  end
  object edtNOME: TEdit
    Left = 74
    Top = 96
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edtENDERECO: TEdit
    Left = 74
    Top = 123
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object edtCIDADE: TEdit
    Left = 74
    Top = 214
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object cbxUF: TComboBox
    Left = 399
    Top = 214
    Width = 54
    Height = 22
    Style = csOwnerDrawFixed
    ItemIndex = 0
    TabOrder = 5
    Text = 'GO'
    Items.Strings = (
      'GO'
      'SP'
      'RJ'
      'DF'
      'CE'
      'PA')
  end
  object Salvar: TButton
    Left = 15
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 12
    OnClick = SalvarClick
  end
  object Alterar: TButton
    Left = 96
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 13
    OnClick = AlterarClick
  end
  object Localizar: TButton
    Left = 177
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Localizar'
    TabOrder = 14
    OnClick = LocalizarClick
  end
  object Excluir: TButton
    Left = 258
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 15
    OnClick = ExcluirClick
  end
  object edtIE: TEdit
    Left = 74
    Top = 177
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object cbxFUNCIONARIO: TComboBox
    Left = 74
    Top = 277
    Width = 166
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 8
  end
  object Button5: TButton
    Left = 258
    Top = 277
    Width = 42
    Height = 25
    Caption = '....'
    TabOrder = 16
  end
  object mskTELEFONE: TMaskEdit
    Left = 74
    Top = 250
    Width = 78
    Height = 21
    EditMask = '!\(99\)0000-0000;1;_'
    MaxLength = 13
    TabOrder = 6
    Text = '(  )    -    '
  end
  object edtCPF: TMaskEdit
    Left = 74
    Top = 150
    Width = 94
    Height = 21
    EditMask = '000.000.000-00;1;_'
    MaxLength = 14
    TabOrder = 2
    Text = '   .   .   -  '
  end
  object mskCELULAR: TMaskEdit
    Left = 216
    Top = 250
    Width = 78
    Height = 21
    EditMask = '!\(99\)0000-0000;1;_'
    MaxLength = 13
    TabOrder = 7
    Text = '(  )    -    '
  end
  object edtCODIGO: TEdit
    Left = 74
    Top = 69
    Width = 38
    Height = 21
    ReadOnly = True
    TabOrder = 17
  end
  object data: TDateTimePicker
    Left = 74
    Top = 312
    Width = 94
    Height = 21
    Date = 42164.823735810180000000
    Time = 42164.823735810180000000
    TabOrder = 9
  end
  object cbxSITUACAO: TComboBox
    Left = 382
    Top = 69
    Width = 98
    Height = 22
    AutoComplete = False
    Style = csOwnerDrawFixed
    TabOrder = 11
    Items.Strings = (
      'Em Andamento'
      'Aprovado'
      'Reprovado'
      'Desclassificado')
  end
  object memoOBSERVACAO: TMemo
    Left = 8
    Top = 358
    Width = 445
    Height = 89
    CharCase = ecUpperCase
    TabOrder = 10
  end
  object IBTra: TIBTransaction
    DefaultDatabase = dm.IBDatabase1
    Left = 412
    Top = 272
  end
  object IBQuery: TIBQuery
    Database = dm.IBDatabase1
    Transaction = IBTra
    Left = 360
    Top = 296
  end
end
