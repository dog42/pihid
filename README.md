# Pihid

Raspberry Pi as HID.

## Install
activates HID ``dwc2`` module, sets ``hid.service`` and install ``scansend``

```sh
$ sudo ./setup.sh
```

% START ETHERNET (END HID)
% sudo echo "" > UDC; sleep 1; sudo rm -v /sys/kernel/config/usb_gadget/g1/configs/c.1/hid.usb0; sleep 1;sudo modprobe g_ether;

% START HID (END ETHERNET)
% sudo rmmod g_ether; sleep 1; sudo hid;