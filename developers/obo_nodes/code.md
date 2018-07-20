---
title: Code
menus: chunks
full_name: OboDraft.Chunks.Code
node_class: chunk
---
**Node Class:** *[{{ page.node_class | capitalize }}](/developers/obo_node_structure.html#{{ page.node_class }})*
**Full Name:** *{{ page.full_name }}*

This chunk is fundamentally identical to the **[ObojoboDraft.Chunks.Text](obonode_text.md)** node except the styling of the rendered output is mono-spaced.

## Properties

| Property | Required | Type | Description |
|-
| textGroup | Required | [TextGroup](content_textgroup.md) | Expects 1 or more text items.

## Required Children

None

## Variables Registered

None

## Example JSON

```json
{
  "type": "ObojoboDraft.Chunks.Code",
  "id": "...",
  "content": {
    "textGroup": [
      {
        "text": {
          "value": "let x = 2;"
        }
      },
      {
        "text": {
          "value": "return x * 4;
        }
      }
    ]
  }
}
```

## Example XML

```xml
<Code>
  <textGroup>
    <t>let x = 2;</t>
    <t>return x * 4;</t>
  </textGroup>
</Code>
```

## Example OboHTML

```xml
<pre>let x = 2;
return x * 4;</pre>
```
