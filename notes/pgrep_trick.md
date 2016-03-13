problem:

in a script called 'check_for_urxvtd.sh' you want to check if urxvtd is running

    pgrep urxvtd || echo yess

it always returns positive value, even it's not running. AHHH @!#!!.


solution:

it's because the process of the bash script itself.
Use -x to match more strict.

    pgrep -x urxvtd || echo yess
