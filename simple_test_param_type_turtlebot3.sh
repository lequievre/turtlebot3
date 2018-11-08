#!/bin/sh
# Laurent LEQUIEVRE
# laurent.lequievre@uca.fr
# Research Engineer, CNRS (France)
# UMR 6602 - Institut Pascal
# source simple_test_param_type_turtlebot3.sh waffle
# or
# source simple_test_param_type_turtlebot3.sh burger
# or
# source simple_test_param_type_turtlebot3.sh --> in that case the script detect the need of a parameter "burger" or "waffle"

if [ $# -gt 0 ]; then
  echo "A parameter is set and it's value is : \"$1\""
  if [ $1 == "waffle" ]; then
    echo "The model parameter is WAFFLE !"
  elif [ $1 == "burger" ]; then
    echo "The model parameter is BURGER !"
  else
    echo "Parameter has to be \"burger\" or \"waffle\" !"
  fi
else
  echo "You need a parameter ! Please launch the script with \"waffle\" ou \"burger\" as parameter !"
fi



