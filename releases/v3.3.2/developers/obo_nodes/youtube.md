---
title: YouTube
menus: chunks
full_name: OboDraft.Chunks.YouTube
node_class: chunk
---
A YouTube video

## Properties

| Property | Required | Type | Description |
|-
| videoId | no | String | The YouTube ID of the video (example: `dQw4w9WgXcQ`)

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
