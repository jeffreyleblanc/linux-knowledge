#!/bin/bash

# The following contains various patterns for looping
# add `declare -a ARR` as an example
# Though let's be clear, always consider python...

TITLE () {
    printf "\n-- $1 ---------------------\n\n"
}


TITLE "1: Basic numerical for loop"
for (( n=1; n<=10; n++ ))
do
    echo "$n"
done


TITLE "2: Looping over string values"
for user in Alice Bob Charles
do
    echo "$user"
done


TITLE "3a: Looping over an array"
users=(Dan Eve Frank Greg)
for u in "${users[@]}"
do
    echo "$u is a registered user"
done


TITLE "3b: Looping over an array defined on multiple lines"
users=(
    "Jim"
    "Jack"
    "Jill"
)
for u in "${users[@]}"
do
    echo "$u is a registered user"
done


TITLE "4: Looping over array by index"
users=(
    "Jim"
    "Jack"
    "Jill"
)
len=${#users[@]}
for (( n=0; n<$len; n++ ))
do
    echo "$n"
    echo "${users[$n]}"
done


TITLE "5: Array of Arrays 1, but fails"
a4=( (A John) (B Harry) (C Jake) )
for u in "${a4[@]}"
do
    echo "$u"
done


TITLE "6: Array of Arrays"
users=(
    "Jim, 34"
    "Jack, 78"
    "Jill, 8"
)
for u in "${users[@]}"
do
    echo "$u is a registered user"
    echo '~~~~'
    parts=(${u//,/ })
    for e in "${parts[@]}"
    do
        echo $e
    done
done


TITLE "7: Array of Arrays part 2"
users=(
    "Jim, 34, really nice"
    "Jack, 78, ok"
    "Jill, 8, great cook"
)

for u in "${users[@]}"
do
    parts=(${u//,/ })
    name="${parts[0]}"
    age="${parts[1]}"
    descrip="${parts[2]}"

    echo "<$age> ($descrip) [$name]"
done

