unit uMain;

interface

uses
  Services.Users,
  System.JSON,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

const
  UserJSON =
    '{"id":1,"firstname":"MARCELO","lastname":"MENEZES","email":"johndoe@example.com","birthDate":"1973-01-22",'
    + '"login":{"uuid":"1a0eed01-9430-4d68-901f-c0d4c1c3bf22","username":"johndoe","password":"jsonplaceholder.org",'
    + '"md5":"c1328472c5794a25723600f71c1b4586","sha1":"35544a31cc19bd6520af116554873167117f4d94","registered":"2023-01-10T10:03:20.022Z"},'
    + '"address":{"street":"123 Main Street","suite":"Apt. 4","city":"Anytown","zipcode":"12345-6789","geo":{"lat":"42.1234","lng":"-71.2345"}},'
    + '"phone":"(555) 555-1234","website":"www.johndoe.com","company":{"name":"ABC Company","catchPhrase":"Innovative solutions for all your needs",'
    + '"bs":"Marketing"}}';
  UserPostJSON =
    '{"id": 1, "firstname": "Marcelo", "lastname": "Menezes", "email": "johndoe@example.com", "birthDate": "1973-01-22",'
    + ' "login": { "uuid": "1a0eed01-9430-4d68-901f-c0d4c1c3bf22", "username": "johndoe", "password": "jsonplaceholder.org", '
    + '"md5": "c1328472c5794a25723600f71c1b4586", "sha1": "35544a31cc19bd6520af116554873167117f4d94", "registered": "2023-01-10T10:03:20.022Z" },'
    + ' "address": { "street": "123 Main Street", "suite": "Apt. 4", "city": "Anytown", "zipcode": "12345-6789", "geo": { "lat": "42.1234",'
    + ' "lng": "-71.2345" } }, "phone": "(555) 555-1234", "website": "www.johndoe.com", "company": { "name": "ABC Company", '
    + '"catchPhrase": "Innovative solutions for all your needs", "bs": "Marketing" }}';

type
  TuFrmMain = class(TForm)
    mmlog: TMemo;
    btn: TBitBtn;
    btngetbyid: TBitBtn;
    btnputuser: TBitBtn;
    btndel: TBitBtn;
    btnpost: TBitBtn;
    procedure btnClick(Sender: TObject);
    procedure btngetbyidClick(Sender: TObject);
    procedure btnputuserClick(Sender: TObject);
    procedure btndelClick(Sender: TObject);
    procedure btnpostClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFrmMain: TuFrmMain;

implementation

{$R *.dfm}

procedure TuFrmMain.btnClick(Sender: TObject);
var
  jResult: TJSONObject;
begin
  mmlog.Clear;

  try
    jResult := TUsers.New.getAll;

    if Assigned(jResult) then
      mmlog.Text := jResult.ToString;
  finally
    jResult.Free;
  end;
end;

procedure TuFrmMain.btndelClick(Sender: TObject);
var
  jResult: TJSONObject;
  sInput: String;
begin
  mmlog.Clear;

  InputQuery('Digite um id', 'Digite o ID do usuário', sInput);

  if sInput.IsEmpty then
  begin
    ShowMessage('Digite um ID');
    abort;
  end;

  try
    jResult := TUsers.New.del(UserJSON, sInput);

    if Assigned(jResult) then
      mmlog.Text := jResult.ToString;

  finally
    jResult.Free;
  end;
end;

procedure TuFrmMain.btngetbyidClick(Sender: TObject);
var
  jResult: TJSONObject;
  sInput: String;
begin
  mmlog.Clear;

  InputQuery('Digite um id', 'Digite o ID do usuário', sInput);

  if sInput.IsEmpty then
  begin
    ShowMessage('Digite um ID');
    abort;
  end;

  try
    jResult := TUsers.New.getID(sInput);

    if Assigned(jResult) then
      mmlog.Text := jResult.ToString;

  finally
    jResult.Free;
  end;
end;

procedure TuFrmMain.btnpostClick(Sender: TObject);
var
  jResult: TJSONObject;

begin
  mmlog.Clear;

  try
    jResult := TUsers.New.post(UserPostJSON);

    if Assigned(jResult) then
      mmlog.Text := jResult.ToString;

  finally
    jResult.Free;
  end;
end;

procedure TuFrmMain.btnputuserClick(Sender: TObject);
var
  jResult: TJSONObject;
  sInput: String;
begin
  mmlog.Clear;

  InputQuery('Digite um id', 'Digite o ID do usuário', sInput);

  if sInput.IsEmpty then
  begin
    ShowMessage('Digite um ID');
    abort;
  end;

  try
    jResult := TUsers.New.put(UserJSON, sInput);

    if Assigned(jResult) then
      mmlog.Text := jResult.ToString;

  finally
    jResult.Free;
  end;
end;

end.
