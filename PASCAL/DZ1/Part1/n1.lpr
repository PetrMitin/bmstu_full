program n1;

{$APPTYPE CONSOLE}

uses
  SysUtils;
Var
  y:real;
begin
  WriteLn('До преобразований y=',y:20:16);
  y := 1;  { y=1 }
  y := y / 6000;  { y= y/6000 }
  y:= exp(y);                  {y = ex}
  y:= sqrt(y);                 {Квадратный корень}
  y := y / 14;  { y = y / 14 }
  y := 14 * y;  { y = 14y }
  Y:= sqr(y);                  {Y = y2}
  y := ln(y);  { y = ln y }
  y := 6000 * y;  { y = 6000y }
  WriteLn('После преобразований =', y:20:16);
  readln;
end.
