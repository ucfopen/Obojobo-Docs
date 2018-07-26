---
title: Triggers and Actions
menus: authors_how_to
---

OboNodes can fire events which other nodes in the system can hear and respond to via {{ 'trigger' | obo_node }} and {{ 'action' | obo_node }}. For example an Assessment section can lock out the navigation of the module so that students cannot view the content until the assessment is completed.

## Example Scenario

When an attempt is started the `onStartAttempt` event that {{ 'Assessment' | obo_node }} emits will be broadcast in the Obojobo Draft Viewer.

In the example above, two {{ 'action' | obo_node }}s are triggered by that event.  One using the `nav:lock` action which disables the navigation menu. The other uses the `viewer:alert` action that will cause a dialog to display.

When the attempt is completed the `onEndAttempt` event be heard by the second trigger, activating an action which will unlock the navigation (`nav:unlock`).

## JSON Example

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

## XML Example

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

