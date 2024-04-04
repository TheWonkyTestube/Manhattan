#!/bin/sh
open=$(~/eww/target/release/eww windows | grep bar)
first=${open:0:2}

if [ $first == "ba" ];
then
  ~/eww/target/release/eww open bar1
  ~/eww/target/release/eww open bar2
fi

if [ $first != "ba" ];
then
  ~/eww/target/release/eww close bar1
  ~/eww/target/release/eww close bar2
fi

