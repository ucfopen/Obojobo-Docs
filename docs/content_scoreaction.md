---
id: content_scoreaction
title: ScoreAction
sidebar_label: ScoreAction
---

A ScoreAction object contains two properties: **for** and **page**, and are always wrpped in a scoreActions array:

### Structure

* `for` **REQUIRED** **[Range](content_range.md)** or Integer or `'no-score'`: A range of score values or a single score.
* `page` **REQUIRED**: [**Obojobo.Pages.Page**](obonode_page.md): The page to display when a student's highest Assessment Score is matched by the range specified by `for`.

### Example

#### JSON

```json
{
  "type": "ObojoboDraft.Sections.Assessment",
  "content": {
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
  }
  ...
}
```

#### OboXML

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
