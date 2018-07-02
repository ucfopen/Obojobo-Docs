---
id: content_action
title: Action
sidebar_label: Action
---

## Structure

* `type` **REQUIRED** String: The type of action. This is limited to the following:
  * `nav:goto` - Navigate a user to a node. `value` should be an object with an `id` property set to the id of the node to navigate to.
  * `nav:prev` - Navigate the user back one page.
  * `nav:next` - Navigate the user forward one page.
  * `nav:openExternalLink` - Navigate a user to an external webpage. `value` should be an object with an `url` property set to the URL to navigate to.
  * `nav:lock` - Locks navigation.
  * `nav:unlock` - Unlocks navigation.
  * `nav:open` - Opens the left-hand navigation drawer.
  * `nav:close` - Closes the left-hand navigation drawer.
  * `nav:toggle` - Toggles open or close the navigation drawer.
  * `assessment:startAttempt` - Begins an assessment attempt. `value` should be an object with an `id` property set to the id of the **[ObojoboDraft.Sections.Assessment](obo_reference.md#obojobodraftsectionsassessment)** node containing the assessment to start.
  * `assessment:endAttempt` - Ends an assessment attempt. `value` should be an object with an `id` property set to the id of the **[ObojoboDraft.Sections.Assessment](obo_reference.md#obojobodraftsectionsassessment)** node containing the assessment to start.
  * `js` - Runs arbitrary javascript. `value` should be a string of javascript code to execute.
* `value` Object: An object that can send one or more values along with the action event. The system can then use these values as desired. An example is shown below:

## Example

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

When run, this would navigate the user to the node with an id of `page-1`.



