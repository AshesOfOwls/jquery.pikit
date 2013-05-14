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
    <td>Service</td>
    <td>Specify the placeholder service used.</td>
    <td>String</td>
    <td>Any CSS selector, such as ".amelia" or "#pond"</td>
    <td>"*"</td>
  </tr>
</table>

### Services
<table>
  <tr>
    <th>Name / Website</th>
    <th>Pikit Reference</th>
  </tr>
  <tr>
    <td>[DummyImage.com](http://dummyimage.com/)</td>
    <td>dummyimage</td>
  </tr>
</table>