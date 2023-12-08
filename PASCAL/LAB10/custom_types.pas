unit custom_types;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type zap=record
     fam:string[22]; 		{Фамилия}
     name:string[22];		{Имя}
     fon:string[22]; 		{Телефон}
     adr:string[22];		{Адрес}
     end;

  df=file of zap;


implementation

end.

