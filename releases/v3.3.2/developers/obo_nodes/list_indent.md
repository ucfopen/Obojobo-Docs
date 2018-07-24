---
title: List > listStyle > indent
menus: chunks
full_name: indent
node_class: content
---
Defines the visual bullet styles used at a specified indent level in a *[List](list.html)*, defined in [*listStyle*](list_style.html) nodes.

For indent levels not defined in a *indent*, the following defaults will apply:

**Unordered lists**:

```
* Filled circle bullets
  * Hollow circle bullets
    * Filled square bullets
      * (Repeat)
```

**Ordered lists**:

```
* Numbers
  * Uppercase letters
    * Uppercase roman numerals
      * Lowercase letters
        * Lowercase roman numerals
          * (Repeat)
```


## Properties

| Property | Required | Type | Description |
|-
| type | - | String | Default: `unordered`. Allowed values: `unordered`, `ordered`
| start | - | Integer | Default: `1`. If `type` is `ordered` then this is used as the starting value of the list. For example if set to `3` the list will start at 3, then 4, then 5 (and so on).
| bulletStyle | - | String | Defines the type of bullet to display

### Allowed Bullet Styles for Unordered Lists

| bulletStyle | Description
|-
| disc | Filled circle bullets
| circle | Hollow circle bullets
| square | Filled square bullets

### Allowed Bullet Styles for Unordered Lists

| bulletStyle | Description
|-
| decimal | 1., 2., 3., ...
| decimal-leading-zero | 01., 02., 03., ..., 10., 11., ...
| lower-alpha | a., b., c., ...
| upper-alpha | A., B., C., ...
| lower-roman | i., ii., iii., ..., vii., ix.
| upper-roman | I., II., III., ..., VII., IX.


## Required Children

None

## Variables Registered

None

## Example

### JSON

```json
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

```xml
<indents>
  <indent level="2" type="unordered" bulletStyle="square" />
  <indent level="4" type="ordered" start="10" bulletStyle="upper-alpha" />
</indents>
```
