# Optical Character Recognition (OCR)

**NOTE**: This is very preliminary!

## Basics with Tesseract

Installing and using from the command line:

```sh
# Install it
$ sudo apt-get install tesseract-ocr
$ man tesseract

# Basic command line
$ tesseract test-image-1.png test1
#> will generate test1.txt

# Or to output to stdout
$ tesseract test-image-1.png stdout

# Example of choosing different flags (see man for more)
$ tesseract test-image-2.png stdout --psm 11
```

There is also a decent GUI called `gImageReader`:

```sh
# To install:
$ sudo apt-get install gimagereader
```

A few random notes on the interface:

* Once you have a image setup, you can click drag specific areas
* Clicking the "Recognize all..." will look at your selection
* Review the dropdown options from above, as multiple segmentation choices

For more see:

* <https://github.com/tesseract-ocr/tesseract>
* <https://github.com/manisandro/gImageReader>
