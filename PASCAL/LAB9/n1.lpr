program n1;

type ListNodePointer = ^ListNode;
     ListNode = Record
     prev: ListNodePointer;
     val: real;
     next: ListNodePointer
     end;

var prev_node_pointer, curr_node_pointer, first_node_pointer, rb_pointer: ListNodePointer; n, i: integer;
begin
writeln('Enter n');
readln(n);
new(first_node_pointer);
readln(first_node_pointer^.val);
prev_node_pointer := first_node_pointer;
for i := 2 to n do
    begin
         new(curr_node_pointer);
         readln(curr_node_pointer^.val);
         curr_node_pointer^.prev := prev_node_pointer;
         prev_node_pointer^.next := curr_node_pointer;
         prev_node_pointer := curr_node_pointer;
    end;
curr_node_pointer^.next := nil;
first_node_pointer^.prev := nil;
rb_pointer := curr_node_pointer;
curr_node_pointer := first_node_pointer;
writeln('Result sequence:');
for i := 1 to n-1 do
    begin
         writeln(curr_node_pointer^.val + curr_node_pointer^.next^.val + rb_pointer^.val * 2);
         curr_node_pointer := curr_node_pointer^.next;
         rb_pointer := rb_pointer^.prev;
    end;
readln;
end.

