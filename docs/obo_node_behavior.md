---
id: obo_node_behavior
title: OboNode Behavior
sidebar_label: OboNode Behavior
---

Additionally nodes can fire events which other nodes in the system can hear and respond to via **triggers** and **actions**. For example an Assessment section can lock out the navigation of the module so that students cannot view the content until the assessment is completed. An example of this is shown below:

```json
...
{
  "id": "assessment",
  "type": "ObojoboDraft.Sections.Assessment",
  "content": {
    "triggers": [
      {
        "type": "onStartAttempt",
        "actions": [
          {
            "type": "nav:lock"
          },
          {
            "type": "viewer:alert",
            "value": {
              "title": "Hey!",
              "message": "Attempt has started"
            }
          }
        ]
      },
      {
        "type": "onEndAttempt",
        "actions": [
          {
            "type": "nav:unlock"
          }
        ]
      }
    ]
  },
  "children": { ... }
}
...
```

Here is the same OboNode represented in XML:

```xml
<Assessment>
  <triggers>
    <trigger type="onStartAttempt">
      <actions>
        <action type="nav:lock" />
        <action type="viewer:alert">
          <value title="I have a message for you:" message="Thanks for clicking the button" />
        </action>
      </actions>
    </trigger>
    <trigger type="onEndAttempt">
      <actions>
        <action type="nav:unlock" />
      </actions>
    </trigger>
  </triggers>
</Assessment>
```

When an attempt is started the [`onStartAttempt`](obo_content_reference.md#triggers) event will be broadcast in the Obojobo Draft Viewer. In this example the Assessment Obojobo Component will be triggered by this event and will fire the [`nav:lock`](events_3.3_all.md#nav-lock) action. This disables navigation in the system. [`viewer:alert`](events_3.3_all.md#viewer-alert) is also fired - This action will cause a dialog to display in the Obojobo Draft Viewer. When the attempt is completed this Obojobo Component will respond to the [`onEndAttempt`](obo_content_reference.md#triggers) trigger and the navigation will then be unlocked via the [`nav:unlock`](events_3.3_all.md#nav-unlock) action.
