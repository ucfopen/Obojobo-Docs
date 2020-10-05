---
title: Assessment > rubric
menus: chunks
class: content_block

---

An AssessmentRubric is a rubric that marks the overall assessment score based on the attempt scores. For a more in-depth breakdown of how scoring occurs, see [Assessment Scoring](../../authors/assessment_scoring.html)

## Properties

| Property | Required | Type | Description
|-
| type | Required | String | `pass-fail` is the only supported value.
| mods | no | Array\<{{ 'mod' | obo_node }}> | A list of mods which provide extra credit or penalties.
| passingAttemptScore | no | Number | Default: `100`. The assessment attempt score required to be rewarded a `passed` status. Valid values are 0 to 100.
| passedResult | no | Number, `$attempt_score` | Default: `100`. The base assessment score if rewarded a `passed` status. If set to `$attempt_score` this assessment attempt score will be used for this value. Valid numeric values are 0 to 100.
| failedResult | no | Number, `$attempt_score`, `no-score` | Default: `0`. The base Assessment score if rewarded a `failed` status. If set to `$attempt_score` the current assessment attempt score will be used. If set to `no-score`, no score will be awarded and scores will not be sent to the LMS. Valid numeric values are 0 to 100.
| unableToPassResult | no | Number, `$highest_attempt_score`, `no-score` | The base Assessment Score if rewarded an `unableToPass` status. If set to `$highest_attempt_score` the highest assessment attempt score will be used. If set to `no-score`, no score will be awarded and scores will not be sent to the LMS. If not set, the `unableToPass` status will not be rewarded and this result will not be triggered. Valid numeric values are 0 to 100.

## Example

### JSON

```json
"rubric": {
	"type": "pass-fail",
	"passingAttemptScore": 80,
	"passedResult": 100,
	"failedResult": "no-score",
	"unableToPassResult": "$highest_attempt_score"
}
```

### OboXML

```xml
<rubric
  type="pass-fail"
  passingAttemptScore="80"
  passedResult="100"
  failedResult="no-score"
  unableToPassResult="$highest_attempt_score"
/>
```

In this case, the student would pass the assessment if any of their attempts were 80% or higher. Passed assessments would receive a 100%, assessments where the student had not yet passed but still had remaining attempts would not receive a score (with no value in the LMS gradebook), and assessments where the student had not passed and had exhausted all of their attempts would receive the highest of the student's individual attempt scores.

> More examples can be found in the [Author section](../../authors/)
