---
title: Obojobo Event Reference
menus: developers_events
---

{::comment}
Writing this document:

This is for people who don't have the ability/time to glean this info directly from the source code.
They have a data dump csv full of events they are trying to make sense of in order to build a report.
{:/comment}

Obojobo Events are used to announce and record actions.
They may be initiated on the server or client, and can be listened to in order to trigger other actions.
In most cases, these events are useful for research data analysis.  In which case, researchers are likely to receive a csv full of events. This document outlines what those events mean.

Obojobo Event exports will have the following columns:

| Column | Description |
|-
| created_at | DateTime when the event was written to the database
| actor_time | DateTime when the event was initially created. This can differ from created_at when the event is initialized on the client.
| actor | Which user's session was active during this event
| action | Name of the event type (eg: `visit:create` or `nav:hide`)
| ip | IP address of the user's client.
| draft_id | Draft Id of the document related to this event.
| draft_content_id | Draft Content Id of the specific version the document content this event is related to.
| version_number | [Semantic Version](https://semver.org/) of the event itself. Properties can change as Obojobo changes.
| payload | JSON data of the actual event properties (shown in the rest of this document)

> Note: Obojobo Events cannot be used on the client in {{ 'trigger' | obo_node }} and {{ 'action' | obo_node }} nodes.

## Visit

### *visit:create*

Occurs when a new visit is created. The visit is not considered started until the `visit:start` Event occurs.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| visitId | id of the visit created
| deactivatedVisitId | id of the deactivated visit


### *visit:start*

Occurs after a visit is created, marking the visit as actually starting.  Not all visits that are created are started.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| visitId | id of the visit to start


## Viewer

### *viewer:open*

Occurs when the user has opened a document in the Obojobo Veiwer.

<dl>
	<dt>Version</dt>
	<dd>1.1.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| visitId | id of the visit User/draft

### *viewer:close*

Occurs when the user closed the browser window containing the Obojobo Viewer.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

None

### *viewer:inactive*

Occurs when the user has not interacted with the page in the last 10 minutes.

<dl>
	<dt>Version</dt>
	<dd>2.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| lastActiveTime | ECMAScript Date string representation of the last recorded time of interactivity
| inactiveDuration | The amount of time in milliseconds recorded with no measured interactivity (10 minutes)


### *viewer:returnFromInactive*

Occurs when the user has interacted with the page after having not interacted with the page for 10 minutes or more.

<dl>
	<dt>Version</dt>
	<dd>2.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| lastActiveTime | ECMAScript Date string representation of the last recorded time of interactivity
| inactiveDuration | The updated amount of time in milliseconds recorded with no measured interactivity
| relatedEventId | The id of the corresponding `viewer:inactive` event


### *viewer:leave*

Occurs when the user has hidden the draft page, either by changing tabs or minimizing the window. Corresponds to the `visibilitychange` browser event and `document.hidden` browser value.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

None


### *viewer:return*

Occurs when the user is again viewing the draft page, either by changing tabs or re-selecting the window.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| relatedEventId | The id of the corresponding `viewer:leave` event


## Question

### *question:showExplanation*

Occurs when the user is viewing the explanation (aka. solution) of a question.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| questionId | The id of the corresponding Question


### *question:hideExplanation*

Occurs when the user or ViewerClient has hidden a question explanation.

<dl>
	<dt>Version</dt>
	<dd>1.1.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| questionId | The id of the corresponding Question
| actor | Either `'user'` or `'viewerClient'`


### *question:checkAnswer*

Occurs when the user is checking their answer to a question.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| questionId | The id of the corresponding Question


### *question:retry*

Occurs when the user is reattempting a question. Previous responses and scores are hidden.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| questionId | The id of the corresponding Question


### *question:setResponse*

Occurs when the user has selected a response to a question.

<dl>
	<dt>Version</dt>
	<dd>2.1.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| questionId | The id of the corresponding Question
| targetId | The id of the OboNode item that was interacted with
| response | The state of the response of the question
| context |
| assessmentId |
| attemptId |


### *question:view*

Occurs when the user has activated a question, making it visible.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| questionId | The id of the corresponding Question


### *question:hide*

Occurs when a question has been hidden.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| questionId | The id of the corresponding Question


### *question:attemptStart*

Occurs when an assessment attempt has started.

<dl>
	<dt>Version</dt>
	<dd>1.1.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| attemptId |
| attemptCount |


### *question:attemptEnd*

Occurs when an assessment attempt has ended.

<dl>
	<dt>Version</dt>
	<dd>1.1.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| attemptId |
| attemptCount |


### *question:attemptScored*

Occurs when an assessment attempt has been scored.

<dl>
	<dt>Version</dt>
	<dd>2.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| attemptId |
| attemptCount |
| attemptScore |
| assessmentScore | `null` or a number `0` to `100` (This value is equal to `scoreDetails.assessmentModdedScore`)
| ltiScoreSent | `null` or a number `0` to `1` (This value was sent via an LTI replaceResult to a tool consumer)
| ltiStatus | One of **LTI Status values** (see below)
| ltiGradebookStatus | One of **LTI Gradebook Status values** (see below)
| ltiErrorDetails | Error information (may have a value of type object, otherwise expect `null`)
| assessmentScoreId | Internal id of this assessment score
| ltiAssessmentScoreId | Internal id of this LTI assessment score
| scoreDetails.status | One of `'passed'`, `'failed'` or `'unableToPass'`
| scoreDetails.rewardTotal | The total amount of mods rewarded (The sum of all `reward` values for each mod with an index in `rewardedMods`)
| scoreDetails.attemptScore | The attempt score - A value from `0` to `100`
| scoreDetails.rewardedMods | An array of mod indicies from the attempt rubric that were rewarded
| scoreDetails.attemptNumber |
| scoreDetails.assessmentScore | The assessment score with rewards applied
| scoreDetails.assessmentModdedScore | The final assessment score after rewards are applied


### *question:scoreClear*

Occurs when the score for a question was reset.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| id | A generated UUID to represent this score
| score | The score value (0-100)
| itemId | The id of the item that was scored
| context | The context when this score was set


## Navigation

### *nav:gotoPath*

Occurs when the user has clicked on a navigation link or button and has moved to another area in the document.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| from | OboNode id that user is navigating from
| to | OboNode id that user is navigating to


### *nav:goto*

Occurs when the user has clicked a button which fires a `nav:goto` event and has now moved to another area in the document

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| from | OboNode id that user is navigating from
| to | OboNode id that user is navigating to


### *nav:prev*

Occurs when the user has clicked on the 'previous' button and has moved back one step in the document's navigation.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| from | OboNode id that user is navigating from
| to | OboNode id that user is navigating to


### *nav:next*

Occurs when the user has clicked on the 'next' button and has moved ahead one step in the document's navigation.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| from | OboNode id that user is navigating from
| to | OboNode id that user is navigating to


### *nav:lock*

Occurs when the navigation has been locked.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

None


### *nav:unlock*

Occurs when the navigation has been unlocked.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

None


### *nav:close*

Occurs when the navigation sidebar has been closed.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

None


### *nav:open*

Occurs when the navigation sidebar has been opened.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

None


### *nav:toggle*

Occurs when the navigation sidebar has been changed from open to closed or closed to open.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| open | `true` if navigation sidebar was changed to open, `false` if sidebar was changed to closed.


## LTI

### *lti:launch*

Occurs when an LTI launch was started successfully.

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| launchId |


### *lti:replaceResult*

Occurs when an LTI [replaceResult](https://www.imsglobal.org/specs/ltiomv1p0/specification#toc-4) message is sent to alter the user's score in LMS (aka Tool Consumer). This event is created regardless of the ReplaceResult being successful.

<dl>
	<dt>Version</dt>
	<dd>2.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| launchId |
| launchKey |
| body.lis_outcome_service_url |
| body.lis_result_sourcedid |
| result.status | The status or outcome of sending a score to the LTI (See **LTI Status values** below)
| result.launchId | The internal launch id returned
| result.scoreSent | The LTI score (`null` or a value `0` to `1`) sent to an LTI as a replaceResult.
| result.statusDetails | Error information (may have a value of type object, otherwise expect `null`).
| result.ltiAssessmentScoreId | The internal lti assessment score ID
| result.outcomeServiceURL | This is the same as `body.lis_outcome_service_url`
| result.gradebookStatus | See **LTI Gradebook Status values** below


### *lti:pickerLaunch*

Occurs when the LTI document picker was launched from a LMS (Tool Consumer).

<dl>
	<dt>Version</dt>
	<dd>1.0.0</dd>
</dl>

#### Properties

| Property | Description |
|-
| ltiBody |
| ltiConsumerKey |

## Additional Information

### LTI Status values:

| Description | Description |
|-
| success | The LTI replaceResult was sent successfully
| not_attempted_no_outcome_service_for_launch | The LTI did not have an outcome service so no replaceResult was attempted
| not_attempted_score_is_null | The assessment score was null so no replaceResult was attempted
| not_attempted_preview_mode | User is in preview mode so no replaceResult was attempted
| error_replace_result_failed | Fatal error - The replaceResult failed
| error_no_assessment_score_found | Fatal error - Obojobo was unable to find the assessment score to send.
| error_no_secret_for_key | Fatal error - There was no secret found for the given key
| error_no_launch_found | Fatal error - Obojobo was unable to find the LTI launch details
| error_launch_expired | Fatal error - The LTI launch has expired
| error_score_is_invalid | Fatal error - The score to be sent was not a 0-1 value.
| error_unexpected | Fatal error - An unexpected error occurred.

### LTI Gradebook Status values:

| Description | Description |
|-
| ok_null_score_not_sent | The assessment score was null so no score was sent
| ok_no_outcome_service | The LTI did not have an outcome service so no replaceResult was attempted
| ok_gradebook_matches_assessment_score | Either the new assessment score was sent successfully or the assessment score being sent matches the last assessment score that was sent
| ok_preview_mode | User is in preview mode so no replaceResult was attempted
| error_newer_assessment_score_unsent | A newer score was not sent successfully so the LTI tool consumer does not have the latest score.
| error_state_unknown | Obojobo was not able to determine the history of what was sent to the LTI tool consumer so Obojobo can't determine if the tool consumer should be sent a score or if it has the latest score.
| error_invalid | This is an unexpected state. This state is a fatal error.
