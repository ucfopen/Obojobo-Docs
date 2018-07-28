---
title: IFrame
menus: chunks
full_name: OboDraft.Chunks.IFrame
node_class: chunk
can_be_in_a_question: yes
---
Allows you to add an [iframe](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe) containing a webpage or wep app from elsewhere on the internet.

> Note: Iframes are a complex security scenereo for viewers of your module. If Obojobo is hosted on a secure domain (https://) the viewer's browser will not load insecure web sites (http://).

## Properties

| Property | Required | Type | Description |
|-
| type | no | String | Default: `media`. Sets the default behavior of the iframe to be more suitable for one of the allowed options: `media` or `webpage`.
| newWindow | no | Boolean | Default: `false` unless `type` property is `webpage`.  Displays a link under the iframe that allows the viewer to open the src url in a new window.
| border | no | Boolean | Default: `false` unless `type` property is `webpage`.  Displays a border around the iframe to help distinguish the content from the document.
| fit | no | String | Default: `scale` unless `type` property is `webpage`, then default is `scroll`. Allowed values are `scale` and `scroll`.
| src | no | String | The url of the iframe content to display.
| width | no | Integer | The width in pixels to display the iframe at full width.
| height | no | Integer | The height in pixels to display the iframe at full width.
| zoom | no | Intiger | Default: `1`. The scale factor to apply to the content. `1` is 100%, `1.5` is 150%.
| newWindowSrc | no | String | Default: value of `src` property. An optional url to load when the user clicks the Open in a New Window button (if enabled).
| autoload | no | Boolean | Default: `false`. Controls weather the content of the iframe is loaded when the page it's contained in is shown or if the viewer must click to load the content.
| title | Recommended | String | Default: `src` value. The title to display above the iframe.  This value is also used for screen readers.
| controls | no | String | Default: `reload` unless `type` property is `webpage`, then default is `zoom,reload`. A comma seperated list of controls from the available controls: `zoom` and `reload`

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

### JSON

```json
{
	"type": "ObojoboDraft.Chunks.IFrame",
	"id": "...",
	"content": {
		"type": "webpage",
		"src": "https://ucf.edu",
		"title": "University of Central Florida Homepage"

	}
}
```

### XML

```xml
<IFrame type="webpage" src="https://ucf.edu" title="University of Central Florida Homepage" />
```
