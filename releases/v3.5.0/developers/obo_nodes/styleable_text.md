---
title: textGroup > textItem > styleableText
menus: chunks
class: content_block
---

A StyleableText is a string of text with defined styles for specified ranges.

## Properties

| Property | Required | Type | Description |
|-
| value | Required | String | The string of text to display.
| styleList | no | {{ 'StyleList' | obo_node }} | The styles to apply to the text

## Required Children

None

## Variables Registered

None

## Example

Learn more about using text in [Text Content Conventions](../text_content.html), where Obojobo's [supported XML styling tags](../text_content.html#styling-text-with-xml) are detailed.

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

> <b>Hello</b> World
> {:.example-html}

### JSON (Inline Math)

```json
"text": {
  "value": "Theta is \\theta and pi is \\pi.",
  "styleList": [
    {
      "type": "_latex",
      "start": 9,
      "end": 15,
      "data": {
        "alt": "theta"
      }
    },
    {
      "type": "_latex",
      "start": 26,
      "end": 29,
      "data": {
        "alt": "pi"
      }
    }
  ]
}
```

### OboXML (Inline Math)

```xml
Theta is <latex alt="theta">\theta</latex> and pi is <latex alt="pi">\pi</latex>.
```

This would produce the following render:

> Theta is ϴ and pi is π
> {:.example-html}
