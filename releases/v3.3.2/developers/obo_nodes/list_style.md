---
title: List > listStyle
menus: chunks
full_name: lineStyles
node_class: content
---
A ListStyle is a description of how to format an {{ 'List' | obo_node }}.

## Properties

| Property | Required | Type | Description |
|-
| type | - | String | Default: `unordered`. Allowed values: `unordered`, `ordered`
| indents | - | Array\<{{ 'indent' | obo_node }}> | An object where the keys are various indent levels and the corresponding values are objects defining the styling options for items at that indent level which override the default styles. Indent levels are zero-indexed so 0 describes the first indent level, 1 is the second indent level and so on.

## Required Children

None

## Variables Registered

None

## Example

### Sample Render

``` text
1. Numbers
  A. Uppercase letters
    ■ Square bullets (as defined by the `2` value in `indents`)
      a. Lowercase letters
        V. Uppercase roman numerals starting at V. (as defined by the `4` value in `indents`)
```


### JSON

```json
{
  "listStyles": {
    "type": "ordered",
    "indents": {
      "2": {
        "type": "unordered",
        "bulletStyle": "square"
      },
      "4": {
        "start": 5,
        "bulletStyle": "upper-roman"
      }
    }
  }
}
```

### OboXML

```xml
<listStyles>
  <type>ordered</type>
  <indents>
    <indent level="2" type="unordered" bulletStyle="square" />
    <indent level="4" type="ordered" start="10" bulletStyle="upper-alpha" />
  </indents>
</listStyles>
```

