Program Project1;
uses  SysUtils;
Var A,B,C,D,E,X1,X2:Single;
Begin WriteLn('Input A, B, C:');
      ReadLn(A,B,C);
      D:= Sqr(B)- 4*A*C;
      if D>=0 then
         begin {E:=2*A;}
     	       X1:= (-B+Sqrt(D))/E;X2:= (-B-Sqrt(D))/E;
      	       WriteLn('X1=', X1:6:1, '  X2=', X2:6:1)
    	 end
      else WriteLn('No result');
      ReadLn;
end.

