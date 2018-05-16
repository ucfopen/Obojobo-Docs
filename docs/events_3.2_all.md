---
id: events_3.2_all
title: All Events
sidebar_label: All Events
---

## Viewer

### viewer:open

(1.0.0): User loaded a draft page

### viewer:close

(1.0.0): User closed the window or tab with the draft

### viewer:inactive

(1.0.0): User has not interacted with the page in 10 minutes
_ `lastActiveTime`: Unix timestamp of the last recorded time of interactivity
_ `inactiveDuration`: The amount of time in milliseconds recorded with no measured interactivity (10 minutes)

### viewer:returnFromInactive

(1.0.0): User has interacted with the page after having not interacted with the page for 10 minutes or more
_ `lastActiveTime`: Same value from `viewer:inactive`
_ `inactiveDuration`: The updated amount of time in milliseconds recorded with no measured interactivity \* `relatedEventId`: The id of the corresponding `viewer:inactive` event

### viewer:leave

(1.0.0): User has hidden the draft page, either by changing tabs or minimizing the window (Corresponds to the `visibilitychange` browser event and `document.hidden` browser value).

### viewer:return

(1.0.0): User is again viewing the draft page, either by changing tabs or re-selecting the window. \* `relatedEventId`: The id of the corresponding `viewer:leave` event

## Question

### question:showExplanation

(1.0.0): User has clicked the "Show Explanation" button in a question \* `questionId`

### question:hideExplanation

(1.0.0): Either the user has clicked the "Hide Explanation" button or the explanation has been hidden programmatically (such as from a user retrying a question which resets the question back to its initial state) \* `questionId`

### question:checkAnswser

(1.0.0): User has clicked the "Check Answer" button in a question \* `questionId`

### question:retry

(1.0.0): User has clicked the "Try Again" button to reset a question to try again. \* `questionId`

### question:setResponse

(2.0.0): User has set a response to a question
_ `questionId`
_ `targetId`: The id of the OboNode item that was interacted with \* `response`: The state of the response of the question

### question:view

(1.0.0): User has clicked a question (or an event was fired which showed a question) \* `questionId`

### question:hide

(1.0.0): A question was hidden \* `questionId`

## Assessment

### assessment:setResponse

(2.0.0): User has set a response to a question in an assessment
_ `questionId`
_ `targetId`: The id of the OboNode item that was interacted with
_ `response`: The state of the response of the question
_ `assessmentId`: The id of the current assessment containing this question

### assessment:attemptStart

(1.1.0): Assessment attempt has been started
_ `attemptId`
_ `attemptCount`

### assessment:attemptEnd

(1.1.0): Assessment attempt has ended
_ `attemptId`
_ `attemptCount`

### assessment:attemptScored

(1.1.0): Assessment attempt has been scored
_ `attemptId`
_ `attemptCount`
_ `attemptScore`
_ `highestAttemptScore` \* `didSendLtiOutcome`: `true` if an LTI replaceResult was sent and was successful

## Nav

### nav:gotoPath

(1.0.0): User has clicked on a navigation link to another item in the document.
_ `from`: OboNode id that you are navigating from
_ `to`: OboNode id that you are navigating to

### nav:goto

(1.0.0): User has clicked on a button which fires a `nav:goto` event.
_ `from`: OboNode id that you are navigating from
_ `to`: OboNode id that you are navigating to

### nav:prev

(1.0.0): User has clicked the previous button.
_ `from`: OboNode id that you are navigating from
_ `to`: OboNode id that you are navigating to

### nav:next

(1.0.0): User has clicked the next button.
_ `from`: OboNode id that you are navigating from
_ `to`: OboNode id that you are navigating to

## Score

### score:set

(2.0.0): A question was scored.
_ `id`: A generated id to represent this score
_ `score`: The score value (0-100) \* `itemId`: The id of the item was scored

### score:clear

(2.0.0): The score of an item was reset.
_ `id`: The id of the corresponding `score:set` event
_ `score`: The previous score value (0-100) \* `itemId`: The id of the item that is having its score cleared

## LTI

### lti:launch

(1.0.0): An LTI launch was started \* `launchId`

### lti:replaceResult

(1.0.0): An LTI replaceResult (updating score via LTI) was attempted
_ `launchId`
_ `launchKey`
_ `score`
_ `result`
_ `error`
_ `body.lis_outcome_service_url` \* `body.lis_result_sourcedid`
