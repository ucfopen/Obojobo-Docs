---
id: events_3.3_all
title: All Events
sidebar_label: All Events
---

## Visit

### visit:create

* **Version**: 1.0.0
* **Triggered by**: User
* **Outcome**: New visit id (based on user id/draft id) is created for User and set active. If applicable, old visit id (based on same user id/ draft id) is set deactivated.
* **Properties**:
  * `visitId`: id of the visit created
  * `deactivatedVisitId`: id of the deactivated visit

### visit:start

* **Version**: 1.0.0
* **Triggered by**: User
* **Outcome**: User loaded a draft page
* **Properties**:
  * `visitId`: id of the visit to start

## Viewer

### viewer:open

* **Version**: 1.1.0
* **Triggered by**: User
* **Outcome**: User loaded a draft page
* **Properties**:
  * `visitId`: id of the visit User/draft

### viewer:close

* **Version**: 1.0.0
* **Triggered by**: User
* **Outcome**: User closed the window or tab with the draft

### viewer:inactive

* **Version**: 2.0.0
* **Triggered by**: ViewerClient
* **Outcome**: User has not interacted with the page in 10 minutes
* **Properties**:
  * `lastActiveTime`: ECMAScript Date string representation of the last recorded time of interactivity
  * `inactiveDuration`: The amount of time in milliseconds recorded with no measured interactivity (10 minutes)

### viewer:inactive

* **Version**: 2.0.0
* **Triggered by**: ViewerClient
* **Outcome**: User has interacted with the page after having not interacted with the page for 10 minutes or more
* **Properties**:
  * `lastActiveTime`: Same value from `viewer:inactive`
  * `inactiveDuration`: The updated amount of time in milliseconds recorded with no measured interactivity \* `relatedEventId`: The id of the corresponding `viewer:inactive` event

### viewer:leave

* **Version**: 1.0.0
* **Triggered by**: User
* **Outcome**: User has hidden the draft page, either by changing tabs or minimizing the window (Corresponds to the `visibilitychange` browser event and `document.hidden` browser value)

### viewer:return

* **Version**: 1.0.0
* **Triggered by**: User
* **Outcome**: User is again viewing the draft page, either by changing tabs or re-selecting the window.
* **Properties**:
  * `relatedEventId`: The id of the corresponding
  * `viewer:leave` event

## Question

### question:showExplanation

* **Version**: 1.0.0
* **Triggered by**: User
* **Outcome**: User is viewing the explanation (solution) of a question
* **Properties**:
  * `questionId`

### question:hideExplanation

* **Version**: 1.1.0
* **Triggered by**: User or ViewerClient
* **Outcome**: User or ViewerClient has hidden a question explanation
* **Properties**:
  * `questionId`
  * `actor`: Either `'user'` or `'viewerClient'`

### question:checkAnswer

* **Version**: 1.0.0
* **Triggered by**: User
* **Outcome**: User is checking their answer to a question
* **Properties**:
  * `questionId`

### question:retry

* **Version**: 1.0.0
* **Triggered by**: User
* **Outcome**: User is reattempting a question (All current responses and scores removed)
* **Properties**:
  * `questionId`

### question:setResponse

* **Version**: 2.1.0
* **Triggered by**: User
* **Outcome**: User has set a response to a question
* **Properties**:
  * `questionId`:
  * `targetId`: The id of the OboNode item that was interacted with
  * `response`: The state of the response of the question
  * `context`
  * `assessmentId`
  * `attemptId`

### question:view

* **Version**: 1.0.0
* **Triggered by**: User
* **Outcome**: User has activated a question and is now viewing it
* **Properties**:
  * `questionId`

### question:hide

* **Version**: 1.0.0
* **Triggered by**: ViewerClient
* **Outcome**: A question has been hidden
* **Properties**:
  * `questionId`

### assessment:attemptStart

* **Version**: 1.1.0
* **Triggered by**: User
* **Outcome**: Assessment attempt has started
* **Properties**:
  * `attemptId`
  * `attemptCount`

### assessment:attemptEnd

* **Version**: 1.1.0
* **Triggered by**: User
* **Outcome**: Assessment attempt has ended
* **Properties**:
  * `attemptId`
  * `attemptCount`

### assessment:attemptScored

* **Version**: 2.0.0
* **Triggered by**: Server
* **Outcome**: Assessment attempt has been scored
* **Properties**:
  * `attemptId`
  * `attemptCount`
  * `attemptScore`
  * `assessmentScore`: `null` or a number `0` to `100` (This value is equal to `scoreDetails.assessmentModdedScore`)
  * `ltiScoreSent`: `null` or a number `0` to `1` (This value was sent via an LTI replaceResult to a tool consumer)
  * `ltiStatus`: One of **LTI Status values** (see below)
  * `ltiGradebookStatus`: One of **LTI Gradebook Status values** (see below)
  * `ltiErrorDetails`: Error information (may have a value of type object, otherwise expect `null`)
  * `assessmentScoreId`: Internal id of this assessment score
  * `ltiAssessmentScoreId`: Internal id of this LTI assessment score
  * `scoreDetails`:
  * `status`: One of `'passed'`, `'failed'` or `'unableToPass'`
  * `rewardTotal`: The total amount of mods rewarded (The sum of all `reward` values for each mod with an index in `rewardedMods`)
  * `attemptScore`: The attempt score - A value from `0` to `100`
  * `rewardedMods`: An array of mod indicies from the attempt rubric that were rewarded
  * `attemptNumber`
  * `assessmentScore`: The assessment score with rewards applied
  * `assessmentModdedScore`: The final assessment score after rewards are applied

### question:scoreSet

* **Version**: 1.0.0
* **Triggered by**: ViewerClient
* **Outcome**: A non-assessment question has been scored based on the responses for that question
* **Properties**:
  * `id`: A generated UUID to represent this score
  * `score`: The score value (0-100)
  * `itemId`: The id of the item that was scored
  * `context`: The context when this score was set

### question:scoreClear

* **Version**: 1.0.0
* **Triggered by**: ViewerClient
* **Outcome**: The score for a question was reset
* **Properties**:
  * `id`: A generated UUID to represent this score
  * `score`: The score value (0-100)
  * `itemId`: The id of the item that was scored
  * `context`: The context when this score was set

## Navigation

### nav:gotoPath

* **Version**: 1.0.0
* **Triggered by**: User
* **Outcome**: User has clicked on a navigation link or button and has moved to another item in the document
* **Properties**:
  * `from`: OboNode id that user is navigating from
  * `to`: OboNode id that user is navigating to

### nav:goto

* **Version**: 1.0.0
* **Triggered by**: User
* **Outcome**: User has clicked a button which fires a `nav:goto` event and has now moved to another item in the document
* **Properties**:
  * `from`: OboNode id that user is navigating from
  * `to`: OboNode id that user is navigating to

### nav:prev

* **Version**: 1.0.0
* **Triggered by**: User
* **Outcome**: User has clicked on the 'previous' button and has moved back one step in the document
* **Properties**:
  * `from`: OboNode id that user is navigating from
  * `to`: OboNode id that user is navigating to

### nav:next

* **Version**: 1.0.0
* **Triggered by**: User
* **Outcome**: User has clicked on the 'next' button and has moved ahead one step in the document
* **Properties**:
  * `from`: OboNode id that user is navigating from
  * `to`: OboNode id that user is navigating to

### nav:lock

* **Version**: 1.0.0
* **Triggered by**: ViewerClient
* **Outcome**: The navigation has been locked

### nav:unlock

* **Version**: 1.0.0
* **Triggered by**: ViewerClient
* **Outcome**: The navigation has been unlocked

### nav:close

* **Version**: 1.0.0
* **Triggered by**: User
* **Outcome**: The navigation sidebar has been closed

### nav:open

* **Version**: 1.0.0
* **Triggered by**: User
* **Outcome**: The navigation sidebar has been opened

### nav:toggle

* **Version**: 1.0.0
* **Triggered by**: User
* **Outcome**: The navigation sidebar has been changed from open to closed or closed to open
* **Properties**:
  * `open`: `true` if navigation sidebar was changed to open, `false` if sidebar was changed to closed.

## LTI

### lti:launch

* **Version**: 1.0.0
* **Triggered by**: Server
* **Outcome**: An LTI launch was started successfully
* **Properties**:
  * `launchId`

### lti:replaceResult

* **Version**: 2.0.0
* **Triggered by**: Server
* **Outcome**: An LTI replaceResult (updating score via LTI) was attempted
* **Properties**:
  * `launchId`
  * `launchKey`
  * `body`:
  * `lis_outcome_service_url`
  * `lis_result_sourcedid`
  * `result`:
  * `status`: The status or outcome of sending a score to the LTI (See **LTI Status values** below)
  * `launchId`: The internal launch id returned
  * `scoreSent`: The LTI score (`null` or a value `0` to `1`) sent to an LTI as a replaceResult.
  * `statusDetails`: Error information (may have a value of type object, otherwise expect `null`).
  * `ltiAssessmentScoreId`: The internal lti assessment score ID
  * `outcomeServiceURL`: This is the same as `body.lis_outcome_service_url`
  * `gradebookStatus`: See **LTI Gradebook Status values** below
  * `dbStatus`: `recorded` if the lti assessment score record was inserted into the database correctly, `error` otherwise

### lti:pickerLaunch

* **Version**: 1.0.0
* **Triggered by**: Server
* **Outcome**: The LTI picker was launched
* **Properties**:
  * `ltiBody`
  * `ltiConsumerKey`
