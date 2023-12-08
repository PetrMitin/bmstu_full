program n1;

function Pow(x: integer; power: integer): integer;
         var i: longint; res: integer;
         begin
           res := 1;
           for i := 1 to power do
               res := res * x;
           Pow := res;
         end;


var curr, q: real; arr: array[1..10] of integer; ans, i, k: integer;
begin
  curr := 0.01;
  ans := 0;
  writeln('Enter q');
  readln(q);
  for i := 1 to 10 do
      begin
          arr[i] := Pow(2, i);
      end;
  for k := 2 to 1000 do
      begin
           curr := sin(curr + k);
           for i := 1 to 10 do
               begin
                    if (k = arr[i]) and (curr < q) then
                       if curr < q then
                          ans := ans + 1;
               end;
      end;
  writeln(ans);
  readln;
end.

