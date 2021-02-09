---
title: YouTube
menus: chunks
full_name: ObojoboDraft.Chunks.YouTube
class: obo_node
node_class: chunk
can_be_in_a_question: yes
---

A YouTube video

## Properties

| Property | Required | Type | Description |
|-
| videoId | Recommended | String | The YouTube ID of the video (example: `dQw4w9WgXcQ`)

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
	"type": "ObojoboDraft.Chunks.YouTube",
	"id": "...",
	"content": {
		"videoId": "dQw4w9WgXcQ"
	}
}
```

### XML

```xml
<YouTube videoId="dQw4w9WgXcQ">
```

This will display the youtube video that can be found at the address youtube.com/watch?v=dQw4w9WgXcQ
