---
title: OboNode Structure
menus:
  developers_getting_started:
    weight: -2

---

The OboNode is a Data structure which defines the use of an OboNode Component and its related data & content. Multiple OboNodes comprise an Obojobo Draft Document.

Our goal is to allow this structure to be open-ended so that new nodes can be developed and added to the system.

## Structure

Each OboNode has a native JSON representation.  All nodes share the same basic structure.

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
| id | Required | String | A unique string to identify the node. No node can share an id with another node. Id's are automatically generated when omitted, but can be set if a reference to this node is needed for extended functionality.
| type | Required | String | An OboNode Component Identifier that determines which OboNode Component will be used process and render this item.
| content | no | Object | Properties that define the contents of this node. The {{ 'Page' | obo_node }} node in the example only understands a single property; **title**. Each type of node supports different properties.
| children | no | Array\<OboNode> | Each OboNode can have an array of children OboNodes. Different OboNode types may ignore or expect specific types of children.

## Unused Properties

These properties haven't been completed and are not required but you will see them in the JSON output of an Obojobo document so they are included here for reference:

| Property | Type | Description
|-
| metadata | Object | Meta information about this node. Currently this information is ignored and should be left as `{}` if set. This may be removed in a future release.
| index  | Integer | The position of this item relative to its siblings. Currently this information is ignored - the order of nodes in the document dictate the rendering order instead. These values should be left as `0` (or any integer) if set. This may be removed in a future release.

> **Note:** OboNode examples in the rest of the document will exclude these properties

## OboNode Clasifications

### Chunk

> @TODO

### Section

> @TODO

### Page

> @TODO

### Content

A class of node used in the `content` attribute of other OboNode Components. For example, {{ 'scoreAction' | obo_node }} is a content class node used in the {{ 'Assessment' | obo_node }} node. These **always start with a lowercased letter** to differentiate them from the other classifications.

## OboNode Reference

{% assign menu = site.menus.chunks %}
{% assign childen = (menu | sort_natural: 'title') %}

{% for item in childen %}
* {{ item.title | split: ' > ' | last | obo_node }}
{% endfor %}
