unit N4Module;

{$mode ObjFPC}{$H+}

interface
uses
  Classes, SysUtils;

type FunctionOfX = function(x: real): real;
procedure Maxim(F, G: FunctionOfX; a, b: real; var res: real);

implementation
procedure Maxim(F, G: FunctionOfX; a, b: real; var res: real);
          const step: real=0.01;
          var cx, cf, cg, delta: real;
          begin
               cx := a;
               while cx <= b do
                     begin
                     cf := F(cx);
                     cg := G(cx);
                     delta := abs(cf - cg);
                     if delta > res then
                        res := delta;
                     cx := cx + step;
                     end;
          end;

end.

