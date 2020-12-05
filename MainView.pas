unit MainView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, ABSMain,
  Data.DB, Vcl.Grids, Vcl.DBGrids, VirtualTrees,
  RomulusDatabase, RomulusProfile;

type
  TMainForm = class(TForm)
    Label1: TLabel;
    OpenDatafileButton: TButton;
    ABSTable1: TABSTable;
    ABSDatabase1: TABSDatabase;
    DatabaseOpenDialog: TFileOpenDialog;
    ProfilesDataSource: TDataSource;
    ProfileComboBox: TComboBox;
    GamesListView: TVirtualStringTree;
    ExportButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure OpenDatafileButtonClick(Sender: TObject);
    procedure ProfileComboBoxChange(Sender: TObject);
    procedure GamesListViewGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure ExportButtonClick(Sender: TObject);
  private
    { Private declarations }
    FDatabase: TRomulusDatabase;
    FCurrentProfile: TRomulusProfile;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  System.IOUtils,
  DbUtils;

{$R *.dfm}

procedure TMainForm.ExportButtonClick(Sender: TObject);
var
  S: String;
begin
  S := GamesListView.ContentToText(tstAll, ';');
  TFile.WriteAllText('export.txt', S);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FDatabase := TRomulusDatabase.Create(Self);
  FCurrentProfile := TRomulusProfile.Create(Self);
  ProfilesDataSource.DataSet := FDatabase.ProfilesTable;
end;

procedure TMainForm.GamesListViewGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
  Index: Integer;
begin
  Index := Node^.Index;
  FCurrentProfile.GamesQuery.RecNo := Index + 1;
  CellText := '';
  case Column of
    0: CellText := FCurrentProfile.GamesQuery.FieldByName('Name').AsString;
  end;
end;

procedure TMainForm.OpenDatafileButtonClick(Sender: TObject);
begin
  if DatabaseOpenDialog.Execute then
  begin
    try
      FDatabase.LoadFromFile(DatabaseOpenDialog.FileName);
      DatasetToStrings(FDatabase.ProfilesTable, ProfileComboBox.Items, 'Name', 'Id', True);
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  end;
end;

procedure TMainForm.ProfileComboBoxChange(Sender: TObject);
var
  Index: Integer;
begin
  Index := ProfileComboBox.ItemIndex;
  if (Index <> -1) then
  begin
    FCurrentProfile.Load(NativeUInt(ProfileComboBox.Items.Objects[Index]));
    GamesListView.RootNodeCount := FCurrentProfile.GamesQuery.RecordCount;
  end;
end;

end.
