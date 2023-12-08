program n2;

var h, m, curr: real; ans, n: integer;
begin
  writeln('Enter h, m: h < m');
  readln(h, m);
  curr := 0;
  ans := 0;
  n := 0;
  repeat
        begin
          if curr >= h then
             begin
                 ans += 1;
                 writeln(curr);
             end;
          n := n + 1;
          curr := (n - 1) * (n - 1) / n;
        end
  until curr > m;
  writeln('Total numbers: ', ans);
  readln;
end.

