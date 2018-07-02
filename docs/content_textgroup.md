---
id: content_textgroup
title: TextGroup
sidebar_label: TextGroup
---

A TextGroup is a series of one or more lines of text with optional styling and additional data defined.

### Structure

A TextGroup is an array of one or more **TextItem** objects, each containing two properties: **text** and **data**:

* `text` **REQUIRED**: A [**StyleableText**](content_styleabletext.md) object
* `data`: Object: An object containing one or more properties. Currently only `indent` is understood. If specified this sets the indentation level of the text item if the chunk type supports indentation (`"indent": 1` inserts one tab before the text item, `"indent": 2` inserts two tabs and so on).

### Example

#### JSON

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

#### OboXML

```xml
<textGroup>
  <t indent="1">Hello World</t>
</textGroup>
```

This would produce the following text:
* Hello World
