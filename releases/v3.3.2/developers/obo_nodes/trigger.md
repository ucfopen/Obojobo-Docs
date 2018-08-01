---
title: trigger
menus: chunks
class: content_block
---

A listener for a certain event that performs an action when it occurs.

Triggers are linked to the OboNode that contains them. They are only fired when the matching event `type` is heard for that particular node. For example a trigger listening to the `onClick` event is only linked to the clicking of the {{ 'ActionButton' | obo_node }} it is attached to.

> Triggers must always be wrapped in a triggers array.

## Structure

| Property | Required | Type | Description |
|-
| type | Required | String | This is the event that causes this trigger to run. Currently, the system only supports a limited range of triggers in the following OboNodes:
| actions | Required | Array<{{ 'action' | obo_node }}> | One or more actions to perform when this trigger is run.

### Supported Action Types

| Action Type | Node Types | Description
|-
| onMount | All | Fired when a node is added to the DOM
| onUnmount | All | Fired when a node is removed from the DOM
| onNavEnter | {{ 'Page' | obo_node }} {{ 'Assessment' | obo_node }} | Fired when a node is navigated to
| onNavExit | {{ 'Page' | obo_node }} {{ 'Assessment' | obo_node }} | Fired when a node is navigated away from
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

These triggers would be placed in an {{ 'Assessment' | obo_node }} node, and would cause the navigation bar to lock when the assessment started, and unlock once the navigation was finished.
