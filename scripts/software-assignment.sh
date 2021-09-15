#!/bin/bash

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Assignment 01

package_check 1 libXaw
package_check 2 nethack

mail_out Assignment 01

exit 0
