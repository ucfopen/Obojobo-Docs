---
title: Materia
menus: chunks
full_name: ObojoboDraft.Chunks.Materia
class: obo_node
node_class: chunk
can_be_in_a_question: yes
---

A [Materia widget](https://materia.ucf.edu/)

> Materia is another UCFOpen platform which provides interactive widgets (games and study tools) for online courses. Check out [Materia's docs](https://ucfopen.github.io/Materia-Docs/) to find out more about getting and installing Materia.

## Properties

| Property | Required | Type | Description |
|-
| src | Required | String | The embed URL of the Materia widget |
| icon | Recommended | String | The URL of the widget icon |
| width | Recommended | Integer >= 100 | Default: `800`. The width of the widget |
| height | Recommended | Integer >= 100 | Default: `600`. The height of the widget |
| widgetEngine | Recommended | String | The name of the widget (e.g. `"Equation Sandbox"`) |
| textGroup | no | {{ 'textGroup' | obo_node }} | Used as the caption below the widget. Expects 1 text item.

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
	"type": "ObojoboDraft.Chunks.Materia",
	"id": "...",
	"content": {
		"src": "https://materia.ucf.edu/embed/UlLcG/my-equation-sandbox-widget",
		"icon": "https://materia.ucf.edu/widget/10-equation-sandbox/img/icon-92@2x.png",
		"width": 800,
		"height": 600,
		"widgetEngine": "Equation Sandbox",
		"textGroup": [
			{
				"data": null,
				"text": {
					"value": "My Equation Sandbox Widget",
					"styleList": []
				}
			}
		]
	}
}
```

### XML

```xml
<Materia src="https://materia.ucf.edu/embed/UlLcG/my-equation-sandbox-widget" icon="https://materia.ucf.edu/widget/10-equation-sandbox/img/icon-92@2x.png" width="800" height="600" widgetEngine="Equation Sandbox">
	<textGroup>
		<t>My Equation Sandbox Widget</t>
	</textGroup>
</Materia>
```
