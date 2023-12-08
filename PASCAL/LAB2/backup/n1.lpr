program n1;

var x, y: extended;

begin
     writeln('Enter x, y');
     readln(x, y);
     if (y >= 0.5) and (x >= -1) and (((x + 1)*(x + 1) + y*y) <= 1) then
        writeln('Point (', x, ', ', y, ') is in the marked area')
     else
         writeln('Point (', x, ', ' y, ') is not in the marked area')
     readln;
end.

