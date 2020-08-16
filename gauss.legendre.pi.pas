unit gauss.legendre.pi;

interface

function approximatePIe(iterations: integer): Extended;
function approximatePId(iterations: integer): double;

implementation

uses
  System.Math;

function approximatePId(iterations: integer): double;
var
  a, b, T, x, y: double;
begin
  a := 1;
  b := 1 / Sqrt(2.0);
  T := 1 / 4;
  x := 1;
  while iterations > 0 do
  begin
    y := a;
    a := (a + b) / 2;
    b := Sqrt(b * y);
    T := T - x * intpower(y - a, 2);
    x := 2 * x;
    dec(iterations);
  end;
  result := power(a + b, 2) / (4 * T);
end;

function approximatePIe(iterations: integer): Extended;
var
  a, b, T, x, y: Extended;
begin
  a := 1;
  b := 1 / Sqrt(2.0);
  T := 1 / 4;
  x := 1;
  while iterations > 0 do
  begin
    y := a;
    a := (a + b) / 2;
    b := Sqrt(b * y);
    T := T - x * intpower(y - a, 2);
    x := 2 * x;
    dec(iterations);
  end;
  result := power(a + b, 2) / (4 * T);
end;

end.
