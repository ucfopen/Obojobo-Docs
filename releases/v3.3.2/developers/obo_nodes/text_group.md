---
title: textGroup
menus: chunks
full_name: textGroup
node_class: content
---
A TextGroup is a series of one or more lines of text with optional styling and additional data defined.

## Properties

A *textGroup* is an **array** of one or more [*textItem*](text_item.html) objects.


## Required Children

None

## Variables Registered

None

## Example

### JSON

```json
"textGroup": [
  {
    "text": {
      "value": "Hello World"
    },
    "data": {
      "indent": 1
    }
  }
]
```

### OboXML

```xml
<textGroup>
  <t indent="1">Hello World</t>
</textGroup>
```

This would produce the following text:
* Hello World
