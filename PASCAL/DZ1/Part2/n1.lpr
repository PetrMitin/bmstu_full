program n1;

var x, y, result: extended;
begin
  writeln('Enter x, y');
  readln(x, y);
  if x < y then
     begin
          writeln('x < y');
          result := x - 2*y + x*y;
     end
  else if x = y then
     begin
          writeln('x = y');
          result := sin(x)*x;
     end
  else
     begin
          writeln('x > y');
          result := y - 2*x + 1;
     end;
  writeln('f(x, y) = ', result);
  readln;
end.

