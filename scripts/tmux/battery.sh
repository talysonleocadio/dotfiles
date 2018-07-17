#!/bin/bash

battSource=$(upower -e | grep BAT1)
battPercentage=$(upower -i $battSource | grep percentage | awk '{print($2)}')
echo "$battPercentage"

