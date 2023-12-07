# Linux Kernel Topics

## Looking at Kernel Output

One of the useful commands is `dmseg` which interacts with the kernel ring buffer.

In particular, if you have some strange hardware or other issues, looking at the buffer
for errors or other relevant messages can be very helpful.

```sh
# Page through the output
$ sudo dmseg -H

# Looking for a specific topic, say wifi devices and drivers
$ sudo dmesg | grep -i wifi
#> [   27.258209] Intel(R) Wireless WiFi driver for Linux
#> [   27.258365] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
#> [   27.286458] iwlwifi 0000:00:14.3: api flags index 2 larger than supported by driver
#> [   27.286471] iwlwifi 0000:00:14.3: TLV_FW_FSEQ_VERSION: FSEQ Version: 89.3.35.37
#> [   27.287028] iwlwifi 0000:00:14.3: loaded firmware version 72.daa05125.0 QuZ-a0-jf-b0-72.ucode op_mode iwlmvm
#> [   27.488063] iwlwifi 0000:00:14.3: Detected Intel(R) Wireless-AC 9560 160MHz, REV=0x351
#> [   27.613321] iwlwifi 0000:00:14.3: Detected RF JF, rfid=0x105110
#> [   27.671127] iwlwifi 0000:00:14.3: base HW address: --redact--
#> [   27.691610] iwlwifi 0000:00:14.3 wlp0s20f3: renamed from wlan0
```




