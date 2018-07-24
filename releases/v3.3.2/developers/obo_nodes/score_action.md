---
title: Assessment > scoreActions
menus: chunks
full_name: scoreAction
node_class: content
---
A ScoreAction object contains two properties: **for** and **page**, and are always wrapped in a scoreActions array:

## Structure

* `for` **REQUIRED** **[Range](content_range.md)** or Integer or `'no-score'`: A range of score values or a single score.
* `page` **REQUIRED**: [**Obojobo.Pages.Page**](obonode_page.md): The page to display when a student's highest Assessment Score is matched by the range specified by `for`.

### Legacy properties (Deprecated):

The `from` and `to` properties have been replaced by the `for` property.

* `from`: Integer: The start of the score range
* `to`: Integer: The end of the score range

You must either specify `for` or specify both `from` and `to`. `from` and `to` are deprecated and may be removed in a future release.

## Required Children

None

## Variables Registered

None

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

In this example students who receive a 100% are shown a successful landing page - all other scores direct students to a failing landing page. Define a single ScoreAction with a `for` attribute of `'[0-100]'` if you do not wish to direct students to different pages dependent on their attempt scores.
