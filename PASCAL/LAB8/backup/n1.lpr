program n1;

type BookInfo = Record
     name: string;
     author: string;
     year: integer
     end;

procedure PrintFile(var f: text);
var curr_st: string;
begin
  while not eof(f) do
        begin
        readln(f,curr_st);
        writeln(curr_st);
        end;
end;

function ParseBookInfo(s: string): BookInfo;
var curr_field: string; i, count_recs, code: integer; res: BookInfo;
begin
     curr_field := '';
     count_recs := 0;
     for i := 1 to Length(s) do
         begin
              if (s[i] = ' ') or (s[i] = #13) then
                 begin
                   if count_recs = 0 then
                      Res.name := curr_field
                   else if count_recs = 1 then
                      Res.author := curr_field
                   else if count_recs = 2 then
                      Val(curr_field, Res.year, code)
                   else
                       continue;
                   count_recs := count_recs + 1;
                   curr_field := '';
                 end
              else
                  curr_field := curr_field + s[i];
         end;
     ParseBookInfo := res;
end;

const author_to_delete: string = 'asd';
var f1, f2: text;
var curr_st: string; parsed_info: BookInfo;
begin
     assignfile(f1, 'f1.txt');
     assignfile(f2, 'f2.txt');
     reset(f1);
     rewrite(f2);
     writeln('Initial file:');
     while not eof(f1) do
           begin
                readln(f1, curr_st);
                writeln(curr_st);
                parsed_info := ParseBookInfo(curr_st);
                with parsed_info do
                     begin
                          if parsed_info.author <> author_to_delete then
                             begin
                             writeln(f2, curr_st);
                             end;
                     end;
           end;
     reset(f2);
     writeln();
     writeln('Output file:');
     PrintFile(f2);
     readln;
     closefile(f1);
     closefile(f2);
end.

