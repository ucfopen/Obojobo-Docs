---
title: Triggers and Actions
menus: developers_getting_started
---

Triggers and actions are used by document authors to dynamically control what happens in the student's browser.

> Note: Triggers and actions do not support all the server side [Obojobo Events](events/obojobo_events.html). See the supported values for `type` on {{ 'action' | obo_node }}'s documentation.

## Triggers

A {{ 'trigger' | obo_node }} node listens to a certain event and performs an action when it occurs.

## Actions

An {{ 'action' | obo_node }} is the change that occurs as the result of a event being heard by a {{ 'trigger' | obo_node }}.

## Example

Below is an example of a Button that starts an assessment when clicked.

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
