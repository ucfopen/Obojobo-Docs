---
title: textGroup > textItem
menus: chunks
node_class: content
---
A series of one or more lines of text with optional styling and additional data defined.

Learn more about using text in [Text Content Conventions](../text_content.html)

## Properties

| Property | Required | Type | Description |
|-
| text | Required |  {{ 'styleableText' | obo_node }} | Text and associated styles displayed in this single item.
| data | no | Object |  An object containing one or more properties. Currently only `indent` is understood. If specified this sets the indentation level of the text item if the chunk type supports indentation (`"indent": 1` inserts one tab before the text item, `"indent": 2` inserts two tabs and so on).


## Required Children

None

## Variables Registered

None

## Example

### JSON

```json
{
  "text": {
    "value": "Hello World"
  },
  "data": {
    "indent": 1
  }
}
```

### OboXML

```xml
<t indent="1">Hello World</t>
```

