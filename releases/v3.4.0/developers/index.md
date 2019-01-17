---
title: OboNode Structure
menus:
  developers_getting_started:
    weight: -2
---

The OboNode is a data structure which defines the use of an OboNode Component and its related data & content. Multiple OboNodes comprise an Obojobo Draft Document.

Our goal is to allow this structure to be open-ended so that new nodes can be developed and added to the system.

## Structure

Each OboNode has a native JSON representation. All nodes share the same basic structure.

Here's an example **JSON** structure of a {{ 'Break' | obo_node }} OboNode:

```json
{
	"type": "ObojoboDraft.Chunks.Break",
	"id": "...",
	"content": {
		"width": "large"
	}
}
```

Each node can be represented in **XML**:

```xml
<Break width="large" />
```

Furthermore, some nodes have an alternate HTML-like form called **OboHTML**:

```xml
<hr width="large"/>
```

> **OboHTML:** An XML element which mimics the syntax of HTML elements (for example <p> or <h1>). These elements are read by the OboXML Parser and are converted into their OboXML representation. These are provided to make writing OboXML easier by providing a familiar and less verbose syntax for common tasks.

## Properties

| Property | Required | Type | Description
|-
| id | Required | String | A unique string to identify the node. No node can share an id with another node.
| type | Required | String | An OboNode Component Identifier that determines which OboNode Component will be used process and render this item.
| content | no | Object | Properties that define the contents of this node. The {{ 'Page' | obo_node }} node in the example only understands a single property; **title**. Each type of node supports different properties.
| children | no | Array\<OboNode> | Each OboNode can have an array of children OboNodes. Different OboNode types may ignore or expect specific types of children.

> **Note on ids in OboXML:** You can omit ids when writing XML. Any omitted ids will be automatically generated when the document is saved.

## Unused Properties

These properties haven't been completed and are not required but you will see them in the JSON output of an Obojobo document so they are included here for reference:

| Property | Type | Description
|-
| metadata | Object | Meta information about this node. Currently this information is ignored and should be left as `{}` if set. This may be removed in a future release.
| index | Integer | The position of this item relative to its siblings. Currently this information is ignored - the order of nodes in the document dictate the rendering order instead. These values should be left as `0` (or any integer) if set. This may be removed in a future release.

> **Note:** OboNode examples in the rest of the document will exclude these properties

## OboNode Classifications

### Module

This is always the root-level OboNode and represents the entire document. Every document must begin with a Module OboNode.

### Section

Modules contain one or more Sections which split up the module into logical units. A Module commonly would contain a Content Section (one or more Pages of learning content) and an Assessment Section (which includes a scored quiz).

### Page

A page is a collection of one or more Chunks which make up the primary display of the document. Usually students navigate and experience the document one page at a time.

### Chunk

Chunks are individual pieces of content, for example a paragraph of text, a list or a question. Some Chunks may contain additional Chunks as children.

## Content Blocks

An OboNode's `content` property contains all of the data needed for that OboNode to function. Some content properties are simply primitive values such as `title` which is a string representing the title of the OboNode. Other content properties are objects with their own definitions and structures. Since these are important to the function of OboNodes we refer to them as Content Blocks.

Different OboNodes require and understand different Content Blocks. For example, both {{ 'Text' | obo_node }} and {{ 'List' | obo_node }} Chunks expects a {{ 'textGroup' | obo_node }} Content Block but only {{ 'List' | obo_node }} understands the {{ 'listStyle' | obo_node }} Content Block.

In XML Content Blocks are represented as a child element to the OboNode they are a part of. These **always start with a lower-cased letter** to differentiate them from the other classifications.

> **Note on XML children**: In XML an element's children elements either begin with an upper-case letter or a lower-case letter. Upper-cased elements are OboNodes and are included in the parent OboNode's `children` property. Lower-cased elements are Content Blocks and are included in the parent OboNode's `content` property. The order of children OboNode elements corresponds to the order of those OboNodes in the `children` array. Content Block elements can be in any order since their order is irrelevant.

## OboNode & Content Block Reference

{% assign titles = site.menus.chunks | menu_titles %}
{% assign node_names = titles | obo_node_names_for_version %}
{% for node_name in node_names %}

- {{ node_name | split: ' > ' | last | obo_node }}
  {% endfor %}
