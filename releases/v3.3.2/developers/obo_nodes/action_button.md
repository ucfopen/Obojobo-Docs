---
title: ActionButton
menus: chunks
full_name: OboDraft.Chunks.ActionButton
node_class: chunk
---
Displays a button which can use the `onClick` trigger to perform an action - typically to start assessment or navigate the user elsewhere.

## Properties

| Property | Required | Type | Description |
|-
| label | no | String | The label for the button - since this is a string it is not possible to style the button. If you wish to style the text use `textGroup` instead. If this property is not specified then you must specify `textGroup`.
| textGroup | no | **[TextGroup](content_textgroup.md)** | The text for the button. If this property is not specified then you must specify `label`.
| triggers | Required | Array<**[Trigger](content_trigger)**> | Should contain a trigger for `onClick`

### Supported Trigger Types

| Type Name | Description |
|-
| onClick | Runs when the button is clicked

## Required Children

None

## Variables Registered

None

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
