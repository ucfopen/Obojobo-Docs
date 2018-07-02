---
id: content_listindent
title: ListIndent
sidebar_label: ListIndent
---

A ListIndent is a single indent style in a **[ListSyle](content_liststyles.md)**.  ListIndents must be contained in a ListIndents array.

For indent levels not defined in a ListIndent, the following defaults will apply:

**Unordered lists**:

* Filled circle bullets
  * Hollow circle bullets
    * Filled square bullets
      * (Repeat)

**Ordered lists**:

* Numbers
  * Uppercase letters
    * Uppercase roman numerals
      * Lowercase letters
        * Lowercase roman numerals
          * (Repeat)

## Structure

* `type` String (Default: `'unordered'`): MUST be one of the following values:
  * `'unordered'`: Creates an unordered list
  * `'ordered'`: Creates an ordered list
* `start` Integer: If `type` is `ordered` then this defines the starting value of the list - for example if set to `3` the list will start at 3, then 4, then 5 (and so on). Will default to `1` if no value is set.
* `bulletStyle` String: One of the following values:
  * For unordered lists:
    * `'disc'`: Filled circle bullets
    * `'circle'`: Hollow circle bullets
    * `'square'`: Filled square bullets
  * For ordered lists:
    * `'decimal'`: 1., 2., 3., ...
    * `'decimal-leading-zero'`: 01., 02., 03., ..., 10., 11., ...
    * `'lower-alpha'`: a., b., c., ...
    * `'upper-alpha'`: A., B., C., ...
    * `'lower-roman'`: i., ii., iii., ..., vii., ix.
    * `'upper-roman'`: I., II., III., ..., VII., IX.

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
<indents>
  <indent level="2" type="unordered" bulletStyle="square" />
  <indent level="4" type="ordered" start="10" bulletStyle="upper-alpha" />
</indents>
```
