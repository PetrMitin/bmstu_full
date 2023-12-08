program n1;

function IsInRectangle(x1, x2, a, b, p, q: real): boolean;
         begin
              IsInRectangle := (p >= x1) and (p <= (x1 + a)) and (q <= x2) and (q >= (x2 - b));
         end;

var arr: array[1..4000] of real; flag: boolean; p, q, cx1, cx2, ca, cb: real; i, curr_i, n: integer;
begin
  flag := False;
  writeln('Enter p, q');
  readln(p, q);
  writeln('Enter number of rectangles n, n <= 1000');
  readln(n);
  writeln('Enter n rectangles as x1, x2, a, b.');
  for i := 1 to n do
      begin
          curr_i := (i - 1) * 4 + 1;
          read(arr[curr_i]);
          read(arr[curr_i + 1]);
          read(arr[curr_i + 2]);
          read(arr[curr_i + 3]);
          readln;
      end;
  for i := 1 to n do
      begin
          curr_i := (i - 1) * 4 + 1;
          cx1 := arr[curr_i];
          cx2 := arr[curr_i + 1];
          ca := arr[curr_i + 2];
          cb := arr[curr_i + 3];
          if IsInRectangle(cx1, cx2, ca, cb, p, q) then
             begin
               flag := True;
               writeln(i);
             end;
      end;
  if not flag then
     writeln('None of entered rectangles contain point (p, q)!');
  readln;
end.

