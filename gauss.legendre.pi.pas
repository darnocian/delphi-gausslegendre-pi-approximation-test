unit gauss.legendre.pi;

interface

type
  // type used to change quickly between double or extended
  // TFloat = double;
  TFloat = extended;

function approximatePI(Iter: integer): TFloat;

implementation

uses
  System.Math;

function approximatePI(Iter: integer): TFloat;
var
  a, b, t, x, y: TFloat;
  aprox, d: TFloat;
begin
  a := 1;
  b := 1 / Sqrt(2.0);
  t := 1 / 4;
  x := 1;
  while Iter > 0 do
  begin
    y := a;
    a := (a + b) / 2;
    b := Sqrt(b * y);
    t := t - x * intpower(y - a, 2);
    x := 2 * x;
    aprox := power(a + b, 2) / (4 * t);
    dec(Iter);
  end;
  result := aprox;
end;

end.
