\ Solution for Advent of Code 2019 Day 2 in Forth

: addtoarray  ( u addr u -- )
    cells + ! ;

: arrayloop  ( addr -- )
    depth 1- 0 do 
        tuck  i addtoarray 
    loop drop ;

: readarray  ( addr u -- u )
     cells +  @ ;
    
: readarrayindirect  ( addr u -- u )
    readarray over swap readarray ;

: map  ( xt addr len -- )
    0 do  2dup i cells + @ swap execute  -rot  loop 2drop ;

: sum  ( n n -- n )
    depth 1- 0 do + loop ;

: flip  ( a b c -- c b a )
    swap rot ;

: 4reverse  ( a b c d -- d c b a )
    swap 2swap swap ;

: getprg  ( addr u -- u u u u )
    4 0 do
        2dup I + readarray -rot
    loop  
    2drop 4reverse ;

: MainLoop  ( addr len -- )
    0 do
        dup dup I  ( -- addr addr u )   
        \ put four elements on stack 
        over >r
        getprg  
        r>       ( -- addr u u u u addr )
        swap dup 1 = if 
            drop 
            tuck swap readarray 
            -rot swap readarray 
            +
        else 2 = if 
            tuck swap readarray 
            -rot swap readarray 
            *
            else
                \ drop drop drop drop drop 
                leave
            then
        then
        -rot addtoarray
    4 +loop
    drop 
;


\ Part 1 
s" Input.f" included                    \ get input values to stack
depth constant len                      \ save number of inputs as constant
variable memory depth 1- cells  allot   \ create array for input values
memory arrayloop                        \ save input values in array
memory 161 MainLoop 
memory 0 readarray 
." Solution to part 1: " . cr 
bye
