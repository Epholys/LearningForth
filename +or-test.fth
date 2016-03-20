include +or-.fth

variable testing 10 cells allot

: resettest
  testing 10 cells erase
  ;

: randtest
  resettest
  1000000 0 do
    rand 10 mod cells testing + 1 swap +!
  loop
  ;

: printtest
  10 0 do
    cr I dup . ." : " cells testing + @ .
  loop
  ;



  
