# Scanner

## General Software

I've use the `simple-scan` program/package. Seems mostly ok.

One thing I couldn't find configuration for was outputting grayscale images, but you can also use the following `imagemagick` cli if you need to:

TBD


There is also `sane`, though I haven't tried it.

* <http://www.sane-project.org/>
* <https://wiki.archlinux.org/title/SANE>

## Brother ADS-1250W

* [General Support Page](https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=ads1250w_us)
* [Linux Drivers](https://support.brother.com/g/b/downloadlist.aspx?c=us&lang=en&prod=ads1250w_us&os=128)
    * You probably want the [64bit Version](https://support.brother.com/g/b/downloadend.aspx?c=us&lang=en&prod=ads1250w_us&os=128&dlid=dlf104033_000&flang=4&type3=566)

The driver is downloaded as `.deb`, so:

```sh
# Version may vary
$ sudo dpkg -i brscan5-1.3.0-0.amd64.deb
```

Once that is installed, should work with `simple-scan` over USB.


If you really wanted WIFI setup, refer to:

* <https://support.brother.com/g/b/faqend.aspx?c=us_ot&lang=en&prod=ads1250w_us&faqid=faq00100429_008>
* <https://gopensource.com/working-with-my-brother-part-1-94a32bc40168>









