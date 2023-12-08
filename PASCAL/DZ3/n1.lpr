program n1;
{Объект – дерево. Поля: толщина ствола и возраст.
Методы: процедура инициализации, процедура вывода значений полей на экран и функция, определяющая среднюю толщину годичного кольца.}

type Tree = object TruncDiameter: single;
                   Age: integer;
                   procedure Init(ITruncDiameter: single; IAge: integer);
                   procedure ShowInfo();
                   function CountAverageAgeCircleDiameter(): single;
                   end;
            procedure Tree.Init(ITruncDiameter: single; IAge: integer);
                      begin
                        Self.TruncDiameter := ITruncDiameter;
                        Self.Age := IAge;
                      end;
            procedure Tree.ShowInfo();
                      begin
                        writeln('Trunc diameter: ', Self.TruncDiameter:4:2);
                        writeln('Age: ', Self.Age);
                        writeln();
                      end;
            function Tree.CountAverageAgeCircleDiameter(): single;
                     begin
                       Result := Self.TruncDiameter / Self.Age;
                     end;
var Tree1: Tree;
begin
     Tree1.Init(50.5, 5);
     Tree1.ShowInfo();
     writeln('Average age circle diameter: ', Tree1.CountAverageAgeCircleDiameter():4:2);
     readln;
end.

