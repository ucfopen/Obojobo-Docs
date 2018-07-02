---
id: obonode_actionbutton
title: ObojoboDraft.Chunks.ActionButton
sidebar_label: ObojoboDraft.Chunks.ActionButton
---

Displays a button which can use the `onClick` trigger to perform an action - typically to start assessment or navigate the user elsewhere.

## Content values

* `label` String: The label for the button - since this is a string it is not possible to style the button. If you wish to style the text use `textGroup` instead. If this property is not specified then you must specify `textGroup`.
* `textGroup` **[TextGroup](content_textgroup.md)**: The text for the button. If this property is not specified then you must specify `label`.
* `triggers` **REQUIRED** **[Trigger](content_trigger)**: Should contain a trigger for `onClick` - see example below:

## Triggers

* `onClick` - Runs when the button is clicked

## Children

* None

## Variables Registered

* None

## Example

### JSON (Using label)

```json
{
	"type": "ObojoboDraft.Chunks.ActionButton",
	"content": {
		"label": "Start Assessment",
		"triggers": [
			{
				"type": "onClick",
				"actions": [
					{
						"type": "assessment:startAttempt",
						"value": {
							"id": "assessment"
						}
					}
				]
			}
		]
	}
}
```

### XML (Using label)

```xml
<ActionButton label="Begin">
  <triggers>
    <trigger type="onClick">
      <actions>
        <action type="assessment:startAttempt">
          <value id="assessment">
        </action>
      </actions>
    </trigger>
  </triggers>
</ActionButton>
```

### JSON (Using textGroup)

```json
{
	"type": "ObojoboDraft.Chunks.ActionButton",
	"content": {
		"textGroup": [
			{
				"text": {
					"value": "Begin"
				}
			}
		],
		"triggers": [
			{
				"type": "onClick",
				"actions": [
					{
						"type": "assessment:startAttempt",
						"value": {
							"id": "assessment"
						}
					}
				]
			}
		]
	}
}
```

### XML (Using textGroup)

```xml
<ActionButton>
  <textGroup>
    <t>Begin</t>
  </textGroup>
  <triggers>
    <trigger type="onClick">
      <actions>
        <action type="assessment:startAttempt">
          <value id="assessment">
        </action>
      </actions>
    </trigger>
  </triggers>
</ActionButton>
```
