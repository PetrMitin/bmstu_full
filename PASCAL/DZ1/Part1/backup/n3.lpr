program n3;

{$APPTYPE CONSOLE}

var x, y1, y2, y: real;
begin
  writeln('');
  readln(x);
  y1 := sin(x);
  y2 := cos(x);
  y := sqr(y1) + sqr(y2);
  writeln('y1 = ', y1:20:16);
  writeln('y2 = ', y2:20:16);
  writeln('y = ', y:20:16);
  readln;
end.
