---
title: IFrame
menus: chunks
full_name: OboDraft.Chunks.IFrame
class: obo_node
node_class: chunk
can_be_in_a_question: yes
---

An [iframe](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe) containing a webpage or wep app from elsewhere on the internet.

> Note: Iframes are a complex security scenario for viewers of your module. If Obojobo is hosted on a secure domain (https://) the viewer's browser will not load insecure web sites (http://). Additionally, some sites can block being loaded in an iframe. Make sure to test the iframe to validate that it loads as expected.

## Properties

| Property | Required | Type | Description |
|-
| src | Recommended | String | The url of the iframe content to display. If the protocol is missing (`https://` or `http://`) then `//` will be automatically prepended, enforcing the same protocol that Obojobo is using. If Obojobo is hosted on a secure domain (`https://`) the viewer's browser will not load insecure web sites (`http://`). Additionally, some sites can block being loaded in an iframe. Make sure to test the iframe to validate that it loads as expected.
| title | Recommended | String | Default: `src` value. The title to display above the iframe. This value is also used for screen readers.
| type | no | String | Default: `media`. Sets the default behavior of the iframe to be more suitable for one of the allowed options: `media` or `webpage`.
| border | no | Boolean | Default: `false` if `type` is `media`, `true` if `type` is `webpage`. Displays a border around the iframe to help distinguish the content from the document.
| fit | no | String | Default: `scale` if `type` is `media`, `scroll` if `type` is `webpage`. Defines how the iframe will handle when constrained by a reduced amount of available space. Allowed values are `scale` and `scroll`. `scale` causes the width, height and contents of the iframe to scale down proportionally. This means the visible content of the iframe is the same at any size. `scroll` will keep the height the same but the width will be reduced. The content inside the iframe will remain the same size however less content will be visible without scrolling inside the iframe.
| width | no | Integer | The width in pixels to display the iframe. If not specified then the iframe will be at full width.
| height | no | Integer | The height in pixels to display the iframe. If not specified the iframe will be set to a default height of 500 pixels.
| initialZoom | no | Integer | Default: `1`. The scale factor to apply to the content. `1` is 100%, `1.5` is 150%.
| autoload | no | Boolean | Default: `false`. If `true` the iframe will be loaded when the page is loaded. If `false` then the iframe won't be loaded until the user clicks on the iframe. The default of `false` is recommended to help with page load times.
| controls | no | String | Default: `"reload"` if `type` is `media`, `"zoom,reload,new-window"` if `type` is `webpage`. A comma seperated list of controls from the available controls: `zoom`, `reload` and `new-window` (See below)

> Events and `autoload`: When a student clicks to display an iframe a `media:show` event is cataloged. If `autoload` is true the iframe will load instantly and no `media:show` event will be emitted.

### Options for controls:

| Control | Description
|-
| zoom | Displays zoom controls below the iframe allowing the user to increase or decrease the contents inside the iframe.
| reload | Displays a button below the iframe to reload the iframe.
| new-window | Displays a link under the iframe that allows the user to open the src url in a new window.

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
