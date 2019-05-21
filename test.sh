#!/bin/bash

while true; do
	until echo volume-up | scansend /dev/hidg0 keyboard >/dev/null 2>&1; do
		sleep 4
	done
	echo "HID verbunden"
	sleep 1
	for C in f o o b a r; do echo "$C" ; sleep 0.1 ; done | scansend /dev/hidg0 keyboard
	echo "Eingaben gesendet"
done


# while true; do
# 	until echo volume-up | scansend /dev/hidg0 keyboard >/dev/null 2>&1; do
# 		sleep 2
# 	done
# 	echo "HID verbunden"
# 	sleep 1
# 	for C in 'left-meta r' c m d enter s t a r t space i e x p l o r e space f a c e p a l m period d e enter ; do echo "$C" ; sleep 0.1 ; done | scansend /dev/hidg0 keyboard
# 	echo "Eingaben gesendet"
# 	while timeout 1 bash -c "echo volume-up | scansend /dev/hidg0 keyboard" ; do
# 		sleep 1
# 	done
# 	echo "HID getrennt"
# done
