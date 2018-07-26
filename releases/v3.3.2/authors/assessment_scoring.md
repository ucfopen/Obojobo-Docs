---
title: Assessment Scoring
menu: writing_assessments
---

Assessment scoring is one of Obojobo's more powerful features.  Giving Obojobo flexible scoring rules has the side effect of making it a little complex.  This section will outline how Obojobo scores Assessments.

1. Raw Attempt Score is calculated based on question answers.
2. {{ 'rubric' | obo_node }} is used to determine the Attempt Status.
3. {{ 'rubric' | obo_node }} combines Attempt Status and Raw Score into Final Attempt Score.
4. The highest of all Final Attempt Scores becomes the Overall Assessment Score.

## Raw Attempt Score

Raw Attempt Scores are calculated as an average of all question responses:

### Possible Values

* 0-100

### Calculation

Raw Attempt Score = *Correct questions* / *Total questions* × 100

## Attempt Status

Attempt Status represents the state of an attempt. It is determined by rules set in the {{ 'rubric' | obo_node }}. The Attempt Status is used to calculate the Final Attempt Score.

### Possible Values

| Value | Description
|-
| passed | Student passed the attempt.
| failed | Student failed the attempt.
| unableToPass | Student has no attempts remaining and did not achieve a `passed` status for any of thier attempts.

### How Status is Determined

After an attempt is completed the Attempt Status is determined using rules from the {{ 'rubric' | obo_node }} as follows:

| Rubric Type   | Raw Attempt Score >= rubric's passingAttemptScore? | Attempts Remain? | Resulting Status |
|-
| attempt   | --  | --  | passed       |
| pass-fail | Yes | --  | passed       |
| pass-fail | No  | Yes | failed       |
| pass-fail | No  | No  | unableToPass |

> Any completed Attempt using the `attempt` rubric type will result in a `passed` status.

## Final Attempt Score

The Final Attempt Score is the score the student receives for an Attempt.  This score is what they'll see when reviewing an attempt.  It can include changes like bonuses or deductions from score [*mods*](../developers/obo_nodes/mod.html)

### Possible Values

* 0-100
* `null` (no-score)

> `null` (or `no-score`) values represent that the module has no grade. In this case, no score will be sent to an LMS.

### Calcuation

| Rubric Type   | Assessment Status | Assessment Score |
|-
| no rubric   | --         | Raw Attempt Score |
| pass-fail | passed       | `passedResult` + {{ 'mod' | obo_node }}           |
| pass-fail | failed       | `failedResult`                          |
| pass-fail | unableToPass |` unableToPassResult`                     |

> Final Attempt Score is limited to the range between 0-100, regardless of mods.
>
> | property | value
> |:------------------|-----------:|
> | `passedResult` | 98
> | mods | +5
> | **Final Attempt Score** | **100**

## Overall Assessment Score

The Overall Assessment Score combines multiple attempts into a single score for this Assessment.  In cases where Obojobo sends scores to an LMS (like an LTI assignment), this score is what is sent to the LMS.

> It is possible to control what Obojobo sends to an integrated LMS. See [LTI Score Passback](../authors/assessment_lti_replace_result.html)

### Possible Values

* 0 - 100
* `null` (no-score)

### Calculation

The highest Final Attempt Score for a student, for this assessment, across all attempts.
