---
title: Table > gridTextGroup
menus: chunks
class: content_block
---

A container that describes the size, shape, and text contents of a {{ 'Table' | obo_node }}.

## Properties

| Property | Required | Type | Description |
|-
| numRows | Required | Integer | Number of Rows in the table (1 or higher)
| numCols | Required | Integer | Number of Columns in the table (1 or higher)
| textGroup | Required | {{ 'textGroup' | obo_node }} | Expects a {{ 'textGroup' | obo_node }} with a number {{ 'textItem' | obo_node }}s equal to `numRows * numCols`. The items will be assigned to table cells in order, left to right, top to bottom, and wrapping to a new row every multiple of `numCols`.

## Required Children

None

## Variables Registered

None

## Example

### JSON

```json
"textGroup": {
	"numRows": 2,
	"numCols": 2,
	"textGroup": [
		{
			"text": {
				"value": "First column heading"
			}
		},
		{
			"text": {
				"value": "Second column heading"
			}
		},
		{
			"text": {
				"value": "First column second row"
			}
		},
		{
			"text": {
				"value": "Second column second row"
			}
		}
	]
}
```

### XML

```xml
<Table numRows="2" numCols="2" header="true">
  <textGroup>
    <t>First column heading</t>
    <t>Second column heading</t>
    <t>First column second row</t>
    <t>Second column second row</t>
  </textGroup>
</Table>
```
