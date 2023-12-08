program n1;
procedure printArray(arr: array of integer; l: integer);
          var j: integer;
          begin
            write('[');
            for j := 0 to l-1 do
                write(arr[j], ' ');
            writeln(']');
          end;
var i, n, rb, lb, tmp: integer; arr: array[1..50] of integer;
begin
  writeln('Enter n: ');readln(n);lb := 2;rb := n;
  for i := 1 to n do
      begin
          readln(arr[i]);
      end;
  printArray(arr, n);
  while lb <= rb do
    begin
         for i := rb downto lb do
             begin
                  if arr[i] < arr[i-1] then
                     begin
                         tmp := arr[i];
                         arr[i] := arr[i - 1];
                         arr[i - 1] := tmp;
                     end;
             end;
         lb := lb + 1;
         for i := lb to rb do
             begin
                  if arr[i] < arr[i-1] then
                     begin
                         tmp := arr[i];
                         arr[i] := arr[i - 1];
                         arr[i - 1] := tmp;
                     end;
             end;
         rb := rb - 1;
    end;
    printArray(arr, n);readln;
end.

