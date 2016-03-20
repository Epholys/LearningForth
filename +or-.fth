variable rseed
here rseed !

: srand ( n -- )
  rseed !
  ;

: rand ( -- n )
  rseed dup dup @ 1103515245 * 12345 + 2147483648 mod swap ! @
  ;

: input$ ( -- )
  pad swap accept
  pad swap ;

: input# ( -- u true | false )
  0. 16 input$ dup >R
  >number nip nip 
  R> <> dup 0= IF nip THEN ;

: +or- ( u -- )
  rand swap mod 1 +
  begin
  cr ." Enter a number: "
  input# drop
  2dup > if
    cr ." It is more!"
  then
  2dup < if
    cr ." It is less!"
  then
  2dup = if
    cr ." Congratulation, you found the number!"
    2drop
    exit
  then
  drop
  again
  ;