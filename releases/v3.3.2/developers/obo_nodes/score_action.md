---
title: Assessment > scoreActions
menus: chunks
class: content_block
---

Defines a {{ 'Page' | obo_node }} to display for certain scoring conditions at the end of an assessment attempt.

## Properties

| Property | Required | Type | Description |
|-
| for | Required | [Range String](../range_strings.html), Number, `'no-score'` | A range of score values or a single score. Valid numeric values are 0 to 100.
| page | Required | {{ 'Page' | obo_node }} | The page to display when a student's highest Assessment Score is matched by the range specified by `for`.

## Deprecated Properties:

The `from` and `to` properties have been replaced by the `for` property.

| Property | Type | Description |
|-
| from | Number | The start of the score range (0 to 100)
| to | Number | The end of the score range (0 to 100)

> Use `for`. If you do not specify `for` you must specify both `from` and `to` and these properties may be removed in a future release.

## Example

### JSON

```json
"scoreActions": [
  {
    "for": "[0,100)",
    "page": {
      "type": "ObojoboDraft.Pages.Page",
      "id": "...",
      "children": [ ... ]
    }
  },
  {
    "for": "100",
    "page": {
      "type": "ObojoboDraft.Pages.Page",
      "id": "...",
      "children": [ ... ]
    }
  }
]
```

### OboXML

```xml
<scoreActions>
  <scoreAction for="[0,100)">
    <Page>
      <!-- Page content here -->
    </Page>
  </scoreAction>
  <scoreAction for="100">
    <Page>
      <!-- Page content here -->
    </Page>
  </scoreAction>
</scoreActions>
```

In this example students who receive a 100% are shown a successful landing page - all other scores direct students to a failing landing page. Define a single ScoreAction with a `for` attribute of `'[0-100]'` if you do not wish to direct students to different pages dependent on their attempt scores. If you are using a {{ 'rubric' | obo_node }} that can award `no-score` you must also include a `for="no-score"` ScoreAction.
