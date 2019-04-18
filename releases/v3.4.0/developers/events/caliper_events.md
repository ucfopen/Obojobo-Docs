---
title: Caliper Event Reference
menus: developers_events
---

All events are Caliper version 1.1 events.

## Standard Event Types

All events (unless otherwise noted) contain these properties:

| Property | Value |
|-
| id | Generated UUID
| edApp | [_System IRI_](#caliper-entities-and-iris)
| federatedSession | [_Launch IRI_](#caliper-entities-and-iris)

### NavigationEvent

#### User navigates to another page

Occurs when Viewer Client sends one of the following Obojobo events:

* [`nav:prev`](obojobo_events.html#navprev)
* [`nav:next`](obojobo_events.html#navnext)
* [`nav:goto`](obojobo_events.html#navgoto)
* [`nav:gotoPath`](obojobo_events.html#navgotopath)

#### Properties:

| Property | Value |
|-
| actor | [_User IRI_](#caliper-entities-and-iris)
| action | `NavigatedTo`
| object | [_OboNode IRI_](#caliper-entities-and-iris) the user is navigating to
| referrer | [_OboNode IRI_](#caliper-entities-and-iris) the user is coming from
| extensions.navType | `next`, `prev`, `goto` or `gotoPath`


### ViewEvent

#### User views a question

Occurs when Viewer Client sends a [`question:view`](obojobo_events.html#questionview) Obojobo event.

| Property | Value |
|-
| actor | [_User IRI_](#caliper-entities-and-iris)
| action | `Viewed`
| object | [_OboNode IRI_](#caliper-entities-and-iris) of Question being viewed

#### User views a question explanation

Occurs when Viewer Client sends a [`question:showExplanation`](obojobo_events.html#questionshowexplanation) Obojobo event.

| Property | Value |
|-
| actor | [_User IRI_](#caliper-entities-and-iris)
| action | `Viewed`
| object | [_OboNode IRI_](#caliper-entities-and-iris) of Question being viewed
| target | [_OboNode with Context IRI_](#caliper-entities-and-iris) of the Question explanation being viewed. `:contextName`=`explanation`


### AssessmentItemEvent

User selects a response to a question. Viewer Client sends a [`question:setResponse`](obojobo_events.html#questionsetresponse) event.

#### Answering a Practice Question

| Property | Value |
|-
| actor | [_User IRI_](#caliper-entities-and-iris)
| action | `Completed`
| target | [_OboNode IRI_](#caliper-entities-and-iris) of Question being responded to
| object | [_Practice Question Attempt IRI_](#caliper-entities-and-iris)

#### Answering an Assessment Question

| Property | Value |
|-
| actor | [_User IRI_](#caliper-entities-and-iris)
| action | `Completed`
| target | [_OboNode IRI_](#caliper-entities-and-iris) of Question being responded to
| object | [_Attempt IRI_](#caliper-entities-and-iris)


### GradeEvent

#### A practice question is scored (When Viewer Client sends a [`question:scoreSet`](obojobo_events.html#questionscoreset) Obojobo event).

| Property | Value |
|-
| actor | [_Viewer Client IRI_](#caliper-entities-and-iris)
| action | `Graded`
| object | [_Practice Question Attempt IRI_](#caliper-entities-and-iris)
| generated | [_Practice Question Score_](#practice-question-score)

#### An attempt is scored

| Property | Value |
|-
| actor | [_App Server IRI_](#caliper-entities-and-iris)
| action | `Graded`
| object | [_Attempt IRI_](#caliper-entities-and-iris)
| target | [_Assessment IRI_](#caliper-entities-and-iris)
| generated | [_Assessment Attempt Score_](#assessment-attempt-score)
| extensions.attemptCount | The count or number of the attempt,
| extensions.attemptScore | float (0-100),
| extensions.assessmentScore | null or a float (0-100),
| extensions.ltiScoreSent | null or a float (0-1)


### SessionEvent

#### User starts a new Visit

Occurs when App Server sends a [`visit:start`](obojobo_events.html#visitstart) Obojobo event

| Property | Value |
|-
| actor | [_User IRI_](#caliper-entities-and-iris)
| object | [_System IRI_](#caliper-entities-and-iris)
| target | [_Draft IRI_](#caliper-entities-and-iris)
| action | `LoggedIn`

#### User leaves a Draft

Occurs when Viewer Client sends a [`viewer:close`](obojobo_events.html#viewerclose) Obojobo event

| Property | Value |
|-
| actor | [_User IRI_](#caliper-entities-and-iris)
| object | [_System IRI_](#caliper-entities-and-iris)
| target | [_Draft IRI_](#caliper-entities-and-iris)
| action | `LoggedOut`


### AssessmentEvent

#### User has started an assessment attempt

| Property | Value |
|-
| actor | [_User IRI_](#caliper-entities-and-iris)
| object | [_Assessment IRI_](#caliper-entities-and-iris)
| generated | [_Attempt IRI_](#caliper-entities-and-iris)
| action | `Started`

#### User has submitted an assessment attempt

| Property | Value |
|-
| actor | [_User IRI_](#caliper-entities-and-iris)
| object | [_Assessment IRI_](#caliper-entities-and-iris)
| generated | [_Attempt IRI_](#caliper-entities-and-iris)
| action | `Submitted`


### ToolUseEvent

#### User launches the lti picker

| Property | Value |
|-
| actor | [_User IRI_](#caliper-entities-and-iris)
| object | [_System IRI_](#caliper-entities-and-iris)
| action | `Used`
| target | [_Picker IRI_](#caliper-entities-and-iris)

#### User visits a Draft

Occurs when App Server sends a [`viewer:open`](obojobo_events.html#vieweropen) Obojobo event

| Property | Value |
|-
| actor | [_User IRI_](#caliper-entities-and-iris)
| object | [_System IRI_](#caliper-entities-and-iris)
| action | `Used`
| generated | [_Visit IRI_](#caliper-entities-and-iris)
| extensions.deactivatedVisitId | Id of a Visit that was deactivated by this new visit



## Obojobo Specific Types

Additionally some generic events are created where existing Caliper events aren't appropriate:


### Hid

#### A question is hidden

When Viewer Client sends a [`question:hide`](obojobo_events.html#questionhide) Obojobo event.

| Property | Value |
|-
| actor | [_User IRI_](#caliper-entities-and-iris)
| action | `Hid`
| object | [_OboNode IRI_](#caliper-entities-and-iris) of Question being viewed

#### A question explanation is hidden

When Viewer Client sends a [`question:hideExplanation`](obojobo_events.html#questionhideexplanation) Obojobo event.

| Property | Value |
|-
| actor | [_User IRI_](#caliper-entities-and-iris)
| action | `Hid`
| object | [_OboNode IRI_](#caliper-entities-and-iris) of Question being viewed
| target | [_OboNode with Context IRI_](#caliper-entities-and-iris) of the question explanation being viewed. `:contextName` = `explanation`)

#### Nav menu is hidden

When Viewer Client sends a [`nav:close`](obojobo_events.html#navclose) Obojobo event.

| Property | Value |
|-
| actor | [_User IRI_](#caliper-entities-and-iris) or [_Viewer Client IRI_](#caliper-entities-and-iris)
| action | `Hid`
| object | [_Viewer Client Enity IRI_](#caliper-entities-and-iris) of the NavMenu item being hidden. `:entity` = `nav`


### Showed

#### Nav menu is showed

When Viewer Client sends a [`nav:open`](obojobo_events.html#navopen) Obojobo event.

| Property | Value |
|-
| actor | [_User IRI_](#caliper-entities-and-iris) or [_Viewer Client IRI_](#caliper-entities-and-iris)
| action | `Showed`
| object | [_Viewer Client Enity IRI_](#caliper-entities-and-iris) of the NavMenu item being showed. `:entity` = `nav`


### Toggled

#### Nav menu is showed

When Viewer Client sends a [`nav:toggle`](obojobo_events.html#navtoggle) Obojobo event.

| Property | Value |
|-
| actor | [_User IRI_](#caliper-entities-and-iris) or [_Viewer Client IRI_](#caliper-entities-and-iris)
| action | `Toggled`
| object | [_Viewer Client Enity IRI_](#caliper-entities-and-iris) of the NavMenu item being toggled. `:entity` = `nav`


### Activated

####User is no longer loo Nav menu is unlocked

When Viewer Client sends a [`nav:unlock`](obojobo_events.html#navunlock) Obojobo event.

| Property | Value |
|-
| actor | [_Viewer Client IRI_](#caliper-entities-and-iris)
| action | `Activated`
| object | [_Viewer Client Enity IRI_](#caliper-entities-and-iris) of the NavMenu item being unlocked (:entity = `nav`)


### Deactivated

#### Nav menu is locked

When Viewer Client sends a [`nav:lock`](obojobo_events.html#navlock) Obojobo event.

| Property | Value |
|-
| actor | [_Viewer Client IRI_](#caliper-entities-and-iris)
| action | `Deactivated`
| object | [_Viewer Client Enity IRI_](#caliper-entities-and-iris)  of the NavMenu item being locked. `:entity` = `nav`


### Submitted

#### User checks answer for a practice question

When Viewer Client sends a [`question:checkAnswer`](obojobo_events.html#questioncheckanswer) Obojobo event.

| Property | Value |
|-
| actor | [_User IRI_](#caliper-entities-and-iris)
| action | `Submitted`
| Object | [_Practice Question Attempt IRI_](#caliper-entities-and-iris)


### Reset

#### A practice question is reset

When Viewer Client sends a [`question:scoreClear`](obojobo_events.html#questionscoreclear) Obojobo event

| Property | Value |
|-
| action | `Reset`
| actor | [_App Server IRI_](#caliper-entities-and-iris)
| object | Score URN
| target | [_Practice Question Attempt IRI_](#caliper-entities-and-iris)

#### User is retries a practice question

When Viewer Client sends a [`question:retry`](obojobo_events.html#questionretry) Obojobo event

| Property | Value |
|-
| action | `Reset`
| actor | [_User IRI_](#caliper-entities-and-iris)
| object | [_Draft IRI_](#caliper-entities-and-iris)
| target | [_Practice Question Attempt IRI_](#caliper-entities-and-iris)


### Ab<!--r-->andoned

#### User has gone idle

When Viewer Client sends a [`viewer:inactive`](obojobo_events.html#viewerinactive) Obojobo event.

| Property | Value |
|-
| action | `Abandoned`
| actor | [_User IRI_](#caliper-entities-and-iris)
| object | [_Draft IRI_](#caliper-entities-and-iris)
| extensions.type | `inactive`
| extensions.lastActiveTime | ECMAScript Date toString value
| extensions.inactiveDuration | milliseconds


#### User is no longer looking at the draft

When Viewer Client sends a [`viewer:leave`](obojobo_events.html#viewerleave) Obojobo event.

| Property | Value |
|-
| action | `Abandoned`
| actor | [_User IRI_](#caliper-entities-and-iris)
| object | [_Draft IRI_](#caliper-entities-and-iris)
| extensions.type | `leave`


### Resumed

#### User has returned from idle

When Viewer Client sends a [`viewer:returnFromInactive`](obojobo_events.html#viewerreturnfrominactive) Obojobo event.

| Property | Value |
|-
| action | `Resumed`
| actor | [_User IRI_](#caliper-entities-and-iris)
| object | [_Draft IRI_](#caliper-entities-and-iris)
| extensions.type | `return`
| extensions.relatedEventId | id of [Abandoned Event](#abandoned)

#### User is again looking at the draft

When Viewer Client sends a [`viewer:return`](obojobo_events.html#viewerreturn) Obojobo event

| Property | Value |
|-
| action | `Resumed`
| actor | [_User IRI_](#caliper-entities-and-iris)
| object | [_Draft IRI_](#caliper-entities-and-iris)
| extension.type | `returnFromInactive`
| extension.lastActiveTime | ECMAScript Date toString value
| extension.inactiveDuration | milliseconds
| extension.relatedEventId | id of [Abandoned Event](#abandoned)


### VisitCreate

#### User has loaded a draft page

| Property | Value |
|-
| action | `Created`
| actor | [_User IRI_](#caliper-entities-and-iris)
| object | [_Draft IRI_](#caliper-entities-and-iris)
| generated | [_Visit IRI_](#caliper-entities-and-iris)
| extensions.deactivatedVisitId | id of visit that was deactivated



## Caliper Entities and IRIs

| Entity Name | Type | [IRI](https://en.wikipedia.org/wiki/Internationalized_Resource_Identifier)
|-
| _System IRI_ | [SoftwareApplication](https://github.com/IMSGlobal/caliper-spec/blob/master/caliper-spec.md#softwareApplication) | `/api/system`
| _Viewer Client IRI_ | [SoftwareApplication](https://github.com/IMSGlobal/caliper-spec/blob/master/caliper-spec.md#softwareApplication) | `/api/viewer/client`
| _Viewer Client Enity IRI_ | [Entity](https://github.com/IMSGlobal/caliper-spec/blob/master/caliper-spec.md#entity) | `/api/viewer/client/:entity?draftId=:draftId`
| _App Server IRI_ | [SoftwareApplication](https://github.com/IMSGlobal/caliper-spec/blob/master/caliper-spec.md#softwareApplication) | `/api/server`
| _Session IRI_ | [Session](https://github.com/IMSGlobal/caliper-spec/blob/master/caliper-spec.md#session) | `/api/session/:sessionId`
| _Launch IRI_ | [LtiSession](https://github.com/IMSGlobal/caliper-spec/blob/master/caliper-spec.md#ltiSession) | `/api/launch/:launchId`
| _User IRI_ | [Person](https://github.com/IMSGlobal/caliper-spec/blob/master/caliper-spec.md#person) | `/api/user/:userId`
| _Draft IRI_ | [WebPage](https://github.com/IMSGlobal/caliper-spec/blob/master/caliper-spec.md#webPage) | `/api/draft/:draftId`
| _OboNode IRI_ | [Frame](https://github.com/IMSGlobal/caliper-spec/blob/master/caliper-spec.md#frame) | `/api/draft/:draftId#:nodeId`
| _OboNode with Context IRI_ | [Frame](https://github.com/IMSGlobal/caliper-spec/blob/master/caliper-spec.md#frame) | `/api/draft:draftId#:nodeId?context=:contextName`
| _Practice Question Attempt IRI_ | [Attempt](https://github.com/IMSGlobal/caliper-spec/blob/master/caliper-spec.md#attempt) | `/api/practice/:draftId/:oboNodeId`
| _Assessment IRI_ | [Assessment](https://github.com/IMSGlobal/caliper-spec/blob/master/caliper-spec.md#assessment) | `/api/assessment/:draftId/:assessmentId`
| _Attempt IRI_ | [Attempt](https://github.com/IMSGlobal/caliper-spec/blob/master/caliper-spec.md#attempt) | `/api/attempt/:attemptId`
| _Picker IRI_ | [SoftwareApplication](https://github.com/IMSGlobal/caliper-spec/blob/master/caliper-spec.md#softwareApplication) | `/api/picker`
| _Visit IRI_ | [Entity](https://github.com/IMSGlobal/caliper-spec/blob/master/caliper-spec.md#entity) | `/api/visit/:visitId`



## Caliper Enity Subtypes

According to [Caliper's Entity](https://github.com/IMSGlobal/caliper-spec/blob/master/caliper-spec.md#entity) description:

> A Caliper Entity is a generic type that represents objects that participate in learning-related activities. A variety of Entity subtypes have been defined in order to better describe people, groups, organizations, digital content, courses, software applications, and other objects that constitute the "stuff" of a Caliper Event. Each Entity is provisioned with a modest set of properties or attributes that support discovery and description.

Below are the custom entity subtypes used in Obojobo.


### Practice Question Score:

| Property | Type | Description
|-
| type | [Score](https://github.com/IMSGlobal/caliper-spec/blob/master/caliper-spec.md#c39-score)
| id | UUID | Generated by Viewer Client
| maxScore | decimal | 100
| scoreGiven | decimal | 0-100
| dateCreated | DateTime |
| attempt | [_Practice Question Attempt IRI_](#caliper-entities-and-iris)
| scoredBy | [_Viewer Client_](#caliper-entities-and-iris)


### Assessment Attempt Score:

| Property | Type | Description
|-
| type | [Score](https://github.com/IMSGlobal/caliper-spec/blob/master/caliper-spec.md#c39-score)
| id | UUID | Generated by the app server
| maxScore | decimal | 100
| scoreGiven | decimal | 0-100
| dateCreated | DateTime
| attempt | [_Attempt IRI_](#caliper-entities-and-iris)
| scoredBy | [_App Server IRI_](#caliper-entities-and-iris)
