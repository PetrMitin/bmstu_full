program Culc;
uses    { используемые модули}
         Forms, Interfaces,
         C_unit in 'C_unit.PAS', InitialScreen_unit, AddRecords, 
SearchRecords {Form1};

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1); { создание формы}
  Application.Run;           {  основной цикл программы }
end.

