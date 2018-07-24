---
title: StyleableText
menus: chunks
full_name:
node_class: content
---
A StyleableText is a string of text with defined styles for specified ranges.

## Properties

| Property | Required | Type | Description |
|-
| value | Required | String | The string of text to display.
| styleList | no | [*StyleList*](stylelist.html) | The styles to apply to the text

> In OboXML, `<t>` and `<p>` elements allow styling with a subset of HTML-like styling tags.

### Allowed HTML-like style tags

* `<b>`: Bold
* `<i>`: Italic
* `<latex>`: Latex math equation
* `<a href="address">`: Link
* `<sup>`: Superscript
* `<sub>`: Subscript
* `<q>`: Quote
* `<del>`: Strikethrough

## Required Children

None

## Variables Registered

None

## Example

### JSON

```json
"text": {
  value: "Hello World",
  styleList: [
    {
      type: "b",
      start: 0,
      end: 5
    }
  ]
}
```

### OboXML

```xml
<b>Hello</b> World
```

This would produce the following text:

**Hello** World

### JSON (Inline Math)

```json
"text": {
  "value": "Theta is \\theta and pi is \\pi.",
  "styleList": [
    {
      "type": "_latex",
      "start": 9,
      "end": 15
    },
    {
      "type": "_latex",
      "start": 26,
      "end": 29
    }
  ]
}
```

### OboXML (Inline Math)

```xml
Theta is <latex>\theta</latex> and pi is <latex>\pi</latex>.
```

This would produce the following text:

Theta is ϴ and pi is π
