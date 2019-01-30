---
title: Text Content Conventions
menus: developers_getting_started
---

Generally text content in OboNodes resides within TextGroups. TextGroups are just an array of TextItems. Some TextGroups restrict how many TextItems they are allowed to contain. {{ 'Text' | obo_node }} allows an infinite number while {{ 'Figure' | obo_node }} allows only one.

TextItems can be thought of as a line of text such as a sentence, a single list item or a cell in a table.

TextItems contain a single StyleableText object. StyleableText has a string of text and an object that describes the style of characters within that text.

## Minimal Example

This example is just a single, unstyled line of text.

### Example Render

> Hello World
> {:.example-html}

### JSON Structure

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

### XML Structure

```xml
<SomeOboNode>
  <!-- ... -->
  <textGroup>
    <t>Hello World</t>
  </textGroup>
</SomeOboNode>
```

## Text with Styles Example

This example uses {{ 'styleList' | obo_node }} to add style information.

### Example Render

> I've <b>seen</b> things you people wouldn't believe. <br /> > [Attack ships](https://en.wikipedia.org/wiki/Tears_in_rain_monologue) on fire off the shoulder of <i>Orion</i>.
> {:.example-html}

### JSON Structure

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

### XML Structure

```xml
<SomeOboNode>
  <!-- ... -->
  <textGroup>
    <t>I've <b>seen</b> things you people wouldn't believe</t>
    <t><a href="https://en.wikipedia.org/wiki/Tears_in_rain_monologue">Attack ships</a> on fire off the shoulder of <i>Orion</i></t>
  </textGroup>
</SomeOboNode>
```

### Styling text with XML

Using `<t>` elements allows styling with a subset of HTML-like styling tags.

#### Allowed `<t>` HTML-like style tags

| Tag | Description
|-
| `<b></b>` | Bold
| `<i></i>` | Italic
| `<latex></latex>` | Latex math equation
| `<a href="..."></a>` | Link
| `<sup></sup>` | Superscript
| `<sub></sub>` | Subscript
| `<q></q>` | Quote
| `<del></del>` | Strikethrough
| `<code></code>` | Monospaced

## Inline Math Example

Using the `_latex` type for a {{ 'styleList' | obo_node }} can be used to render Latex markup.

### Example Render

> Solve for x: <code>10=x+5</code>
> {:.example-html}

### JSON Example

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
          "end": 19,
          "data": {
            "alt": "10 equals x plus 5"
          }
        }
      ]
    }
  ]
}
```

### XML Example

```xml
<SomeOboNode>
  <!-- ... -->
  <textGroup>
    <t>Solve for x: <latex alt="10 equals x plus 5">10=x+5</latex></t>
  </textGroup>
</SomeOboNode>
```

## JSON Escape Characters

Latex expressions such as `\theta` use a backslash character. JSON formatting requires the backslash to be escaped with a second backslash: `\\theta`.

The `start` to `end` range specified in `styleList` treats the double backslash as a single character, not two.

```json
{
  ...
  "textGroup": [
    {
      "text": {
        "value": "Theta is \\theta",
      },
      "styleList": [
        {
          "type": "_latex",
          "start": 9,
          "end": 15,
          "data": {
            "alt": "theta"
          }
        }
      ]
    }
  ]
}
```

## Overlapping Styles

Style ranges can overlap or be contained within one another.

### Example Render

> **This is bold with <i>italic</i> text.**
> {:.example-html}

### XML Example

```xml
<textGroup>
  <t><b>This is bold with <i>italic</i> text.</b></t>
</textGroup>
```
