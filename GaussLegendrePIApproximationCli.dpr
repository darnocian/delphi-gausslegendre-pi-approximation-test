program GaussLegendrePIApproximationCli;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Math,
  gauss.legendre.pi in 'gauss.legendre.pi.pas';

var
  LStartTime, LEndTime: TDateTime;
  LSamples, LIterations: Integer;
  LResult: TFloat;

function GetArgument(const AArg: string; ADefault: Integer = 0): Integer;
var
  LStringValue: string;
begin
  if FindCmdLineSwitch(AArg, LStringValue) then
    Result := StrToInt(LStringValue)
  else
     Result := ADefault;
end;

function RunCalculations(const ASamples, AIterations: Integer): TFloat;
var
  I: Integer;
begin
  Result := 0;
  for I := 1 to ASamples do
  begin
    Result := approximatePI(AIterations);
  end;
end;

function MsBetween(const AStart, AEnd: TDateTime): Integer;
begin
  Result := Trunc(TimeStampToMSecs(DateTimeToTimeStamp(AEnd)) - TimeStampToMSecs(DateTimeToTimeStamp(AStart)));
end;

begin
  try
    LSamples := GetArgument('s', 1000000);
    LIterations := GetArgument('i', 10000000);
    Writeln(Format('Samples = %d, Iterations = %d, Calculating...', [LSamples, LIterations]));
    LStartTime := Now;
    LResult := RunCalculations(LSamples, Trunc(Log2(LIterations)));
    LEndTime := Now;
    Writeln(Format('Aproximation = %s', [FloatToStr(LResult)]));
    Writeln(Format('Completed in %dms', [MsBetween(LStartTime, LEndTime)]));
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
