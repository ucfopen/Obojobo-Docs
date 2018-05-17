---
id: obo_html_reference
title: OboHTML Reference
sidebar_label: OboHTML Reference
---

The OboXML format provides a few HTML-like tags are allowed which represent different Obojobo elements. These are listed below as examples:

## Text

`<p>`

```xml
<p>Hello world</p>
```

becomes

```xml
<Text>
  <textGroup>
    <t>Hello world</t>
  </textGroup>
</Text>
```

## Heading

`<h1>`, `<h2>`, etc

```xml
<h1>Main heading</h1>
```

becomes

```xml
<Heading headingLevel="1">
  <textGroup>
    <t>Main Heading</t>
  </textGroup>
</Heading>
```

h1 and h2 elements result in headingLevel values of 1 and 2 respectively.

## List

`<ol>`, `<ul>`

```xml
<ol>
  <li>First item</li>
  <li indent="2">Second item</li>
</ol>
```

becomes

```xml
<List>
  <listStyles>
    <type>ordered</type>
  </listStyles>
  <textGroup>
    <t>First item</t>
    <t indent="2">Second item</t>
  </textGroup>
</Heading>
```

Note that unlike HTML nested lists are not supported. Use the `indent` property instead to specify nested lists.

## Code

`<pre>`

```xml
<pre>function F(x) {
  return x + G(x);
}</pre>
```

becomes

```xml
<Code>
  <textGroup>
    <t>function F(x) {</t>
    <t indent="1">return x + G(x);</t>
    <t>}</pre></t>
  </textGroup>
</Code>
```

## Break

`<hr>`

```xml
<hr />
```

becomes

```xml
<Break />
```

## Table

`<table>`

An [**ObojoboDraft.Chunks.Table**](obo_reference.md#obojobodraftchunkstable) expects an un-nested textGroup of items equal to the number of rows times the number of columns. This HTML-like `<table>` syntax provides a more friendly way to construct a table.

```xml
<table>
  <tr>
    <th>Heading 1</th>
    <th>Heading 2</th>
  </tr>
  <tr>
    <td>One</td>
    <td>Two</td>
  </tr>
</table>
```

becomes

```xml
<ObojoboDraft.Chunks.Table numRows="2" numCols="2" header="true">
  <textGroup>
    <t>Heading 1</t>
    <t>Heading 2</t>
    <t>One</t>
    <t>Two</t>
  </textGroup>
</ObojoboDraft.Chunks.Table>
```

## Figure/image with caption

`<figure>`

Figure syntax allows you to quickly create a figure with a caption. Both `<img>` and `<figcaption>` tags must be included. This XML

```xml
<figure>
  <img src="http://lorempixel.com/640/480/city" size="small" />
  <figcaption>This is a small image</figcaption>
</figure>
```

becomes

```xml
<Figure src="http://lorempixel.com/640/480/city" size="small">
  <textGroup>
    <t>This is a small image</t>
  </textGroup>
</Figure>
```

Tag order is ingnored - captions are always displayed below an image.

## Figure/image without caption

`<img>`

If you don't want to specify a caption you can simply use an `<img>` tag:

```xml
<img src="http://lorempixel.com/640/480/city" size="small" />
```

becomes

```xml
<Figure src="http://lorempixel.com/640/480/city" size="small" />
```

In both examples above the `<img>` tag may contain a `size` attribute or a `width`, `height` or both `width` and `height` attributes. If `size` is omitted then the size will be set to `custom`. For example:

```xml
<img src="http://lorempixel.com/640/480/city" width="500" />
```

becomes

```xml
<Figure src="http://lorempixel.com/640/480/city" size="custom" width="500" />
```

The complete example document at the end of this readme contains several sizing examples for images.
