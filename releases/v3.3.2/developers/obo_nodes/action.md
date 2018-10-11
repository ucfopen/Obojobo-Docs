---
title: trigger > action
menus: chunks
class: content_block
---

The change that occurs as the result of a event being heard by a {{ 'trigger' | obo_node }}.

## Properties

| Property | Required | Type | Description |
|-
| type | Required | String | The type of action. This is limited to the values shown in the table below.
| value | no | Object | An object that can send one or more values along with the action event. The system can then use these values as desired.

### Supported Values for `type`

| Type Name | Description |
|-
| nav:goto | Navigate a user to a node. `value` should be an object with an `id` property set to the id of the node to navigate to.
| nav:prev | Navigate the user back one page.
| nav:next | Navigate the user forward one page.
| nav:openExternalLink | Navigate a user to an external webpage. `value` should be an object with an `url` property set to the URL to navigate to.
| nav:lock | Locks navigation.
| nav:unlock | Unlocks navigation.
| nav:open | Opens the left-hand navigation drawer.
| nav:close | Closes the left-hand navigation drawer.
| nav:toggle | Toggles open or close the navigation drawer.
| assessment:startAttempt | Begins an assessment attempt. `value` should be an object with an `id` property set to the id of the {{ 'Assessment' | obo_node }} node containing the assessment to start.
| assessment:endAttempt | Ends an assessment attempt. `value` should be an object with an `id` property set to the id of the {{ 'Assessment' | obo_node }} node containing the assessment to start.
| viewer:alert | Displays a dialog. `value` should be an object with a `message` property (the main text of the dialog) and optionally a `title` property (the title of the dialog).
| js | **DEPRECATED** - Runs arbitrary javascript. `value` should be a string of javascript code to execute.

## Required Children

None

## Variables Registered

None

## Example

Action that navigates the user to the node with an id of `page-1`.

### JSON

```json
actions:[
  {
    "type": "nav:goto",
    "value": {
      "id": "page-1"
    }
  }
]
```

### XML

```xml
<actions>
  <action type="nav:goto">
    <value id="page-1" />
  </action>
</actions>
```
