---
title: MathEquation
menus: chunks
full_name: OboDraft.Chunks.MathEquation
node_class: chunk
can_be_in_a_question: yes
---
A LaTeX math equation rendered with [Katex](https://github.com/Khan/KaTeX)

## Properties

| Property | Required | Type | Description |
|-
| latex | Required | String | The LaTeX string to render (example: `y=\sin(2x)`)
| align | no | String | Default `left`: Either `left`, `center` or `right`.
| label | no | String | If specified adds a label to the right side of the equation, for example `(1.1)`
| size | no | Number | Default: `1`: The font size of the equation. `1` is the standard size, `2` is twice as big and `0.5` is half as big.

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
	"type": "ObojoboDraft.Chunks.MathEquation",
	"id": "...",
	"content": {
		"latex": "y=\\sin(2x)",
		"label": "(1.1)"
	}
}
```

### XML

```xml
<MathEquation latex="y=\sin(2x)" label="(1.1)" />
```
