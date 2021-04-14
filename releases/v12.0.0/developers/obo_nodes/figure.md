---
title: Figure
menus: chunks
full_name: ObojoboDraft.Chunks.Figure
class: obo_node
node_class: chunk
can_be_in_a_question: yes
---

An image with an optional image caption shown below.

## Properties

| Property | Required | Type | Description |
|-
| alt | Recommended | String | Sets the alt tag of the image - this is strongly recommended since a screen reader can use this text to describe the image to someone who is visually-impaired.
| url | Recommended | String | The external URL to the image.
| textGroup | no | {{ 'textGroup' | obo_node }} | Used as the caption below the image - expects **only** 1 text item if set.
| size | no | String | Default: `small`. One of the following values representing the desired size of the image
| width | no | String | If size is set to `custom` then this specifies the width. Has no effect otherwise.
| height | no | String | If size is set to `custom` then this specifies the height. Has no effect otherwise.
| captionWidth | no | String | Default: `image-width`. Defines the width of captions. Has no effect if `size` is set to `large` or `medium`.

### Supported Values for `size`

| Value | Description |
|-
| small | A centered small image
| medium | A centered image that spans the width of the text content of a page
| large | A centered image that spans the full width of the page column, extending past the text
| custom | An image set at a specific size (or native size if width and height is not defined). The image is still restricted by the width of the page.

> Note: Setting either `width` or `height` on a `custom` image will modify the non-specified dimension proportionally. It's not recommended to set both `width` and `height` as this will not respect the natural aspect-ratio of the image.

### Supported Values for `captionWidth`

| Value | Description |
|-
| image-width | The width of the caption will match the width of the image
| text-width | The width of the caption will extend past the width of the image and will only wrap at the text content boundaries

## Supported Trigger Types

| Action Type | Description
|-
| onMount | Fired when a node is added to the DOM
| onUnmount | Fired when a node is removed from the DOM

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

> In OboHTML `size="custom"` is not required if `width` and/or `height` is specified - in this case `img` assumes that size must be `"custom"`. `size="custom"` is still required in JSON or XML.
