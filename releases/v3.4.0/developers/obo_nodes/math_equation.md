---
title: MathEquation
menus: chunks
full_name: ObojoboDraft.Chunks.MathEquation
class: obo_node
node_class: chunk
can_be_in_a_question: yes
---

A LaTeX math equation rendered with [Katex](https://github.com/Khan/KaTeX)

## Properties

| Property | Required | Type | Description |
|-
| latex | Required | String | The LaTeX string to render (example: `y=\sin(2x)`)
| alt | Recommended | String | The text to be read when the equation is encountered by a screen-reader. If not specified, the `latex` value is used. It is recommended to include a human-readable form of the equation, as the `latex` value may be difficult for screen-reader users to understand.
| align | no | String | Default `left`: Either `left`, `center` or `right`.
| label | no | String | If specified adds a label to the right side of the equation, for example `(1.1)`
| size | no | Number | Default: `1`: The font size of the equation. Works as a multiplier, so for example `1` is the standard size, `2` is twice as big and `0.5` is half as big.

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
		"alt": "y equals sine of 2 x",
		"label": "(1.1)"
	}
}
```

### XML

```xml
<MathEquation latex="y=\sin(2x)" alt="y equals sine of 2 x" label="(1.1)" />
```
