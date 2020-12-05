unit RomulusProfile;

interface

uses
  Classes, AbsMain;

type
  TRomulusProfile = class(TComponent)
  private
    FGamesQuery: TABSQuery;
  public
    constructor Create(Owner: TComponent); override;
    procedure Load(ProfileId: Integer);
    property GamesQuery: TABSQuery read FGamesQuery;
  end;

implementation

{ TRomulusProfile }

constructor TRomulusProfile.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  FGamesQuery := TABSQuery.Create(Self);
  FGamesQuery.DatabaseName := 'RomulusDatabase';
  FGamesQuery.SQL.Add('Select Gamename as Name from Y0001 where Id in (Select distinct Setname from Z0001 where Type = ''0'' and Have = True and SHA1 IS NOT NULL');
  FGamesQuery.SQL.Add('intersect corresponding by (Setname)');
  FGamesQuery.SQL.Add('Select distinct Setname from Z0001 where Type = ''0'' AND Have = False and Merge = False)');
end;

procedure TRomulusProfile.Load(ProfileId: Integer);
begin
  FGamesQuery.Close;
  FGamesQuery.Open;
end;

end.
