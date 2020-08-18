program GaussLegendrePIApproximationCli;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Math,
  gauss.legendre.pi in 'gauss.legendre.pi.pas',
  utils in 'utils.pas';

var
  StartTime, EndTime: TDateTime;
  Samples, Iterations: Integer;
  Approximation: Double;

function GetArgument(const AArg: string; ADefault: Integer = 0): Integer;
var
  LStringValue: string;
begin
  if FindCmdLineSwitch(AArg, LStringValue) then
    Result := StrToInt(LStringValue)
  else
     Result := ADefault;
end;

function RunCalculationsD(const ASamples, AIterations: Integer): Double;
var
  I: Integer;
begin
  Result := 0;
  for I := 1 to ASamples do
  begin
    Result := ApproximatePID(AIterations);
  end;
end;

function RunCalculationsE(const ASamples, AIterations: Integer): Extended;
var
  I: Integer;
begin
  Result := 0;
  for I := 1 to ASamples do
  begin
    Result := ApproximatePIE(AIterations);
  end;
end;

begin
  try
    Samples := GetArgument('s', 1000000);
    Iterations := GetArgument('i', 10000000);
    Writeln(
      Format('Samples = %d, Iterations = %d, Calculating...', [Samples, Iterations])
    );

    StartTime := Now;
    Approximation := RunCalculationsD(Samples, Trunc(Log2(Iterations)));
    EndTime := Now;
    Writeln(Format('Aproximation (Double) = %s', [FloatToStr(Approximation)]));
    Writeln(Format('Completed in %dms', [MillisecondDiff(StartTime, EndTime)]));

    StartTime := Now;
    Approximation := RunCalculationsE(Samples, Trunc(Log2(Iterations)));
    EndTime := Now;
    Writeln(Format('Aproximation (Extended) = %s', [FloatToStr(Approximation)]));
    Writeln(Format('Completed in %dms', [MillisecondDiff(StartTime, EndTime)]));
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
