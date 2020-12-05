unit RomulusDatabase;

interface
uses
  Classes, ABSMain, Db;

type
  TRomulusDatabase = class(TComponent)
  private
    FDatabase: TABSDatabase;
    FProfilesTable: TABSTable;
  public
    constructor Create(Owner: TComponent); override;
    procedure LoadFromFile(const FileName: String);
    property ProfilesTable: TABSTable read FProfilesTable;
  end;


implementation

{ TRomulusDatabase }

constructor TRomulusDatabase.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  FDatabase := TABSDatabase.Create(Self);
  FDatabase.DatabaseName := 'RomulusDatabase';
  FProfilesTable := TABSTable.Create(Self);
  FProfilesTable.TableName := 'Profiles';
  FProfilesTable.DatabaseName := 'RomulusDatabase';
end;

procedure TRomulusDatabase.LoadFromFile(const FileName: String);
begin
  FProfilesTable.Close;
  FDatabase.Close;
  FDatabase.DatabaseFileName := FileName;
  FProfilesTable.Open;
end;

end.
