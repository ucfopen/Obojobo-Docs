---
title: trigger
menus: chunks
full_name: trigger
node_class: content
---
A trigger is a condition that will allow an action to take place when met, and must always be wrapped in a triggers array.

Triggers are linked to the OboNode that contains them, and are only fired when the condition is met for that particular node. Ergo, an `onClick` trigger is only linked to the clicking of one specific button.

## Structure

| Property | Required | Type | Description |
|-
| type | Required | String | This is the event that causes this trigger to run. Currently, the system only supports a limited range of triggers in the following OboNodes:
| actions | Required | Array\<{{ 'action' | obo_node }}\> | One or more actions to perform when this trigger is run.

### Supported Action Types

| Action Type | Node Types | Description
|-
| onMount | All | Fired when a node is added to the DOM
| onUnmount | All | Fired when a node is removed from the DOM
| onNavEnter | {{ 'Heading' | obo_node }} {{ 'Page' | obo_node }} {{ 'Question' | obo_node }} {{ 'Assessment' | obo_node }}  | Fired when a node is navigated to
| onNavExit | {{ 'Heading' | obo_node }} {{ 'Page' | obo_node }} {{ 'Question' | obo_node }} {{ 'Assessment' | obo_node }} | Fired when a node is navigated away from
| onStartAttempt | {{ 'Assessment' | obo_node }} | Fired when an assessment attempt is started
| onEndAttempt | {{ 'Assessment' | obo_node }} | Fired when an assessment attempt is submitted
| onClick | {{ 'ActionButton' | obo_node }} | Fired when an ActionButton button is clicked

## Required Children

None

## Variables Registered

None

## Example

### JSON

```json
"triggers": [
  {
    "type":"onStartAttempt",
    actions: [
      {
        "type":"nav:lock"
      }
    ]
  },
  {
    "type":"onEndAttempt",
    actions: [
      {
        "type":"nav:unlock"
      }
    ]
  }
]
```

### OboXML

```xml
<triggers>
  <trigger type="onStartAttempt">
    <actions>
      <action type="nav:lock" />
    </actions>
  </trigger>
  <trigger type="onEndAttempt">
    <actions>
      <action type="nav:unlock" />
    </actions>
  </trigger>
</triggers>
```

These triggers would be placed in an **ObojoboDraft.Sections.Assessment** node, and would cause the navigation bar to lock when the assessment started, and unlock once the navigation was finished.
