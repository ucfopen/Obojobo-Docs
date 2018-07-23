---
title: Triggers and Actions
menus: developers_getting_started
---
## Triggers

Triggers have two properties: **type** and **actions**:

* `type` **REQUIRED**: String: This is the event that causes this trigger to run, for example `onNavEnter` meaning when the user navigates to this node.
* `actions` **REQUIRED**: Array<Action>: One or more actions to perform when this trigger is ran.

A list of all current triggers are listed below:

* `onStartAttempt` - Fired when an assessment attempt is started
* `onEndAttempt` - Fired when an assessment attempt is submitted
* `onNavEnter` - Fired when a node is navigated to
* `onNavExit` - Fired when a node is navigated away from
* `onClick` (Used by **[ObojoboDraft.Chunks.ActionButton](obo_reference.md#obojobodraftchunksactionbutton)**) - Fired when the ActionButton button is clicked

## Actions

Actions have two properties: **type** and **value**:

* `type` **REQUIRED**: String: The type of action. The meaning of these values are defined in the system.
* `value`: Object: An object that can send one or more values along with the action event. The system can then use these values as desired. An example is shown below:

```json
{
	"type": "nav:goto",
	"value": {
		"id": "page-1"
	}
}
```

When ran this would navigate the user to the node with an id of `page-1`.

A list of actions to fire and their corresponding expected values are listed below:

* `nav:goto` - Navigate a user to a node. `value` should be an object with an `id` property set to the id of the node to navigate to.
* `nav:prev` - Navigate the user back one.
* `nav:next` - Navigate the user forward one.
* `nav:openExternalLink` - Navigate a user to an external webpage. `value` should be an object with an `url` property set to the URL to navigate to.
* `nav:lock` - Locks navigation.
* `nav:unlock` - Unlocks navigation.
* `nav:open` - Opens the left-hand navigation drawer.
* `nav:close` - Closes the left-hand navigation drawer.
* `nav:toggle` - Toggles open or close the navigation drawer.
* `assessment:startAttempt` - Begins an assessment attempt. `value` should be an object with an `id` property set to the id of the **[ObojoboDraft.Sections.Assessment](obo_reference.md#obojobodraftsectionsassessment)** node containing the assessment to start.
* `assessment:endAttempt` - Ends an assessment attempt. `value` should be an object with an `id` property set to the id of the **[ObojoboDraft.Sections.Assessment](obo_reference.md#obojobodraftsectionsassessment)** node containing the assessment to start.
* `js` - Runs arbitrary javascript. `value` should be a string of javascript code to execute.
