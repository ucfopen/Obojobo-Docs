---
title: Score Results Text
menu: writing_assessments
---

The assessment results dialog shows different messages based on the set Assessment Rubric options. These are enumerated below:

## Total

**Text**:

> Total: **PostRubricScore**

**Displayed when:**

| Rubric?       | Status   | Condition                                             | Rewarded Mods? |
| ------------- | -------- | ----------------------------------------------------- | -------------- |
| not specified | --       | --                                                    | No             |
| `'pass-fail'` | `passed` | `passedResult` = Number AND **RawAttemptScore** = 100 | No             |
| `'pass-fail'` | `passed` | `passedResult` = `'$attempt_score'`                   | No             | Total: **PostRubricScore** |

## Total (With Mods)

**Text:**

> Attempt Score: **RawAttemptScore**
>
> **&lt;Mods&gt;**
>
> <hr />
>
> Total: **PostRubricScore**

**Displayed when:**

| Rubric?       | Status   | Condition                           | Rewarded Mods? |
| ------------- | -------- | ----------------------------------- | -------------- |
| not specified | --       | --                                  | Yes            |
| `'pass-fail'` | `passed` | `passedResult` = `'$attempt_score'` | Yes            |

## Score Adjusted For Passing

**Text:**

> Attempt Score (Passed): **RawAttemptScore**
>
> <hr />
>
> Score adjusted for passing: **PassedResult**
>
> <hr />
>
> Total: **PostRubricScore**

**Displayed when:**

| Rubric Type   | Status   | Condition                                             | Rewarded Mods? |
| ------------- | -------- | ----------------------------------------------------- | -------------- |
| `'pass-fail'` | `passed` | `passedResult` = Number AND **RawAttemptScore** < 100 | No             |

## Score Adjusted For Passing (With Mods)

**Text:**

> Attempt Score (Passed): **RawAttemptScore**
>
> <hr />
>
> Score adjusted for passing: **PassedResult**
>
> **&lt;Mods&gt;**
>
> <hr />
>
> Total: **PostRubricScore**

**Displayed when:**

| Rubric Type   | Status   | Condition                                             | Rewarded Mods? |
| ------------- | -------- | ----------------------------------------------------- | -------------- |
| `'pass-fail'` | `passed` | `passedResult` = Number AND **RawAttemptScore** < 100 | Yes            |

## Attempt Score (Passed): 100%

**Text:**

> Attempt Score (Passed): **RawAttemptScore**
>
> **&lt;Mods&gt;**
>
> <hr />
>
> Total: **PostRubricScore**

**Displayed when:**

| Rubric Type   | Status   | Condition                                             | Rewarded Mods? |
| ------------- | -------- | ----------------------------------------------------- | -------------- |
| `'pass-fail'` | `passed` | `passedResult` = Number AND **RawAttemptScore** = 100 | Yes            |

## You Need \_\_\_ To Pass

**Text:**

> Attempt Score: **RawAttemptScore**
>
> <hr />
>
> You need **PassingRange** to pass
>
> <hr />
>
> Total: **PostRubricScore**

**Displayed when:**

| Rubric Type   | Status   | Condition                           |
| ------------- | -------- | ----------------------------------- |
| `'pass-fail'` | `failed` | `failedResult` = `'$attempt_score'` |

## Total: Did Not Pass (Attempts Remaining)

**Text:**

> Attempt Score: **RawAttemptScore**
>
> <hr />
>
> You need **PassingRange** to pass
>
> <hr />
>
> Total: Did Not Pass

**Displayed when:**

| Rubric Type   | Status   | Condition                     |
| ------------- | -------- | ----------------------------- |
| `'pass-fail'` | `failed` | `failedResult` = `'no-score'` |

## Score Adjusted For Not Passing

**Text:**

> Attempt Score: **RawAttemptScore**
>
> <hr />
>
> Score adjusted for not passing (less than **PassingAttemptScore**): **FailedResult**
>
> <hr />
>
> Total: **FailedResult**

**Displayed when:**

| Rubric Type   | Status   | Condition               |
| ------------- | -------- | ----------------------- |
| `'pass-fail'` | `failed` | `failedResult` = Number |

## Total: Did Not Pass (No Attempts Remaining)

**Text:**

> Attempt Score: **RawAttemptScore**
>
> <hr />
>
> You needed **PassingRange** to pass
>
> <hr />
>
> Total: Did Not Pass

**Displayed when:**

| Rubric Type   | Status         | Condition                           |
| ------------- | -------------- | ----------------------------------- |
| `'pass-fail'` | `unableToPass` | `unableToPassResult` = `'no-score'` |

## No Attempts Remaining, Highest Attempt Score Counts

**Text:**

> Attempt Score: **RawAttemptScore**
>
> <hr />
>
> You did not achieve a passing **PassingRange** score within the number of attempts available. Your highest attempt score will be used instead.
>
> <hr />
>
> Highest attempt score (Attempt **AttemptNumber**): **PostRubricScore**
>
> <hr />
>
> Total: **PostRubricScore**

**Displayed when:**

| Rubric Type   | Status         | Condition                                         |
| ------------- | -------------- | ------------------------------------------------- |
| `'pass-fail'` | `unableToPass` | `unableToPassResult` = `'$highest_attempt_score'` |

## Set Score For Not Passing

**Text:**

> Attempt Score: **RawAttemptScore**
>
> <hr />
>
> You did not achieve a passing **PassingRange** score within the number of attempts available.
>
> <hr />
>
> Score for not achieving a passing attempt: **UnableToPassResult**
>
> <hr />
>
> Total: **PostRubricScore**

**Displayed when:**

| Rubric Type   | Status         | Condition                     |
| ------------- | -------------- | ----------------------------- |
| `'pass-fail'` | `unableToPass` | `unableToPassResult` = Number |

## Additional Definitions

**PassingRange**:

- IF `passingAttemptScore` is `100`
  - **PassingRange** = "100%"
- ELSE
  - **PassingRange** = "`passingAttemptScore`% or higher"

## Mod Text

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
