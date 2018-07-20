---
title: Rubric
menus:
  chunks:
    title: rubric
full_name: rubric
node_class: content
---
**Node Class:** *[{{ page.node_class | capitalize }}](/developers/obo_node_structure.html#{{ page.node_class }})*
**Full Name:** *{{ page.full_name }}*

An AssessmentRubric is a rubric that marks the overall assessment score based on the attempt scores. For a more in-depth breakdown, see [AssessmentScoring](assessment_scoring.md)

## Structure

* `type` **REQUIRED** String : Must be `'pass-fail'` (future versions may introduce additional rubrics).
* `mods` Array\<**[Mod](content_mod.md)**>: A list of Mods which provide extra credit or penalties.
* `passingAttemptScore` Integer 0-100 (Default: `100`): The Assessment Attempt score required to be rewarded a `'passed'` status.
* `passedResult` Integer 0-100 or `'$attempt_score'` (Default: `100`): The base Assessment Score if rewarded a `'passed'` status. If `'$attempt_score'` is specified this Assessment Attempt score will be used for this value.
* `failedResult` Integer 0-100 or `'$attempt_score'` or `'no-score'` (Default: `0`): The base Assessment Score if rewarded a `'failed'` status.
* `unableToPassResult` Integer 0-100 or `'no-score'` or `'$highest_attempt_score'` (Default: Not set): The base Assessment Score if rewarded an `unableToPass` status. If `'$highest_attempt_score'` is specified then the highest Assessment Attempt score will be used for this value. If this value is not set then the `unableToPass` status will not be rewarded and this result will not be triggered.

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
