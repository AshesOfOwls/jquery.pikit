jquery.pikit
================

Generate placement image for your website through many different placeholder services.


Getting Started
---------------

Pikit works by inserting an image into a container that you have already created. For this example, we are going to insert a placeholder image into each of the child divs of the .pikit-container:

```html
<div class="pikit-container">
  <div></div>
  <div></div>
  <div></div>
</div>
```

```css
.pikit-container div {
  height: 200px;
  width: 200px;
}
```

```javascript
$(".pikit-container").children().pikit()
```

This will result in the following:

```html
<div class="pikit-container">
  <div style="height: 200px; width: 200px;"><img class="pikit" src="http://placedog.com/200/200"></div>
  <div style="height: 200px; width: 200px;"><img class="pikit" src="http://placebox.es/200/200"></div>
  <div style="height: 200px; width: 200px;"><img class="pikit" src="http://dummyimages.com/200x200"></div>
</div>
```

Note that the image will receive the same height/width dimensions as its parent container. It will also insert those dimensions directly into the parent containers inline style, the reasoning for this is in case you set a specific or random height then you will want the parent to be adjusted as well.

Another thing to note is that when no options are passed to pikit then it will use a random placeholder service by default.

Pikit Options
-------------

All of these are the default options.

```javascript
$(".pikit-container").children().pikit({
  service: 'random',

  // Formatting
  height: null,
  width: null,
  format: null,
  sizeKeyword: null,

  // Colors
  greyscale: false,
  backColor: null,
  foreColor: null,

  // Customize
  customText: null,

  // Specify
  category: null,
  variant: null
})
```

<table>
  <tr>
    <th>Option</th>
    <th>Description</th>
    <th>Type</th>
    <th>Acceptable Values</th>
    <th>Default</th>
  </tr>
  <tr>
    <td>service</td>
    <td>Specify the placeholder service used. Check out the services table below to see how to reference different services.</td>
    <td>String</td>
    <td>Any Pikit reference to a service, such as 'fpoimg' or 'placekitten'</td>
    <td>'random'</td>
  </tr>
  <tr>
    <td>height</td>
    <td>Set the height of the image</td>
    <td>Integer or Array</td>
    <td>Any integer above 1, or pass an array to get a random number between to endpoints such as [200, 400]. Leaving it at the default null will automatically get the height of the parent container.</td>
    <td>null</td>
  </tr>
  <tr>
    <td>width</td>
    <td>Set the width of the image</td>
    <td>Integer or Array</td>
    <td>Any integer above 1, or pass an array to get a random number between to endpoints such as [200, 400]. Leaving it at the default null will automatically get the width of the parent container.</td>
    <td>null</td>
  </tr>
  <tr>
    <td>format</td>
    <td>Set the format of the image</td>
    <td>String</td>
    <td>It depends on the website, usually it is 'jpg' or 'png', etc</td>
    <td>null</td>
  </tr>
  <tr>
    <td>sizeKeyword</td>
    <td>Set the dimensions of the image based on a textual description</td>
    <td>String</td>
    <td>It depends on the website. For now only the DummyImage service supports it, and an example is 'skyscraper'</td>
    <td>null</td>
  </tr>
  <tr>
    <td>greyscale</td>
    <td>Should the image be in black and white?</td>
    <td>Boolean</td>
    <td>True / False</td>
    <td>false</td>
  </tr>
  <tr>
    <td>backColor</td>
    <td>If the service is generating an image on the fly, specify the background color.</td>
    <td>HEX code without # <strong>OR</strong> 'random', 'pastel', 'dark'</td>
    <td>000000, 9900FF, etc</td>
    <td>null</td>
  </tr>
  <tr>
    <td>foreColor</td>
    <td>If the service is generating an image on the fly, specify the foreground color (usually the text color).</td>
    <td>HEX code without # <strong>OR</strong> 'random', 'pastel', 'dark'</td>
    <td>000000, 9900FF, etc</td>
    <td>null</td>
  </tr>
  <tr>
    <td>customText</td>
    <td>If the service is generating an image on the fly, specify the custom text to be inserted into it.</td>
    <td>String</td>
    <td>Any string will do!</td>
    <td>null</td>
  </tr>
  <tr>
    <td>category</td>
    <td>Some services let you specify a category of images.</td>
    <td>String</td>
    <td>Depends on the service. Check out their websites.</td>
    <td>null</td>
  </tr>
  <tr>
    <td>variant</td>
    <td>Some services let you specify a variant which changes the image even if its in the same category.</td>
    <td>Integer</td>
    <td>Any integer >= 1</td>
    <td>null</td>
  </tr>
</table>

### Services
<table>
  <tr>
    <th>Name</th>
    <th>Website</th>
    <th>Pikit Reference</th>
    <th>Available Attributes</th>
  </tr>
  <tr>
    <td>DummyImage</td>
    <td>http://dummyimage.com/</td>
    <td>dummyimage</td>
    <td>backColor, foreColor, format, customText, sizeKeyword</td>
  </tr>
  <tr>
    <td>DummyImages</td>
    <td>http://dummyimages.com/</td>
    <td>dummyimages</td>
    <td>backColor, foreColor, format, customText</td>
  </tr>
  <tr>
    <td>FPOImg</td>
    <td>http://fpoimg.com/</td>
    <td>fpoimg</td>
    <td>customText</td>
  </tr>
  <tr>
    <td>Instasrc</td>
    <td>http://instasrc.com/</td>
    <td>instasrc</td>
    <td>greyscale</td>
  </tr>
  <tr>
    <td>Ipsum Image</td>
    <td>http://www.ipsumimage.com/</td>
    <td>ipsumimage</td>
    <td>backColor, foreColor, format, customText</td>
  </tr>
  <tr>
    <td>Lorem Pixel</td>
    <td>http://lorempixel.com/</td>
    <td>lorempixel</td>
    <td>category, greyscale, variant</td>
  </tr>
  <tr>
    <td>Nosrc</td>
    <td>http://nosrc.net/</td>
    <td>nosrc</td>
    <td>none</td>
  </tr>
  <tr>
    <td>Placeboxes</td>
    <td>http://placebox.es/</td>
    <td>placeboxes</td>
    <td>backColor, foreColor, customText</td>
  </tr>
  <tr>
    <td>Place Dog</td>
    <td>http://placedog.com/</td>
    <td>placedog</td>
    <td>greyscale</td>
  </tr>
  <tr>
    <td>Placeholdit</td>
    <td>http://placehold.it/</td>
    <td>placeholdit</td>
    <td>backColor, foreColor, format, customText</td>
  </tr>
  <tr>
    <td>Placeholdus</td>
    <td>http://placehold.us/</td>
    <td>placeholdus</td>
    <td>none</td>
  </tr>
  <tr>
    <td>PlaceKitten</td>
    <td>http://placekitten.com/</td>
    <td>placekitten</td>
    <td>greyscale</td>
  </tr>
  <tr>
    <td>PlacePuppy</td>
    <td>http://placepuppy.it/</td>
    <td>placepuppy</td>
    <td>none</td>
  </tr>
  <tr>
    <td>PlaceSheen</td>
    <td>http://placesheen.com/</td>
    <td>placesheen</td>
    <td>none</td>
  </tr>
  <tr>
    <td>PlaceZombies</td>
    <td>http://placezombies.com/</td>
    <td>placezombies</td>
    <td>greyscale</td>
  </tr>
  <tr>
    <td>NiceNiceJpg</td>
    <td>http://nicenicejpg.com/</td>
    <td>nicenicejpg</td>
    <td>none</td>
  </tr>
</table>