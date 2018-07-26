---
title: Table > gridTextGroup
menus: chunks
full_name: gridTextGroup
node_class: content
---

A container that describes the size, shape, and text contents of a {{ 'Table' | obo_node }}.

## Properties

| Property | Required | Type | Description |
|-
| numRows | Required | Integer | Number of Rows in the table
| numCols | Required | Integer | Number of Columns in the table
| textGroup | Required | {{ 'textGroup' | obo_node }} | Expects a {{ 'textGroup' | obo_node }} with a number {{ 'textItem' | obo_node }}s  equal to `numRows * numCols`. The items will be assigned to table cells in order, left to right, top to bottom, and wrapping to a new row every multiple of `numCols`.


## Required Children

None

## Variables Registered

None

## Example

### JSON

```json

```

### XML

```xml

```

### OboHTML

```xml

```
