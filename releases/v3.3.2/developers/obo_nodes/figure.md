---
title: Figure
menus: chunks
full_name: OboDraft.Chunks.Figure
node_class: chunk
---
An image with an optional image caption shown below.

## Properties

| Property | Required | Type | Description |
|-
| alt | Recomended | String | Sets the alt tag of the image.
| textGroup | no | [TextGroup](content_textgroup) | Used as the caption below the image - expects **only** 1 text item if set.
| url | no | String | The external URL to the image.
| size | no | String | Default: `small`. One of the following values representing the desired size of the image
| width | no | String | If size is set to `custom` then this specifies the width. Has no effect otherwise.
| height | no | String | If size is set to `custom` then this specifies the height. Has no effect otherwise.
| type | Required | String | The type of action. This is limited to the values shown in the table below.
| value | no | Object |  An object that can send one or more values along with the action event. The system can then use these values as desired.

## Values Allowed For 'size'

| Value | Description |
|-
| small  | A centered small image
| medium | A centered larger image
| large  | An image that spans the width of the page
| custom | An image set at native size (image is still restricted by the width of the page)

> Note: Setting either `width` or `height` on a `custom` image will modify the non-specified dimension proportionally. It's not recommended to set both `width` and `height` as this will not respect the natural aspect-ratio of the image.

## Required Children

None

## Variables Registered

None

## Example

### JSON (With caption)

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

### XML (With caption)

```xml
<Figure size="medium" url="http://lorempixel.com/640/480/city" alt="Description of the image">
  <textGroup>
    <t>Caption here</t>
  </textGroup>
</Figure>
```

### OboHTML (With caption)

Captions are always displayed below an image, regardless of the order of the tags
```xml
<figure>
  <img src="http://lorempixel.com/640/480/city" size="medium" alt="Description of the image">
  <figcaption>Caption here</figcaption>
</figure>
```

### JSON (No caption)

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

### XML (No caption)

```xml
<Figure size="custom" width="500" url="http://lorempixel.com/640/480/city" alt="Description of the image" />
```

### OboHTML (No caption)

```xml
<img src="http://lorempixel.com/640/480/city" width="500" alt="Description of the image">
```

Note that the `size="custom"` is not required above. Specifying `width` and/or `height` in `img` assumes that size must be `"custom"`.
