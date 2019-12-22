#!/bin/bash

# MIT License
#
# Copyright (c) 2019 SHARAD RAJ SINGH MAURYA
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
#
# Repository https://github.com/sharadcodes/herokuapp_pinger.git



cat herokuapp_pinger/script_data/hosts_list.txt |  while read myHost


#	Don't modify these configs
# 	Looping over the list of hosts in the hosts_list.txt file
do
	status=`curl ${myHost} -k -s -f -o /dev/null && echo "SUCCESS" || echo "ERROR"`
	d=`date +%Y-%m-%d`
	t=`date +%I-%M-%S-%p`
	day=`date +%A`
	# saving log to the file
	echo "$d    $t    $day    $status" >> herokuapp_pinger/logs/${myHost}.log	
	echo "$d, $t, $day, $status" >> herokuapp_pinger/csv_logs/${myHost}.csv	
	
	
# 	IMPORTANT :  CHANGE DUMMY_USER_NAME with your username
	export HOME=/home/DUMMY_USER_NAME
	
	
#   Dont modify these configs
	export DISPLAY=:0.0
	notify-send -i $HOME/herokuapp_pinger/script_data/icons/h_icon.png "$myHost" "Status: $status"
done
