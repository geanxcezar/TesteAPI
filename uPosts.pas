unit uPosts;

interface

type

  TPosts = class
  private
    FuserId : Integer;
    Fid     : Integer;
    Ftitle  : String;
    Fbody   : String;

    procedure setUserId(PUserId : Integer);
    procedure setId(PId : Integer);
    procedure setTitle(PTitle : String);
    procedure setBody(PBody : String);

    function getUserId : Integer;
    function getId     : Integer;
    function GetTitle  : String;
    function geTBody   : String;

  public
    property UserId: Integer read getUserId write setUserId;
    property Id : Integer read getId write setId;
    property Title : String read GetTitle write setTitle;
    property Body : String read geTBody write setBody;
  end;

  TArrayOfPosts = array of TPosts;

  TCarregaPosts = class
  private
    FPostsArray: TArrayOfPosts;
    function geTPostsArray: TArrayOfPosts;
    procedure setPostsArray(const Value: TArrayOfPosts);
  public
    property PostsArray: TArrayOfPosts read geTPostsArray write setPostsArray;
  end;

implementation

function TPosts.geTBody: String;
begin
   result:= FBody;
end;

function TPosts.getId: Integer;
begin
   result:= FId;
end;

function TPosts.GetTitle: String;
begin
  result:= FTitle;
end;

function TPosts.getUserId: Integer;
begin
  result:= FUserId;
end;

procedure TPosts.setBody(PBody: String);
begin
  FBody:= PBody;
end;

procedure TPosts.setId(PId: Integer);
begin
  FId:= PId;
end;

procedure TPosts.setTitle(PTitle: String);
begin
  FTitle:= PTitle;
end;

procedure TPosts.setUserId(PUserId: Integer);
begin
  FUserId:=PUserId;
end;

{ TCarregaPosts }

function TCarregaPosts.geTPostsArray: TArrayOfPosts;
begin
  result := FPostsArray;
end;

procedure TCarregaPosts.setPostsArray(const Value: TArrayOfPosts);
begin
  FPostsArray := Value;
end;

end.
