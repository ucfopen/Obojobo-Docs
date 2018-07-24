---
title: Table
menus: chunks
full_name: OboDraft.Chunks.Table
node_class: chunk
can_be_in_a_question: yes
---
A table with an optional header row.

## Properties

| Property | Required | Type | Description |
|-
| header | no | Boolean | If `true` then the first row of this table will be presented as a header row. Will default to `false` if not set.
| textGroup | Requied | [GridTextGroup](content_gridtextgroup) | An object containing three properties: **numRows**, **numCols** and **textGroup**.

## Expected 'textGroup' Value

| Property | Required | Type | Description |
|-
| numRows | Required | Integer | Number of Rows in the table
| numCols | Required | Integer | Number of Columns in the table
| textGroup | Required | TextGroup | Expects a TextGroup of text items equal to `numRows * numCols`. The items will be used in order, creating a new row every multiple of `numCols`.

## Required Children

None

## Variables Registered

None

## Example

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

This will produce a table similar to the following:

| First column heading    | Second column heading    |
| ----------------------- | ------------------------ |
| First column second row | Second column second row |
