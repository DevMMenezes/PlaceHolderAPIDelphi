object uFrmMain: TuFrmMain
  Left = 0
  Top = 0
  Caption = 'https://www.jsonplaceholder.org - Marcelo Menezes'
  ClientHeight = 247
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mmlog: TMemo
    Left = 8
    Top = 8
    Width = 401
    Height = 229
    TabOrder = 0
  end
  object btn: TBitBtn
    Left = 415
    Top = 8
    Width = 97
    Height = 41
    Caption = 'GetAllUsers'
    TabOrder = 1
    OnClick = btnClick
  end
  object btngetbyid: TBitBtn
    Left = 416
    Top = 55
    Width = 97
    Height = 41
    Caption = 'GetByID'
    TabOrder = 2
    OnClick = btngetbyidClick
  end
  object btnputuser: TBitBtn
    Left = 415
    Top = 149
    Width = 97
    Height = 41
    Caption = 'PutUser'
    TabOrder = 3
    OnClick = btnputuserClick
  end
  object btndel: TBitBtn
    Left = 416
    Top = 196
    Width = 97
    Height = 41
    Caption = 'DelUser'
    TabOrder = 4
    OnClick = btndelClick
  end
  object btnpost: TBitBtn
    Left = 415
    Top = 102
    Width = 97
    Height = 41
    Caption = 'PostUser'
    TabOrder = 5
    OnClick = btnpostClick
  end
end
