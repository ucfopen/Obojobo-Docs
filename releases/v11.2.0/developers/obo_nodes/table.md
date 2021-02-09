---
title: Table
menus: chunks
full_name: ObojoboDraft.Chunks.Table
class: obo_node
node_class: chunk
can_be_in_a_question: yes
---

A table with an optional header row.

## Properties

| Property | Required | Type | Description |
|-
| textGroup | Required | {{ 'gridTextGroup' | obo_node }} | An object containing the text to display in each table cell.
| header | no | Boolean | Default: `false`. If `true` then the first row of this table will be presented as a header row.
| display | no | String | Default: `fixed`. Describes how to render the table. Supported values shown in the table below.

### Supported Values for `display`

| Type Name | Description |
|-
| fixed | Each column in the table is set to the same width
| auto | Columns in the table are automatically resized by the browser based on the width of their content

## Supported Trigger Types

| Action Type | Description
|-
| onMount | Fired when a node is added to the DOM
| onUnmount | Fired when a node is removed from the DOM

## Required Children

None

## Variables Registered

None

## Example

### Sample Render

> | First column heading    | Second column heading    |
> | ----------------------- | ------------------------ |
> | First column second row | Second column second row |
>
> {:.example-html}

### JSON

```json
{
	"type": "ObojoboDraft.Chunks.Table",
	"content": {
		"header": true,
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
	}
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

### OboHTML

```xml
<table>
  <tr>
    <th>First column heading</th>
    <th>Second column heading</th>
  </th>
  <tr>
    <td>First column second row</td>
    <td>Second column second row</td>
  </tr>
</table>
```
