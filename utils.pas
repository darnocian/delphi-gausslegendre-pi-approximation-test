unit utils;

interface

uses
  System.SysUtils;

function millisecondDiff(const AStart, AEnd: TDateTime): int64;

implementation

function millisecondDiff(const AStart, AEnd: TDateTime): int64;
begin
  result := trunc(TimeStampToMSecs(DateTimeToTimeStamp(AEnd)) - TimeStampToMSecs(DateTimeToTimeStamp(AStart)))
end;

end.
