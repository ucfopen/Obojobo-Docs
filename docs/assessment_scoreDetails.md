---
id: assessment_scoreDetails
title: Assessment Score Details properties
sidebar_label: Assessment Score Details properties
---

These properties are stored in the `assessment_scores` table (in the `score_details` column) as well as in an `assessment:attemptScored` event:

* `attemptNumber`: This is the attempt number that is being used in calculating the Assessment Score. If `status` is `'unableToPass'` and `unableToPassResult` is `'$highest_attempt_score'` then this number will be the earliest highest attempt score, otherwise this will be equal to the number of attempt scores when this value was calculated
* `attemptScore`: The Assessment Attempt Score (a number 0-100)
* `assessmentScore`: This is the unmodified Assessment Score (a number 0-100 or `null`)
* `rewardedMods`: An array of mod indicies that were rewarded
* `rewardTotal`: The total of all mod rewards that were rewarded (a number)
* `assessmentModdedScore`: The Assessment Score after mods have been applied (a number 0-100 or `null`). Note that mods cannot extend a score past 100 and cannot decrease a score below 0.
* `status`: Assessment Status (`'passed'` | `'failed'` | `'unableToPass'`)
