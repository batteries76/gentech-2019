# Images for the web

### Recommended reading...

* [Google: Image Optimisation](https://developers.google.com/web/fundamentals/performance/optimizing-content-efficiency/image-optimization)
* [Shopify Blogs. 10 Must Know Image Optimization Tips](https://www.shopify.com.au/blog/7412852-10-must-know-image-optimization-tips)

<br>

When saving images, what file type should you use?

The rule(s) of thumb...

* **.jpg** for photographs
* **.png** for graphics and transparency

<br>

# Image optimisation for web

:point_right: **How big should my image be?** *Only as large as the largest display size.*

:point_right: **Can I resize the image in the browser?** *Yes, however, consider creating a separate thumbnail image if the difference is going to be great.*

:point_right: **Can I use raw camera images?** *No! The file size is enormous and the resolution is far in excess of what is required on a regular web page.*

:point_right: **What file format should I use for photographs?** *Use **.jpg**. It supports the millions of colors required by a photograph (or otherwise realistic image) and the resulting file size is suitable for the web **BUT** be warned, jpg does not scale well beyond 100%*

:point_right: **What file format should I use for other graphics like logos?** *Use **.png**. It supports transparency (on logo backgrounds, for instance), and scales well.

:point_right: **How can I resize an image?** The default image editor on any OS should allow you to resize your images, and choose an appropriate file type.

<br>

## Image editing tools (free)

* [PIXLR](https://pixlr.com/)
* [Adobe Photoshop express](https://www.photoshop.com/products/photoshopexpress)
* [GIMP](https://www.gimp.org/)

<br>

## Resizing images in the browser

You can and should resize images in the browser where required, however, be mindful of the fact that the file size will remain the same.

````
<img src="myimage.jpg" width="300px">
````
Code snippet 1: Inline image resizing example

<br>

<hr>

## Scalable Vector Graphics SVG

How about this for graphics...

[SVG](https://www.w3schools.com/graphics/svg_intro.asp) is an XML-based format for drawing shapes.

Used for: Live drawing of data.

For instance, this draws a circle in the browser...

````
<!DOCTYPE html>
<html lang="en">
<html>

<body>

    <h1>SVG fo'pro's</h1>

    <svg width="1000" height="1000">
        <circle cx="200" cy="200" r="150" stroke="magenta" stroke-width="2" fill="silver" />
    </svg>

</body>

</html>
````

:muscle: Whilst this example is static, you can probably imagine what could be achieved with some real-time data and a little JavaScript.