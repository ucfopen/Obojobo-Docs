---
title: HTML
menus: chunks
full_name: ObojoboDraft.Chunks.HTML
class: obo_node
node_class: chunk
can_be_in_a_question: yes
---

Raw HTML content. Allows you to create content that can't be generated by the system otherwise.

> **It's strongly recommended not to use this Chunk**.
>
> The HTML it contains will not be parsable by Obojobo and can easily break other content.

## Properties

| Property | Required | Type | Description |
|-
| html | Recommended | String | HTML to render into the document.

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
	"type": "ObojoboDraft.Chunks.HTML",
	"id": "...",
	"content": {
		"html": "<div style='border:1px solid black;'>Custom HTML Here!</div>"
	}
}
```

### XML

```xml
<HTML html="<div style='border:1px solid black;'>Custom HTML Here!</div>" />
```