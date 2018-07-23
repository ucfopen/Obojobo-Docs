---
title: ListStyle
menus:
  chunks:
    title: List > listStyle
full_name: lineStyles
node_class: content
---
A ListStyle is a description of how to format an **[ObojoboDraft.Chunks.List](obonode_list.md)**

## Structure

* `type` String (Default: `'unordered'`): MUST be one of the following values:
  * `'unordered'`: Creates an unordered list
  * `'ordered'`: Creates an ordered list
* `indents` Array\<**[ListIndent](content_listindent.md)**>: An object where the keys are various indent levels and the corresponding values are objects defining the styling options for items at that indent level which override the default styles. Indent levels are zero-indexed so 0 describes the first indent level, 1 is the second indent level and so on.

## Required Children

None

## Variables Registered

None

## Example

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

This will result in the following list:

* Numbers
  * Uppercase letters
    * Square bullets (as defined by the `2` value in `indents`)
      * Lowercase letters
        * Uppercase roman numerals starting at V. (as defined by the `4` value in `indents`)