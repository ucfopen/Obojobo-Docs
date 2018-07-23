---
title: Trigger
menus:
  chunks:
    title: trigger
full_name: trigger
node_class: content
---
**Node Class:** *[{{ page.node_class | capitalize }}](/developers/obo_node_structure.html#{{ page.node_class }})*
**Full Name:** *{{ page.full_name }}*

A trigger is a condition that will allow an action to take place when met, and must always be wrapped in a triggers array.

Triggers are linked to the OboNode that contains them, and are only fired when the condition is met for that particular node. Ergo, an `onClick` trigger is only linked to the clicking of one specific button.

## Structure

* `type` **REQUIRED**: String: This is the event that causes this trigger to run. Currently, the system only supports a limited range of triggers in the following OboNodes:
  * Any OboNode
    * `onMount` - Fired when a node is added to the DOM
    * `onUnmount` - Fired when a node is removed from the DOM
  * OboNodes that register to the navigation menu
    * `onNavEnter` - Fired when a node is navigated to
    * `onNavExit` - Fired when a node is navigated away from
  * **[ObojoboDraft.Sections.Assessment](obonode_assessment)**
    * `onStartAttempt` - Fired when an assessment attempt is started
    * `onEndAttempt` - Fired when an assessment attempt is submitted
  * **[ObojoboDraft.Chunks.ActionButton](obonode_actionbutton)**
    * `onClick` - Fired when an ActionButton button is clicked
* `actions` **REQUIRED**: Array\<**[Action](content_action.md)**>: One or more actions to perform when this trigger is run.


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
