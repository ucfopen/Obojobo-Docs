---
title: Assessment > rubric
menus: chunks
full_name: rubric
node_class: content

---
An AssessmentRubric is a rubric that marks the overall assessment score based on the attempt scores. For a more in-depth breakdown, see [Assessment Scoring](../../authors/assessment_scoring.html)

## Structure


| Propterty | Required | Type | Description
|-
| type | Required | String | `pass-fail` is the only supported value.
| mods | no | Array\<*[mod](mod.html)*> | A list of mods which provide extra credit or penalties.
| passingAttemptScore | no | Integer 0-100 | Default: `100`. The assessment attempt score required to be rewarded a `passed` status.
| passedResult | no | Integer 0-100 | Default: `100`. The base assessment score if rewarded a `passed` status. If set to `$attempt_score` this assessment attempt score will be used for this value.
| failedResult | no | Integer 0-100 | Default: `0`. The base Assessment score if rewarded a `failed` status. If set to `$attempt_score` the current assessment attempt score will be used.  If set to `no-score`, no score will be awarded and scores will not be sent to the LMS.
| unableToPassResult | no | Integer 0-100 | The base Assessment Score if rewarded an `unableToPass` status. If set to `$highest_attempt_score` the highest assessment attempt score will be used. If not set, the `unableToPass` status will not be rewarded and this result will not be triggered.

## Required Children

None

## Variables Registered

None

## Example

### JSON

```json
{
  "type": "pass-fail",
  "mods": [
    { "attemptCondition": "1", "reward": "5" }
  ],
  passingAttemptScore: 80,
  passedResult: 100,
  failedResult: 49,
  unableToPassResult: '$highest_attempt_score'
}
```

### OboXML

```xml
<rubric
  type="pass-fail"
  passingAttemptScore="80"
  passedResult="100"
  failedResult="49"
  unableToPassResult="$highest_attempt_score">
    <mods>
      <mod attemptCondition="1" reward="5" />
    </mods>
  </rubric>
```

In this case, the student would pass the assessment if any of their attempts were 80% or higher.  Passed assessments would recieve a 100% in the gradebook, assessments where the student had not yet passed but still had remaining attempts would recieve a 49% in the gradebook, and assessments where the student had not passed and had exhausted all of their attempts would recieve the highest of the student's individual attempt scores.
