---
id: obo_structure
title: OboNode Structure
sidebar_label: OboNode Structure
---

## About

OboNodes follow a consistent structure with six properties:

* `id`
* `content`
* `metadata`
* `index`
* `type`
* `children`

An example of a "Page" OboNode is shown below:

```json
{
	"id": "page-1",
	"content": {
		"title": "Projectile Motion"
	},
	"metadata": {},
	"index": 0,
	"type": "ObojoboDraft.Pages.Page",
	"children": []
}
```

## Properties

* `id` **REQUIRED**: String: A unique string to identify the node. No node should share an id with another node. Typically these would be automatically generated but if editing manually these can be set to any valid string, much like a DOM node.
* `type` **REQUIRED**: String: The Component Identifier describing the type of node, for example [`ObojoboDraft.Pages.Page`](obo_reference.md#obojobodraftpagespage) in the above example. Obojobo reads the type of node and then references its related Obojobo Component code to process, update and render this item.
* `content`: Object: Properties specific to this type of node go here. The page node in the example above understands the `title` property - each node defines which properties (if any) it understands or expects.
* `children`: Array\<OboNode>: Each OboNode can have an array of children OboNode. While the document structure allows for any node to parent any other node it is important to note that nodes may ignore or expect specific types of children.

Refer to the [**OboNode Reference**](obo_reference.md) section for documentation on expected content values and children for each node.

## Unused Properties

These properties haven't been completed and are not required but you will see them in the JSON output of an Obojobo document so they are included here for reference:

* `metadata`: Object: Meta information about this node. Currently this information is ignored and should be left as `{}` if set. This may be removed in a future release.
* `index`: Integer: The position of this item relative to its siblings. Currently this information is ignored - the order of nodes in the document dictate the rendering order instead. These values should be left as `0` (or any integer) if set. This may be removed in a future release.

**Note:** OboNode examples in the rest of the document will exclude these properties

## Future Development

Our goal is to allow this structure to be open-ended so that new nodes can be developed and added to the system.
