---
id: assessment_resultsText
title: Assessment Results Text
sidebar_label: Assessment Results Text
---

The assessment results dialog shows different messages based on the set Assessment Rubric options. These are enumerated below:

## Possible Dialogs

**Text**:

> Total: **AssessmentScore**

**Displayed when:**

| Rubric Type   | Status   | Condition                                          | Rewarded Mods? |
| ------------- | -------- | -------------------------------------------------- | -------------- |
| `'attempt'`   | --       | --                                                 | No             |
| `'pass-fail'` | `passed` | `passedResult` = Number AND **AttemptScore** = 100 | No             |
| `'pass-fail'` | `passed` | `passedResult` = `'$attempt_score'`                | No             | Total: **AssessmentScore** |

<hr />

**Text:**

> Attempt Score: **AttemptScore**
>
> **&lt;Mods&gt;**
>
> <hr width="300" />
>
> Total: **AssessmentScore**

**Displayed when:**

| Rubric Type   | Status   | Condition                           | Rewarded Mods? |
| ------------- | -------- | ----------------------------------- | -------------- |
| `'attempt'`   | --       | --                                  | Yes            |
| `'pass-fail'` | `passed` | `passedResult` = `'$attempt_score'` | Yes            |

<hr />

**Text:**

> Attempt Score (Passed): **AttemptScore**
>
> <hr width="300" />
>
> Score adjusted for passing: **PassedResult**
>
> **&lt;Mods (If rewarded)&gt;**
>
> <hr width="300" />
>
> Total: **AssessmentScore**

**Displayed when:**

| Rubric Type   | Status   | Condition                                          | Rewarded Mods? |
| ------------- | -------- | -------------------------------------------------- | -------------- |
| `'pass-fail'` | `passed` | `passedResult` = Number AND **AttemptScore** < 100 | --             |

<hr />

**Text:**

> Attempt Score (Passed): **AttemptScore**
>
> **&lt;Mods (If rewarded)&gt;**
>
> <hr width="300" />
>
> Total: **AssessmentScore**

**Displayed when:**

| Rubric Type   | Status   | Condition                                          | Rewarded Mods? |
| ------------- | -------- | -------------------------------------------------- | -------------- |
| `'pass-fail'` | `passed` | `passedResult` = Number AND **AttemptScore** = 100 | Yes            |

<hr>

**Text:**

> Attempt Score: **AttemptScore**
>
> <hr width="300" />
>
> You need **PassingRange** to pass
>
> <hr width="300" />
>
> Total: Did Not Pass

**Displayed when:**

| Rubric Type   | Status   | Condition                     | Rewarded Mods? |
| ------------- | -------- | ----------------------------- | -------------- |
| `'pass-fail'` | `failed` | `failedResult` = `'no-score'` | --             |

<hr>

**Text:**

> Attempt Score: **AttemptScore**
>
> <hr width="300" />
>
> Score adjusted for not passing (less than **PassingAttemptScore**): **FailedResult**
>
> <hr width="300" />
>
> Total: **FailedResult**

**Displayed when:**

| Rubric Type   | Status   | Condition               | Rewarded Mods? |
| ------------- | -------- | ----------------------- | -------------- |
| `'pass-fail'` | `failed` | `failedResult` = Number | --             |

<hr>

**Text:**

> Attempt Score: **AttemptScore**
>
> <hr width="300" />
>
> You needed **PassingRange** to pass
>
> <hr width="300" />
>
> Total: Did Not Pass

**Displayed when:**

| Rubric Type   | Status         | Condition                     | Rewarded Mods? |
| ------------- | -------------- | ----------------------------- | -------------- |
| `'pass-fail'` | `unableToPass` | `unableToPass` = `'no-score'` | --             |

<hr>

**Text:**

> Attempt Score: **AttemptScore**
>
> <hr width="300" />
>
> You did not achieve a passing **PassingRange** score within the number of attempts available. Your highest attempt score will be used instead.
>
> <hr width="300" />
>
> Highest attempt score (Attempt **AttemptNumber**): **AssessmentScore**
>
> <hr width="300" />
>
> Total: **AssessmentScore**

**Displayed when:**

| Rubric Type   | Status         | Condition                                   | Rewarded Mods? |
| ------------- | -------------- | ------------------------------------------- | -------------- |
| `'pass-fail'` | `unableToPass` | `unableToPass` = `'$highest_attempt_score'` | --             |

<hr>

**Text:**

> Attempt Score: **AttemptScore**
>
> <hr width="300" />
>
> You did not achieve a passing **PassingRange** score within the number of attempts available.
>
> <hr width="300" />
>
> Score for not achieving a passing attempt: **UnableToPassResult**
>
> <hr width="300" />
>
> Total: **AssessmentScore**

**Displayed when:**

| Rubric Type   | Status         | Condition               | Rewarded Mods? |
| ------------- | -------------- | ----------------------- | -------------- |
| `'pass-fail'` | `unableToPass` | `unableToPass` = Number | --             |

## Additional Definitions

**PassingRange**:

* IF `passingAttemptScore` is `100`
  * **PassingRange** = "100%"
* ELSE
  * **PassingRange** = "`passingAttemptScore`-100%"

### Mods

For each rewarded mod:

| Mod reward >= 0 | Condition                     | Text                                                                                |
| --------------- | ----------------------------- | ----------------------------------------------------------------------------------- |
| Yes             | `attemptCondition` = `1`      | "Extra Credit - Passed on first attempt: +**ModReward**%"                           |
| Yes             | Is for last attempt           | "Extra Credit - Passed on last attempt: +**ModReward**%"                            |
| Yes             | `attemptCondition` >= 2       | "Extra Credit - Passed on attempt **AttemptCondition**: +**ModReward**%"            |
| Yes             | `attemptCondition` is a Range | "Extra Credit - Passed on attempts **RangeStart** to **RangeEnd**: +**ModReward**%" |
| No              | `attemptCondition` = `1`      | "Penalty - Passed on first attempt: -**ModReward**%"                                |
| No              | Is for last attempt           | "Penalty - Passed on last attempt: -**ModReward**%"                                 |
| No              | `attemptCondition` >= 2       | "Penalty - Passed on attempt **AttemptCondition**: -**ModReward**%"                 |
| No              | `attemptCondition` is a Range | "Penalty - Passed on attempts **RangeStart** to **RangeEnd**: -**ModReward**%"      |
