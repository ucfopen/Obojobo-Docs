---
id: obonode_figure
title: ObojoboDraft.Chunks.Figure
sidebar_label: ObojoboDraft.Chunks.Figure
---

An image with an optional image caption shown below.

### Content Values

* `alt` **RECOMMENDED** String: Sets the alt tag of the image.
* `textGroup` [TextGroup](content_textgroup): Used as the caption below the image - expects **only** 1 text item if set.
* `url` String: The external URL to the image.
* `size` String (Default: `small`): One of the following values representing the desired size of the image:
  * `small`: A centered small image
  * `medium`: A centered larger image
  * `large`: An image that spans the width of the page
  * `custom`: An image set at native size (image is still restricted by the width of the page)
* `width` String: If size is set to `custom` then this specifies the width. Has no effect otherwise.
* `height` String: If size is set to `custom` then this specifies the height. Has no effect otherwise.

Note: Setting either `width` or `height` on a `custom` image will modify the non-specified dimension proportionally. It's not recommended to set both `width` and `height` as this will not respect the natural aspect-ratio of the image.

### Children

* No children

### Variables Registered

* None

### Example

#### JSON (With caption):

```json
{
	"type": "ObojoboDraft.Chunks.Figure",
	"id": "...",
	"content": {
		"size": "medium",
		"url": "http://lorempixel.com/640/480/city",
		"alt": "Description of the image",
		"textGroup": [
			{
				"text": {
					"value": "Caption here"
				}
			}
		]
	}
}
```

#### XML (With caption):

```xml
<Figure size="medium" url="http://lorempixel.com/640/480/city" alt="Description of the image">
  <textGroup>
    <t>Caption here</t>
  </textGroup>
</Figure>
```

#### OboHTML (With caption - Captions are always displayed below an image):

```xml
<figure>
  <img src="http://lorempixel.com/640/480/city" size="medium" alt="Description of the image">
  <figcaption>Caption here</figcaption>
</figure>
```

#### JSON (No caption):

```json
{
	"type": "ObojoboDraft.Chunks.Figure",
	"id": "...",
	"content": {
		"size": "custom",
		"width": "500",
		"url": "http://lorempixel.com/640/480/city",
		"alt": "Description of the image"
	}
}
```

#### XML (No caption):

```xml
<Figure size="custom" width="500" url="http://lorempixel.com/640/480/city" alt="Description of the image" />
```

#### OboHTML (No caption):

```xml
<img src="http://lorempixel.com/640/480/city" width="500" alt="Description of the image">
```

Note that the `size="custom"` is not required above. Specifying `width` and/or `height` in `img` assumes that size must be `"custom"`.
