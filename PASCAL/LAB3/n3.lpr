program n1;

var h, m, curr: real; ans, i, rb: integer;
begin
  writeln('Enter h, m: h < m');
  readln(h, m);
  curr := 0;
  ans := 0;
  rb := trunc(m + 2);
  for i := 1 to rb do
        begin
          curr := (i - 1) * (i - 1) / i;
          if (curr >= h) and (curr <= m) then
             begin
                 ans += 1;
                 writeln(curr);
             end;
        end;
  writeln('Total numbers: ', ans);
  readln;
end.

