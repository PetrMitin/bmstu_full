program n2;

type matrix = array[1..8, 1..12] of single;
procedure printMatrix(arr: matrix; y, x: integer);
          var k, t: integer;
          begin
             for k := 1 to y do
               begin
                 for t := 1 to x do
                     begin
                       write(arr[k, t]);
                     end;
                 writeln;
               end;
          end;
var mtrx, result_mtrx: matrix; i, j, n, m, mi, mj, curr_i: integer; max_el, el: real;
begin
     writeln('Enter n, m');
     readln(n, m);
     max_el := 0;
     writeln('Enter matrix');
     for i := 1 to n do
     begin
       for j := 1 to m do
           begin
             read(el);
             mtrx[i, j] := el;
             if el > max_el then
                begin
                     max_el := el;
                     mi := i;
                     mj := j;
                end;
           end;
     end;
     readln;
     printMatrix(mtrx, n, m);
     curr_i := 1;
     for i := 1 to n do
       begin
         if i = mi then
            continue;
         for j := 1 to m do
             result_mtrx[curr_i, j] := mtrx[i, j];
         curr_i := curr_i + 1;
       end;
     writeln('Max elem = ', max_el, ' and has pos ', mi, ', ', mj);
     printMatrix(result_mtrx, n-1, m);readln;
end.

