unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type realArray = array[1..50] of real;

function avg(length: integer; var arr: realArray) : real;

implementation

function avg(var length: integer; var arr: realArray) : real;
var i, count: integer; summ, res: real;
begin
     count := 0;
     summ := 0;
     for i := 1 to length do
     begin
       if arr[i] > 0 then
       begin
            summ := summ + arr[i];
            count := count + 1;
       end;
     end;
     if count > 0 then
     res := summ / count
     else res := 0;
     length := length + 1;
     arr[length] := res;
     avg := res;
end;

end.

