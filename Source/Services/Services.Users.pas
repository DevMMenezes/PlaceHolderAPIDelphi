unit Services.Users;

interface

uses
  System.JSON,
  RESTRequest4D,
  System.SysUtils;

const
  BaseURL = 'https://jsonplaceholder.org/';
  getAllUsers = 'users';
  getUser = 'users/';
  putUser = 'users/';
  delUser = 'users/';
  postUser = 'users';

type
  iUsers = interface
    ['{2A913D7E-7D76-4AC1-B127-F89209152B6D}']
    function getAll: TJSONObject;
    function getID(aID: String): TJSONObject;
    function put(aJSONUser: String; aID: String): TJSONObject;
    function del(aJSONUser: String; aID: String): TJSONObject;
    function post(aJSONUser: String): TJSONObject;
  end;

  TUsers = class(TInterfacedObject, iUsers)
  private
  public
    class function New: iUsers;
    function getAll: TJSONObject;
    function getID(aID: String): TJSONObject;
    function put(aJSONUser: String; aID: String): TJSONObject;
    function del(aJSONUser: String; aID: String): TJSONObject;
    function post(aJSONUser: String): TJSONObject;
  end;

implementation

{ TUsers }

function TUsers.post(aJSONUser: String): TJSONObject;
var
  LResponse: IResponse;
  jRoot: TJSONValue;
  jError, jResult: TJSONObject;
begin

  LResponse := TRequest.New.BaseURL(BaseURL + postUser)
    .ContentType('application/json').AddBody(aJSONUser).post;

  if LResponse.StatusCode = 200 then
  begin
    jRoot := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONValue;

    if Assigned(jRoot) then
    begin
      jResult := TJSONObject.Create;
      Result := jResult.AddPair('data', jRoot);
    end
    else
    begin
      jError := TJSONObject.Create;
      Result := jError.AddPair('StatusCode', LResponse.StatusText);
    end;

  end
  else
  begin
    jError := TJSONObject.Create;
    Result := jError.AddPair('StatusCode',
      TJSONNumber.Create(LResponse.StatusCode));
  end;
end;

function TUsers.del(aJSONUser: String; aID: String): TJSONObject;
var
  LResponse: IResponse;
  jRoot: TJSONValue;
  jError, jResult: TJSONObject;
begin

  LResponse := TRequest.New.BaseURL(BaseURL + delUser + aID)
    .ContentType('application/json').AddBody(aJSONUser).Delete;

  if LResponse.StatusCode = 200 then
  begin
    jRoot := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONValue;

    if Assigned(jRoot) then
    begin
      jResult := TJSONObject.Create;
      Result := jResult.AddPair('data', jRoot);
    end
    else
    begin
      jError := TJSONObject.Create;
      Result := jError.AddPair('StatusCode', LResponse.StatusText);
    end;

  end
  else
  begin
    jError := TJSONObject.Create;
    Result := jError.AddPair('StatusCode',
      TJSONNumber.Create(LResponse.StatusCode));
  end;
end;

function TUsers.put(aJSONUser: String; aID: String): TJSONObject;
var
  LResponse: IResponse;
  jRoot: TJSONValue;
  jError, jResult: TJSONObject;
begin

  LResponse := TRequest.New.BaseURL(BaseURL + putUser + aID)
    .ContentType('application/json').AddBody(aJSONUser).put;

  if LResponse.StatusCode = 200 then
  begin
    jRoot := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONValue;

    if Assigned(jRoot) then
    begin
      jResult := TJSONObject.Create;
      Result := jResult.AddPair('data', jRoot);
    end
    else
    begin
      jError := TJSONObject.Create;
      Result := jError.AddPair('StatusCode', LResponse.StatusText);
    end;

  end
  else
  begin
    jError := TJSONObject.Create;
    Result := jError.AddPair('StatusCode',
      TJSONNumber.Create(LResponse.StatusCode));
  end;
end;

function TUsers.getID(aID: String): TJSONObject;
var
  LResponse: IResponse;
  jRoot: TJSONValue;
  jError, jResult: TJSONObject;

begin

  LResponse := TRequest.New.BaseURL(BaseURL + getUser + aID)
    .ContentType('application/json').Get;

  if LResponse.StatusCode = 200 then
  begin
    jRoot := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONValue;

    if Assigned(jRoot) then
    begin
      jResult := TJSONObject.Create;
      Result := jResult.AddPair('data', jRoot);
    end
    else
    begin
      jError := TJSONObject.Create;
      Result := jError.AddPair('StatusCode', LResponse.StatusText);
    end;

  end
  else
  begin
    jError := TJSONObject.Create;
    Result := jError.AddPair('StatusCode',
      TJSONNumber.Create(LResponse.StatusCode));
  end;
end;

function TUsers.getAll: TJSONObject;
var
  LResponse: IResponse;
  jRoot: TJSONValue;
  jError, jResult: TJSONObject;

begin

  LResponse := TRequest.New.BaseURL(BaseURL + getAllUsers)
    .ContentType('application/json').Get;

  if LResponse.StatusCode = 200 then
  begin
    jRoot := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONValue;

    if Assigned(jRoot) then
    begin
      jResult := TJSONObject.Create;
      Result := jResult.AddPair('data', jRoot);
    end
    else
    begin
      jError := TJSONObject.Create;
      Result := jError.AddPair('StatusCode', LResponse.StatusText);
    end;

  end
  else
  begin
    jError := TJSONObject.Create;
    Result := jError.AddPair('StatusCode',
      TJSONNumber.Create(LResponse.StatusCode));
  end;
end;

class function TUsers.New: iUsers;
begin
  Result := Self.Create;
end;

end.
