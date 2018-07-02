---
id: obonode_code
title: ObojoboDraft.Chunks.Code
sidebar_label: ObojoboDraft.Chunks.Code
---

This chunk is fundamentally identical to the **[ObojoboDraft.Chunks.Text](obonode_text.md)** node except the styling of the rendered output is mono-spaced.

### Content Values

* `textGroup` **REQUIRED** **[TextGroup](content_textgroup.md)**: Expects 1 or more text items.

### Children

* No children

### Variables Registered

* None

## Example

#### JSON

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

#### XML

```xml
<Code>
  <textGroup>
    <t>let x = 2;</t>
    <t>return x * 4;</t>
  </textGroup>
</Code>
```

#### OboHTML:

```xml
<pre>let x = 2;
return x * 4;</pre>
```
