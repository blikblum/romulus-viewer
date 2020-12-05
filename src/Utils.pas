unit Utils;

interface

function LeftPad(Value: Integer; Length: Integer; Pad: Char = '0'): String;

implementation

uses
  SysUtils, StrUtils;

function LeftPad( Value: Integer; Length: Integer; Pad: Char): String;
begin
  Result := RightStr(StringOfChar(Pad, Length) + IntToStr(value), Length);
end;

end.
