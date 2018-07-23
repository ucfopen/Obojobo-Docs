---
title: Text Content Reference
menus: developers_getting_started
---

> @TODO: needs a better name, what is "Content".  This appears to be mostly about TextGroup, which is not clear why that isn't a OboNode in itself

## TextGroup

A TextGroup is a series of one or more lines of text with optional styling and additional data defined.

### TextGroup Structure

A TextGroup is an array of one or more **TextItem** objects each containing two properties: **text** and **data**:

* `text` **REQUIRED**: A [**StyleableText**](obo_content_reference.md#styleabletext) object
* `data`: Object: An object containing one or more properties. Currently only `indent` is understood. If specified this sets the indentation level of the text item if the chunk type supports indentation (`"indent": 1` inserts one tab before the text item, `"indent": 2` inserts two tabs and so on).

### StyleableText

A **StyleableText** object contains two properties: **value** and **styleList**:

* `value` **REQUIRED**: String: The string of text to display.
* `styleList`: A **StyleList** object

### StyleList

A **StyleList** is an array of one or more **StyleListItem** objects containing four properties: **type**, **start**, **end** and **data**

* `type` **REQUIRED**: String: Represents what type of styling to apply, must be one of the following:
  * `b`: Bold
  * `i`: Italics
  * `del`: Strikethrough
  * `a`: Link
  * `q`: Quote
  * `sup`: Superscript / Subscript
  * `_latex`: Renders the range of text as inline LaTeX math using Katex
* `start` **REQUIRED**: The index of the first character to style
* `end` **REQUIRED**: The index of the last character to style - all characters between `start` and `end` will be styled by `type`
* `data`: Object: The expected value of this property is different depending on the value of `type`:
  * `a`: Expects an object with an `href` property set to a String of the URL to link to.
  * `sup`: Expects an integer representing the number of levels to superscript or subscript (1 meaning one level of superscript, 2 meaning two levels, -1 meaning one level of subscript and so on)
  * All other types do not require this object

The text content of `<t>` elements can contain a strict sub-set of HTML-like elements.

### Examples

#### Minimal Example

The TextGroup for the line

> Hello World

is shown below:

```json
{
  ...
  "textGroup": [
    {
      "text": {
        "value": "Hello World"
      }
    }
  ]
}
```

And in XML:

```xml
<SomeOboNode>
  <!-- ... -->
  <textGroup>
    <t>Hello World</t>
  </textGroup>
</SomeOboNode>
```

#### Styled Example

The TextGroup for the content

> I've **seen** things you people wouldn't believe.
>
> [Attack ships](https://en.wikipedia.org/wiki/Tears_in_rain_monologue) on fire off the shoulder of _Orion_.

is shown below:

```json
{
  ...
  "textGroup": [
    {
      "text": {
        "value": "I've seen things you people wouldn't believe",
        "styleList": [
          {
            "type": "b",
            "start": 5,
            "end": 10
          }
        ]
      }
    },
    {
      "text": {
        "value": "Attack ships on fire off the shoulder of Orion",
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
      }
    }
  ]
}
```

And in XML:

```xml
<SomeOboNode>
  <!-- ... -->
  <textGroup>
    <t>I've <b>seen</b> things you people wouldn't believe</t>
    <t><a href="https://en.wikipedia.org/wiki/Tears_in_rain_monologue">Attack ships</a> on fire off the shoulder of <i>Orion</i></t>
  </textGroup>
</SomeOboNode>
```

`<t>` elements allow styling with a subset of HTML-like styling tags.

##### Allowed `<t>` HTML-like style tags

* `<b>`: Bold
* `<i>`: Italic
* `<latex>`: Latex math equation
* `<a href="address">`: Link
* `<sup>`: Superscript
* `<sub>`: Subscript
* `<q>`: Quote
* `<del>`: Strikethrough

#### Inline Math Example

The TextGroup for the line

> Solve for x: _10=x+5_

is shown below (The equation above renders as italic in this document but will be rendered in a LaTeX style in the Obojobo Document Viewer):

```json
{
  ...
  "textGroup": [
    {
      "text": {
        "value": "Solve for x: 10=x+5",
      },
      "styleList": [
        {
          "type": "_latex",
          "start": 13,
          "end": 19
        }
      ]
    }
  ]
}
```

In XML:

```xml
<SomeOboNode>
  <!-- ... -->
  <textGroup>
    <t>Solve for x: <latex>10=x+5</latex></t>
  </textGroup>
</SomeOboNode>
```

##### Note on escaping characters

Latex expressions such as `\sin(x)` use a backslash character. In JSON this should be written as `\\sin(x)` since the backslash needs to be escaped for the JSON to be valid. The `start` to `end` range specified in `styleList` should ignore the escaped backslash meaning you should count `\\` as a single character rather than two characters. An example of this is shown below:

```json
{
  ...
  "textGroup": [
    {
      "text": {
        "value": "Theta is \\theta and pi is \\pi.",
      },
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
  ]
}
```

#### Note on multiple styles

Style ranges can overlap or be contained within one another to create text such as **This is bold with _italic_ text.**
