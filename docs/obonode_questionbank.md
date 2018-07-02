---
id: obonode_questionbank
title: ObojoboDraft.Chunks.QuestionBank
sidebar_label: ObojoboDraft.Chunks.QuestionBank
---

* Question banks contain one or more questions or other question banks with rules to describe how to select some subset of its children.

## Content Values

* `choose` Integer or `Infinity` (default: `Infinity`): The number of children to "choose" when selecting which children to display. All children are chosen if set to `Infinity`.
* `select` String (default: `'sequential'`): Describes how the question bank selects children - Expected to be one of the following values:
  * `sequential`: Children will be selected in document order. If `choose` is less than the number of children then each attempt will start at the next unseen question.
  * `random`: Children will be selected randomly.
  * `random-unseen`: Children will be selected randomly. If `choose` is less than the number of children then each attempt will prioritize children that were not shown previously.

## Children

* One or more of [**ObojoboDraft.Chunks.QuestionBank**](obonode_questionbank.md) and/or [**ObojoboDraft.Chunks.Question**](obonode_question.md) nodes.

## Variables Registered

* None

## Example

### JSON

```json
{
  "type": "ObojoboDraft.Chunks.QuestionBank",
  "id": "...",
  "content": {
    "choose": 2,
    "select": "random"
  },
  "children": [...]
}
```

### XML

```xml
<QuestionBank choose="2" select="random">
  <!-- ... -->
</QuestionBank>
```
