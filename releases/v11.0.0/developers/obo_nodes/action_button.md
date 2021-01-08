---
title: ActionButton
menus: chunks
full_name: ObojoboDraft.Chunks.ActionButton
class: obo_node
node_class: chunk
can_be_in_a_question: yes
---

Displays a button which can use the `onClick` trigger to perform an action - typically to start assessment or navigate the user elsewhere.

## Properties

| Property | Required | Type | Description |
|-
| label | no | String | The label for the button - since this is a string it is not possible to style the button. If you wish to style the text use `textGroup` instead. If this property is not specified then you must specify `textGroup`.
| textGroup | no | {{ 'textGroup' | obo_node }} | The text for the button. If this property is not specified then you must specify `label`.
| triggers | no | Array<{{ 'Trigger' | obo_node }}> | Should contain a trigger for `onClick`

## Supported Trigger Types

| Type Name | Description |
|-
| onMount | Fired when a node is added to the DOM
| onUnmount | Fired when a node is removed from the DOM
| onClick | Fired when an ActionButton button is clicked

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
