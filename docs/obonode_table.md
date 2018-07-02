---
id: obonode_table
title: ObojoboDraft.Chunks.Table
sidebar_label: ObojoboDraft.Chunks.Table
---

A table with an optional header row.

### Content Values

* `header` Boolean: If `true` then the first row of this table will be presented as a header row. Will default to `false` if not set.
* `textGroup` **REQUIRED** [GridTextGroup](content_gridtextgroup): An object containing three properties: **numRows**, **numCols** and **textGroup**.
  * `numRows` **REQUIRED**: Integer.
  * `numCols` **REQUIRED**: Integer.
  * `textGroup` **REQUIRED**: TextGroup - Expects a TextGroup of text items equal to `numRows * numCols`. The first `numCols` number text items will construct the first row of the table and so on. An example is shown below:

### Children

* No children

### Variables Registered

* None

### Example

#### JSON:

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

This will produce a table similar to the following:

| First column heading    | Second column heading    |
| ----------------------- | ------------------------ |
| First column second row | Second column second row |

#### XML:

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

#### OboHTML:

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
