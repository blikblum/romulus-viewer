unit DbUtils;


interface

uses
  Classes, SysUtils, db;

procedure DatasetToStrings(Dataset: TDataset; Strings: TStrings;
  const TextFieldName, ObjectFieldName: String; Clear: Boolean = False);

procedure DeleteCurrentRecord(Dataset: TDataSet);

implementation

procedure DatasetToStrings(Dataset: TDataset; Strings: TStrings;
  const TextFieldName, ObjectFieldName: string; Clear: Boolean);
var
  TextField, ObjectField: TField;
  ABookmark: TBookmark;
begin
  TextField := Dataset.FieldByName(TextFieldName);
  ObjectField := Dataset.FindField(ObjectFieldName);
  if (ObjectField <> nil) and not (ObjectField.DataType in [ftInteger, ftSmallint, ftWord, ftAutoInc]) then
    raise Exception.CreateFmt('Field "%s" cannot be stored as a TObject', [ObjectFieldName]);
  Strings.BeginUpdate;
  try
    if Clear then
      Strings.Clear;
    if not Dataset.IsEmpty then
    begin
      Dataset.DisableControls;
      ABookmark := Dataset.GetBookmark;
      try
        Dataset.First;
        while not Dataset.EOF do
        begin
          if ObjectField = nil then
            Strings.Add(TextField.AsString)
          else
            Strings.AddObject(TextField.AsString, TObject(NativeUInt(ObjectField.AsInteger)));
          Dataset.Next;
        end;
      finally
        Dataset.GotoBookmark(ABookmark);
        Dataset.FreeBookmark(ABookmark);
        Dataset.EnableControls;
      end;
    end;
  finally
    Strings.EndUpdate;
  end;
end;

procedure DeleteCurrentRecord(Dataset: TDataSet);
begin
  if not Dataset.IsEmpty then
    Dataset.Delete;
end;


end.

