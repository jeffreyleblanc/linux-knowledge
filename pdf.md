# Working with PDF

## Generating Truly Redacted Files

This outlines a workflow to create redacted pdfs by outputting to images, then recombining them.

### Setup

We have to change a setting to allow ImageMagick to merge images into pdfs:

edit `/etc/ImageMagick-6/policy.xml` so that the segment with `pattern="PDF"`
has `rights="read|write"`.

### Workflow

**1)** Convert pdf to images:

```sh
$ pdftoppm -jpeg FILE TAG
```

**2)** Then edit the images by hand.

**3)** To recombine into a pdf, we assume the images have form:

> tag-1.jpg, tag-2.jpg, ...

```sh
$ convert -adjoin $(echo tag-*) out.pdf
```


