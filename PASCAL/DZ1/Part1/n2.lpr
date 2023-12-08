program n2;
{$APPTYPE CONSOLE}

var x, y, y1, y2: extended;

begin
  writeln('Введите x: ');
  readln(x);
  y1 := (exp(x) - exp(-x)) / 2;  {y1 = shx}
  y2 := (exp(x) + exp(-x)) / 2;  {y2 = chx}
  y := sqr(y2) - sqr(y1);  {y = ch(x)^2 - sh(x)^2}
  writeln('y1 = ', y1:20:16);
  writeln('y2 = ', y2:20:16);
  writeln('y = ', y:20:16);
  readln;
end.
