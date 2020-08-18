unit utils;

interface

uses
  System.SysUtils;

function MillisecondDiff(const AStart, AEnd: TDateTime): Int64;

implementation

function MillisecondDiff(const AStart, AEnd: TDateTime): Int64;
begin
  Result := Trunc(TimeStampToMSecs(DateTimeToTimeStamp(AEnd)) - TimeStampToMSecs(DateTimeToTimeStamp(AStart)));
end;

end.
