---
title: textGroup > textItem > styleableText
menus: chunks
full_name:
node_class: content
---
A StyleableText is a string of text with defined styles for specified ranges.

## Properties

| Property | Required | Type | Description |
|-
| value | Required | String | The string of text to display.
| styleList | no | {{ 'StyleList' | obo_node }} | The styles to apply to the text

> In OboXML, `<t>` and `<p>` elements allow styling with a subset of HTML-like styling tags.


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
{:.example-html}

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

This would produce the following render:

> Theta is ϴ and pi is π
{:.example-html}

