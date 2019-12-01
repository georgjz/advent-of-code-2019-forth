\ Solution for Advent of Code 2019 Day 1 in Forth
: fuelpermodule  ( u -- u )
    3 / 2 - ;

: addtoarray  ( u addr u -- )
    cells + ! ;

: arrayloop  ( addr -- )
    depth 1- 0 do 
        tuck  i addtoarray 
    loop drop ;

: map  ( xt addr len -- )
    0 do  2dup i cells + @ swap execute  -rot  loop 2drop ;

: sum  ( n n -- n )
    depth 1- 0 do + loop ;

: fuelpermodulefuel  ( u -- u )
    dup 0> if 
        dup fuelpermodule
        recurse  +
    else 
        drop 0
    then ;


\ Part 1 
s" Input.f" included                    \ get input values to stack
depth constant len                      \ save number of inputs as constants
variable values  depth 1- cells  allot  \ create array for input values
values arrayloop                        \ save input values in array
' fuelpermodule values len map          \ map fuelpermodule function over array
sum                                     \ sum up all fuel
s" Solution to Part 1: " type . cr      \ print result

\ Part 2 -- input still stored in values 
:noname negate ; values len map  sum
' fuelpermodulefuel values len map  sum 
s" Solution to Part 2: " type . cr      \ print result
\ bye 

