---
title: Assessment Scoring
menu: writing_assessments
---

As a default assessment scoring in Obojobo is simple. Each attempt score is an average of all question responses and the Overall Assessment Score is the highest of these scores. However, you can modify how scores are calculated using a {{ 'rubric' | obo_node }}. The rubic is a very powerful feature that allows for flexible scoring rules but can make scoring a little complex. This section will outline in detail how Obojobo scores Assessments.

## Overview

1.  Raw Attempt Score is calculated based on question answers.
2.  {{ 'rubric' | obo_node }} is used to determine the Attempt Status.
3.  {{ 'rubric' | obo_node }} combines Attempt Status and Raw Score into Post-Rubric Score.
4.  The highest of all Post-Rubric Scores becomes the Overall Assessment Score.

## Raw Attempt Score

Raw Attempt Scores are calculated as an average of all question responses:

### Possible Values

- 0-100

### Calculation

Raw Attempt Score = _Correct questions_ / _Total questions_ × 100

## Attempt Status

Attempt Status represents the state of an attempt. It is determined by rules set in the {{ 'rubric' | obo_node }}. The Attempt Status is used to calculate the Post-Rubric Score.

### Possible Values

| Value | Description
|-
| passed | Student passed the attempt.
| failed | Student failed the attempt.
| unableToPass | Student has no attempts remaining and did not achieve a `passed` status for any of thier attempts.

### How Status is Determined

After an attempt is completed the Attempt Status is determined using rules from the {{ 'rubric' | obo_node }} as follows:

| Rubric Type | Raw Attempt Score >= rubric's passingAttemptScore? | Attempts Remain? | Resulting Status |
|-
| -- | -- | -- | passed |
| pass-fail | Yes | -- | passed |
| pass-fail | No | Yes | failed |
| pass-fail | No | No | unableToPass |

> Any completed Attempt when not using a rubric will result in a `passed` status.

## Post-Rubric Score

The Post-Rubric Score is the score the student receives for an Attempt. This score is what they'll see when reviewing an attempt. It can include changes like bonuses or deductions from score [_mods_](../developers/obo_nodes/mod.html)

### Possible Values

- 0-100
- `null` (`"no-score"`)

> `no-score` is a special value that represents that the module has no grade. In this case, no score will be sent to an LMS. In rubrics and scoreActions it is indicated with `"no-score"`. In assessment result data it is indicated as `null`.

### Calcuation

| Rubric Type | Assessment Status | Post-Rubric Score |
|-
| (no rubric) | -- | Raw Attempt Score |
| pass-fail | passed | `passedResult` + {{ 'mod' | obo_node }}(s) |
| pass-fail | failed | `failedResult` |
| pass-fail | unableToPass |`unableToPassResult` |

> Post-Rubric Score is limited to the range between 0-100, regardless of mods.
>
> | property              |   value |
> | :-------------------- | ------: |
> | `passedResult`        |      98 |
> | mods                  |      +5 |
> | **Post-Rubric Score** | **100** |

## Overall Assessment Score

The Overall Assessment Score combines multiple attempts into a single score for this Assessment. In cases where Obojobo sends scores to an LMS (like an LTI assignment), this score is what is sent to the LMS.

> It is possible to control what Obojobo sends to an integrated LMS. See [LTI Score Passback](../authors/assessment_lti_replace_result.html)

### Possible Values

- 0 - 100
- `null` (no-score)

### Calculation

The highest Post-Rubric Score for a student, for this assessment, across all attempts.
