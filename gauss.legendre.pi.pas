unit gauss.legendre.pi;

interface

function ApproximatePIE(AIterations: Integer): Extended;
function ApproximatePID(AIterations: Integer): Double;

implementation

uses
  System.Math;

function ApproximatePID(AIterations: Integer): Double;
var
  a, b, T, x, y: double;
begin
  a := 1;
  b := 1 / Sqrt(2.0);
  T := 1 / 4;
  x := 1;
  while AIterations > 0 do
  begin
    y := a;
    a := (a + b) / 2;
    b := Sqrt(b * y);
    T := T - x * IntPower(y - a, 2);
    x := 2 * x;
    Dec(AIterations);
  end;
  Result := Power(a + b, 2) / (4 * T);
end;

function ApproximatePIE(AIterations: Integer): Extended;
var
  a, b, T, x, y: Extended;
begin
  a := 1;
  b := 1 / Sqrt(2.0);
  T := 1 / 4;
  x := 1;
  while AIterations > 0 do
  begin
    y := a;
    a := (a + b) / 2;
    b := Sqrt(b * y);
    T := T - x * IntPower(y - a, 2);
    x := 2 * x;
    Dec(AIterations);
  end;
  Result := Power(a + b, 2) / (4 * T);
end;

end.
