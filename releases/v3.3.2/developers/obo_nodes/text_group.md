---
title: textGroup
menus: chunks
full_name: textGroup
node_class: content
---
A group of one or more lines of text. Being a [Content Node Class](../obo_node_structure.html#content), they differ from {{ 'Text' | obo_node }} chunks because textGroups are used as content for many OboNode types.

Learn more about using text in [Text Content Conventions](../text_content.html)

## Properties

An **array** of one or more {{ 'textItem' | obo_node }}s.


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
      "value": "I've seen things you people wouldn't believe"
    }
  },
  {
    "text": {
      "value": "Attack ships on fire off the shoulder of Orion."
    }
  }
]
```

### OboXML

```xml
<textGroup>
  <t>I've seen things you people wouldn't believe</t>
  <t>Attack ships on fire off the shoulder of Orion.</t>
</textGroup>
```
