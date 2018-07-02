---
id: content_stylelist
title: StyleList
sidebar_label: StyleList
---

A StyleList is a series of one or more styles to apply to a block of text

### Structure

A **StyleList** is an array of one or more **StyleListItem** objects containing four properties: **type**, **start**, **end** and **data**

* `type` **REQUIRED** String: Represents what type of styling to apply, must be one of the following:
  * `b`: Bold
  * `i`: Italics
  * `del`: Strikethrough
  * `a`: Link
  * `q`: Quote
  * `sup`: Superscript / Subscript
  * `_latex`: Renders the range of text as inline LaTeX math using Katex
* `start` **REQUIRED** Integer: The index of the first character to style
* `end` **REQUIRED** Integer: The index of the last character to style - all characters between `start` and `end` will be styled by `type`
* `data` Object: The expected value of this property is different depending on the value of `type`:
  * `a`: Expects an object with an `href` property set to a String of the URL to link to.
  * `sup`: Expects an integer representing the number of levels to superscript or subscript (1 meaning one level of superscript, 2 meaning two levels, -1 meaning one level of subscript and so on)
  * All other types do not require this object

### Example

#### JSON

```json
"styleList": [
  {
    "type": "a",
    "start": 0,
    "end": 12,
    "data": {
      "href": "https://en.wikipedia.org/wiki/Tears_in_rain_monologue"
    }
  },
  {
    "type": "i",
    "start": 41,
    "end": 46
  }
]
```

When applied to the text string `"Attack ships on fire off the shoulder of Orion."`, these styles appear as:

[Attack ships](https://en.wikipedia.org/wiki/Tears_in_rain_monologue) on fire off the shoulder of _Orion_.
