---
title: Content Types
menus:
  authors_getting_started:
    weight: 3
---

The OboXML format has HTML-like tags for text content called OboHTML.

Here is a complete list of the Content tags availible in ObojoboDraft by default.

## Paragraph Text

Tags: `<p></p>`

Paragraphs cannot contain other tags, just text.

```xml
<p>Hello world</p>
```

## Headings

Tags: `<h1>`, `<h2>`, `<h3>`, ... `<h6>`

Heading elements will have larger, more visible text used to break up content sections. H1 is the highest, or most important, and h6 being the least.

H2 tags within content pages will be [displayed in the navigation](authors_starter_obo_document.md#navigation-menu).

It's generally advised to use Heading tags following the guidelines for HTML:

* Do not user lower level headings just to decrease font size
* Avoid skipping levels, start at h1 then h2 and so on.
* Avoid using h1 more than once per page

```xml
<h1>Main heading</h1>
```

## Lists

Tags: `<ol></ol>`, `<ul></ul>`, `<li></li>`

Unlike HTML, nesting lists is not possible. Instead, Obojobo uses the `indent` property to specify depth.

```xml
<ol>
  <li>First item</li>
  <li indent="2">Second item</li>
</ol>
```

## Preformatted Text / Code

Tags: `<pre></pre>`

Preformatted text will maintain it's spacing, indents, and line returns for use where spacing and font width are important.

```xml
<pre>
function F(x) {
  return x + G(x);
}
</pre>
```

## Horizontal Rules / Break

Tags: `<hr />` or `<Break />`

This tag will insert a line acting as a break between nodes on a page.

```xml
<hr />
```

## Tables

Tags: `<table></table>`, `<tr></tr>`, `<th></th>`, `<td></td>`

[`ObojoboDraft.Chunks.Table`](obo_reference.md#obojobodraftchunkstable) expects an un-nested textGroup of items equal to the number of rows times the number of columns.

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

## Images

Tags: `<img />`

Using the size vlaue of `small`, `medium`, or `large` is suggested for most images.

```xml
<img src="http://lorempixel.com/640/480/city" size="small" />
```

Images also support `width` and `height` attributes. Do not use the `size` attribute when using `height` and/or `width`.

```xml
<img src="http://lorempixel.com/640/480/city" width="500" />
```

## Image Captions (Figures)

Tags: `<figure></figure>`, `<figcaption></figcaption>`

Figure syntax allows you to quickly create a figure with a caption. Both `<img>` and `<figcaption>` tags must be included.

Tag order is ingnored - captions are always displayed below an image.

```xml
<figure>
  <img src="http://lorempixel.com/640/480/city" size="small" />
  <figcaption>This is a small image</figcaption>
</figure>
```
