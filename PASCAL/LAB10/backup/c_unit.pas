unit C_unit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Edit1: TEdit;
  private

  public

  end;

var
  Form1: TForm1;

implementation
var Sum:real; operation:char='@';
procedure operate;
  var s:string;
             code:integer;
             n:real;
  begin
       s:=Form1.Edit1.text;  {  читаем сроку из параметра text Edit1}
       Form1.Edit1.clear;   {  очищаем Edit1}
       val(s,n,code);  {  преобразуем строку в число}
       case operation of        { выполняем операцию}
            '@': sum:=n;
            '+': sum:=sum+n;
            '-': sum:=sum-n;
            '*': sum:=sum*n;
            '/': sum:=sum/n;
       end;
  end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit1.Clear;       { очистить окно компонента Edit1}
  operation:='@';  { установить состояние “первая операция “}
  Edit1.setfocus;   { установить активным окно компонента Edit1}
end;

procedure TForm1.Button2Click(Sender: TObject);
var s:string;
begin
  operate;     { выполнить предыдущую операцию}
  str(sum:6:3,s);  { преобразовать результат в строку}
  Edit1.text:=s;     { вывести строку в окно компонента Edit1}
  operation:='@';
  Edit1.setfocus;   { установить курсор на кнопку Button1}
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  operate; { выполнить предыдущую операцию}
  operation:='+'; { установить состояние "операция +"}
  Edit1.setfocus; { установить активным окно компонента Edit1}
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  operate; { выполнить предыдущую операцию}
  operation:='-';  { установить состояние "операция +"}
  Edit1.setfocus; { установить активным окно компонента Edit1}
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  operate;
  operation:='*';
  Edit1.setfocus;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  operate;
  operation:='/';
  Edit1.setfocus;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Close;   {  Завершение работы приложения}
end;


{$R *.lfm}

end.

