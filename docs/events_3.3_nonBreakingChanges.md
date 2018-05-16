---
id: events_3.3_nonBreakingChanges
title: Non Breaking Changes
sidebar_label: Non Breaking Changes
---

## New events

### nav:lock

Navigation was locked

### nav:unlock

Navigation was unlocked

### nav:open

Navigation sidebar was opened

### nav:close

Navigation sidebar was closed

### nav:toggle

Navigation sidebar was toggled (Close/open button clicked on)

### lti:pickerLaunch

The LTI assignment picker was loaded

### visit:create

New visit id is created (based on user id / draft id)

### visit:start

Visit of given id was used

## Updated events

### question:setResponse

`2.0.0` ----> `2.1.0`

### question:hideExplanation

`1.0.0` ----> `1.1.0`

### viewer:open

`1.0.0` ----> `1.1.0`

## Changes by Event:

### viewer:inactive

`2.0.0`

#### Changed

* `lastActiveTime`: This was changed from a unixtimestamp to the `toString` representation of an ECMAScript Date (example: `'2018-05-01T20:07:56.903Z'`)

### viewer:returnFromInactive

`2.0.0`

#### Changed

* `lastActiveTime`: This was changed from a unixtimestamp to the `toString` representation of an ECMAScript Date (example: `'2018-05-01T20:07:56.903Z'`)

### assessment:attemptScored

`2.0.0`

This event has been updated in line with the updates to assessment and attempts with this release.

#### Removed

* `didSendLtiOutcome`: Instead check if `ltiStatus` == `'success'`

#### Added

* `ltiScoreSent`: The LTI score (`null` or a value `0` to `1`) sent to LTI as a replaceResult.
* `ltiStatus`: The status or outcome of sending a score to the LTI (See **LTI Status values** below)
* `ltiGradebookStatus`: See **LTI Gradebook Status values** below
* `ltiErrorDetails`: Error information (may have a value of type object, otherwise expect `null`).
* `assessmentScore`: The assessment score (`null` or a value `0` to `100`) - This is the same value as `scoreDetails.assessmentModdedScore`
* `assessmentScoreId`: The internal ID of the assessment score
* `ltiAssessmentScoreId`: The internal ID of the LTI assessment score
* `scoreDetails` - A more detailed breakdown of the calculation of `assessmentScore`:
  * `status`: One of `'passed'`, `'failed'` or `'unableToPass'`
  * `rewardTotal`: The total amount of mods rewarded (The sum of all `reward` values for each mod with an index in `rewardedMods`)
  * `attemptScore`: The attempt score - A value from `0` to `100`
  * `rewardedMods`: An array of mod indicies from the attempt rubric that were rewarded
  * `attemptNumber`
  * `assessmentScore`: The assessment score with rewards applied \* `assessmentModdedScore`: The final assessment score after rewards are applied

### lti:replaceResult

`2.0.0`

#### Removed

* `score`: Instead check `result.scoreSent`
* `error`: Instead check `result.status` and `result.statusDetails`

#### Changed

* `result`: Changed to contain the following:
  * `status`: The status or outcome of sending a score to the LTI (See **LTI Status values** below)
  * `launchId`: The internal launch id returned
  * `scoreSent`: The LTI score (`null` or a value `0` to `1`) sent to an LTI as a replaceResult.
  * `statusDetails`: Error information (may have a value of type object, otherwise expect `null`).
  * `ltiAssessmentScoreId`: The internal lti assessment score ID
  * `outcomeServiceURL`: This is the same as `body.lis_outcome_service_url`
  * `gradebookStatus`: See **LTI Gradebook Status values** below
  * `dbStatus`: `recorded` if the lti assessment score record was inserted into the database correctly, `error` otherwise

### question:scoreSet

`1.0.0` (renamed from `score:set` `2.0.0`)

#### Added

* `context`: The current "context" when this score was set

### question:scoreClear

(renamed from `score:clear` `2.0.0`)

#### Added

* `context`: The "context" when this score was set previously

### question:hideExplanation

`1.1.0`

#### Added

* `actor`: String representing who caused this event (Can be one of `'viewerClient'` or `'user'`). `user` means the user clicked a button to hide a question explanation. `viewerClient` means that the explanation was hidden automatically or due to another user action (such as the question being "reset" due to the user attempting to retry the question).

### question:setResponse

`2.1.0`

#### Added

* `context`: The current "context" when the question was answered.
* `assessmentId`: If in an assessment attempt this is the assessment id for that assessment (Otherwise not set)
* `attemptId`: If in an assessment attempt this is the attempt id for that attempt (Otherwise not set)

### viewer:open

`1.1.0`

#### Added

* `visitId`: id of the visit to start
