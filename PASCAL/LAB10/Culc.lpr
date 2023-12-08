program Culc;
uses    { используемые модули}
         Forms, Interfaces,
         C_unit in 'C_unit.PAS';

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1); { создание формы}
  Application.Run;           {  основной цикл программы }
end.

