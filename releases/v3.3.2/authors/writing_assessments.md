---
title: Assessment Scoring
menu: writing_assessments
---

After each Assessment Attempt Quiz the Assessment Attempt Score, Assessment Score and Assessment Status is calculated.

## Assessment Attempt Score

Assessment Attempt Scores are calculated as an average of every response:

### Expected Values

* 0-100

### Calculation

**Assessment Attempt Score** = **Number of questions answered correctly** / **Number of questions** × 100

## Assessment Status

This identifies the completed state of an Assessment Attempt.

### Expected Values

* `'passed'`: Student passed the Assessment.
* `'failed'`: Student failed the Assessment.
* `'unableToPass'`: Student has no Assessment Attempt remaining and did not achieve a `'passed'` status for any of thier Assessment Attempts.

### Calculation

After an Assessment Attempt is completed the Assessment Status is calculated as follows:

| Rubric Type   | Attempt Score >= `passingAttemptScore`? | Attempts Remain? | Status =         |
| ------------- | --------------------------------------- | ---------------- | ---------------- |
| `'attempt'`   | --                                      | --               | `'passed'`       |
| `'pass-fail'` | Yes                                     | --               | `'passed'`       |
| `'pass-fail'` | No                                      | Yes              | `'failed'`       |
| `'pass-fail'` | No                                      | No               | `'unableToPass'` |

(Note that any completed Assessment Attempt in the `'attempt'` rubric mode results in a `'passed'` status)

## Assessment Score

The Assessment Score is calculated based on the Assessment Rubric

### Expected Values

* 0-100
* `null` (no-score)

### Calcuation

| Rubric Type   | Rewarded Assessment Status | Assessment Score =                       |
| ------------- | -------------------------- | ---------------------------------------- |
| `'attempt'`   | --                         | Assessment Attempt Score + Rewarded Mods |
| `'pass-fail'` | `'passed'`                 | `passedResult` + Rewarded Mods           |
| `'pass-fail'` | `'failed'`                 | `failedResult`                           |
| `'pass-fail'` | `'unableToPass'`           | `unableToPassResult`                     |

`null` (or `no-score`) Assessment Scores represent that the module has no grade (and no score will be sent via LTI). This allows you to require a student to retry an Assessment to achieve a certain passing score.

The Assessment Score is always bound to the range of 0-100, regardless of rewarded mods. For example, if the Assessment Attempt Score = 100 and Rewarded Mods = +5 the resulting Assessment Score would be 100, not 105.
