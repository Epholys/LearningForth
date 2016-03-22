variable rseed
here rseed !

: srand ( n -- )
  rseed !
  ;

: rand ( -- n )
  rseed dup dup @ 1103515245 * 12345 + 2147483648 mod swap ! @
  ;

: input# ( -- u true | false )
  0. pad pad 16 accept
  >number nip nip 
  0= dup invert IF nip THEN ;

: number? ( f -- )
  0= IF
    cr ." That wasn't a number..."
  THEN   

: moreorless? ( n1 n2 -- n1 )
  2dup > IF
    cr ." It is more!"
  ELSE
    cr ." It is less!"
  THEN
  drop
  ;

: +or- ( u -- )
  0 swap                     \ Tries counter
  rand swap mod 1 +          \ Pick a number from 1 to u
  BEGIN
    swap 1 + swap            \ Increment counter
    cr ." Enter a number: "
    input# number?
    2dup = IF
      cr ." Congratulation, you found the number after " rot . ." tries!"
      2drop
      EXIT
    ELSE
      moreorless?
    THEN
  AGAIN
  ;
  