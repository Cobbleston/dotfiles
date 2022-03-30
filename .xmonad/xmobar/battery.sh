#!/bin/sh

var=$(acpi | awk '{ print $3, $4 }')

OUTPUT="${var%?}"
echo "$OUTPUT"

