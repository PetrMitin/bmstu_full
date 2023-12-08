program n1;

type matrix = array[1..100, 1..100] of real;

procedure PrintMatrix(mtr: matrix; n, m: integer);
          var i, j: integer;
          begin
            for i := 1 to n do
                begin
                     for j := 1 to m do
                         write(mtr[i, j], ' ');
                     writeln;
                end;
          end;

procedure EnterMatrix(var mtr: matrix; n, m: integer);
          var i, j: integer;
          begin
            for i := 1 to n do
                begin
                     for j := 1 to m do
                         read(mtr[i, j]);
                     readln;
                end;
          end;

var mtr: matrix; n, m, i, j: integer; curr_sum: real;
begin
writeln('Enter n, m <= 100:');
readln(n, m);
EnterMatrix(mtr, n, m);
writeln('Entered matrix:');
PrintMatrix(mtr, n, m);
curr_sum := 0;
for i := 1 to n do
    if (i mod 2) = 1 then
         continue;
    for j := 1 to m do
        curr_sum := curr_sum + mtr[i, j];
    mtr[i, m] := curr_sum;
    curr_sum := 0;
PrintMatrix(mtr, n, m);
readln;
end.

