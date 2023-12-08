program n1;

type matrix = array[1..20, 1..20] of real;

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

function EnterMatrixAndCountAverage(var mtr: matrix; n, m: integer): real;
          var i, j: integer; sum: real;
          begin
            sum := 0;
            for i := 1 to n do
                begin
                     for j := 1 to m do
                         begin
                           read(mtr[i, j]);
                           sum := sum + mtr[i, j];
                         end;
                     readln;
                end;
            EnterMatrixAndCountAverage := sum / (n*m);
          end;

function Max(arr: array of real; n: integer): real;
         var cm: real; i: integer;
         begin
              cm := arr[0];
              for i := 1 to n - 1 do
                  begin
                       if arr[i] > cm then
                          cm := arr[i];
                  end;
              Max := cm;
         end;

function CountSum(arr: array of real; n: integer): real;
         var sum: real; i: integer;
         begin
              sum := 0;
              for i := 0 to n-1 do
                  sum := sum + arr[i];
              CountSum := sum;
         end;

procedure Main(var mtr: matrix; n, m: integer);
          var i, j: integer; avg, curr_sum, curr_max: real;
          begin
            writeln('Enter matrix n*m')
            avg := EnterMatrixAndCountAverage(mtr, n, m);
            writeln('Entered matrix:');
            PrintMatrix(mtr, n, m);
            for i := 1 to n do
                begin
                     curr_sum := CountSum(mtr[i], m);
                     curr_max := Max(mtr[i], m);
                     if curr_max <= avg then
                        writeln('Row ', i, ' satisfies the conditions, summ = ', curr_sum);
                end;
          end;

var mtr: matrix; n, m: integer;
begin
writeln('Enter n, m <= 20:');
readln(n, m);
Main(mtr, n, m);
readln;
end.

