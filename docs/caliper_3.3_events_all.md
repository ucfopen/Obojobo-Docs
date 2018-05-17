---
id: caliper_3.3_events_all
title: All Events
sidebar_label: All Events
---

All events (unless otherwise noted) contain these properties:

* id: **Generated UUID**
* edApp: **System** (`/api/system`)
* federatedSession: **Launch** (`/api/launch/:launchId`)
* extensions:
  * `previewMode`: True if this is a preview session, false otherwise

In addition, the following events contain additional properties:

## NavigationEvent

* Use cases:
  1.  **User** navigates to another page (When **Viewer Client** sends one of the following Obojobo events):
  * [`nav:prev`](events_3.3_all.md#nav-prev)
  * [`nav:next`](events_3.3_all.md#nav-next)
  * [`nav:goto`](events_3.3_all.md#nav-goto)
  * [`nav:gotoPath`](events_3.3_all.md#nav-gotopath)
* Properties:

  * actor: **User** (`/api/user/:userId`)
  * action: **NavigatedTo**
  * object: **OboNode** the user is navigating to (`/api/draft/:draftId#:nodeId`)
  * referrer: **OboNode** the user is coming from (`/api/draft/:draftId#:nodeId`)
  * extensions:
    * `navType`: One of `"next"`, `"prev"`, `"goto"` or `"gotoPath"`

## ViewEvent

* Use cases:
  1.  **User** views a question (When **Viewer Client** sends a [`question:view`](events_3.3_all.md#question-view) Obojobo event).
  2.  **User** views a question explanation (When **Viewer Client** sends a [`question:showExplanation`](events_3.3_all.md#question-showexplanation) Obojobo event).
* Properties:
  * actor: **User** (`/api/user/:userId`)
  * action: **Viewed**
  * object: Question **OboNode** being viewed (`/api/draft/:draftId#:nodeId`)
* Additional properties for when a user views a question explanation:
  * target: Question **OboNode with Context** - The question explanation being viewed (`/api/draft/:draftId#:nodeId?context=explanation`)

## AssessmentItemEvent

* Use cases:
  1.  **User** selects a response to a question (When **Viewer Client** sends a [`question:setResponse`](events_3.3_all.md#question-setresponse) event).
* Properties:
  * actor: **User** (`/api/user/:userId`)
  * action: **Completed**
  * target: Question **OboNode** being responded to (`/api/draft/:draftId#:nodeId`)
* Additional properties for answering a practice question
  * object: **Practice Question Attempt** (`/api/practice/:draftId/:oboNodeId`)
* Additional properties for answering an assessment question
  * object: **Attempt** (`/api/attempt/:attemptId`)

## GradeEvent

* Use cases:
  1.  A practice question is scored (When **Viewer Client** sends a [`question:scoreSet`](events_3.3_all.md#question-scoreset) Obojobo event).
  2.  An attempt is scored
* Properties for when a practice question is scored:
  * actor: **Viewer Client** (`/api/viewer/client`)
  * action: **Graded**
  * object: **Practice Question Attempt** (`/api/practice/:draftId/:oboNodeId`)
  * generated: **Practice Question Score**
* Properties for when an attempt is scored:
  * actor: **App Server** (`/api/server`)
  * action: **Graded**
  * object: **Attempt** (`/api/attempt/:attemptId`)
  * target: **Assessment** (`/api/assessment/:draftId/:assessmentId`)
  * generated: **Assessment Attempt Score**
  * extensions:
    * attemptCount: The count or number of the attempt,
    * attemptScore: _float_ (0-100),
    * assessmentScore: _null_ or a _float_ (0-100),
    * ltiScoreSent: _null_ or a _float_ (0-1)

## SessionEvent

* Use cases:
  1.  **User** starts a new Visit (When **App Server** sends a [`visit:start`](events_3.3_all.md#visit-start) Obojobo event)
  2.  **User** leaves a Draft (When **Viewer Client** sends a [`viewer:close`](events_3.3_all.md#viewer-close) Obojobo event)
* Properties:
  * actor: **User** (`/api/user/:userId`)
  * object: **System** (`/api/system`)
  * target: **Draft** (`/api/draft/:draftId`)
* Additional properties when a user visits a draft:
  * action: **LoggedIn**
* Additional properties when a user leaves a draft:
  * action: **LoggedOut**

## AssessmentEvent

* Use cases:
  1.  **User** has started an assessment attempt
  2.  **User** has submitted an assessment attempt
* Properties:
  * actor: **User** (`/api/user/:userId`)
  * object: **Assessment** (`/api/assessment/:draftId/:assessmentId`)
  * generated: **Attempt** (`/api/attempt/:attemptId`)
* Additional properties when a user starts an attempt
  * action: **Started**
* Additional properties when a user submits an attempt
  * action: **Submitted**

## ToolUseEvent

* Use cases:
  1.  **User** launches the lti picker
  2.  **User** visits a Draft (When App Server sends a [`viewer:open`](events_3.3_all.md#viewer-open) Obojobo event)
* Properties:
  * actor: **User** (`/api/user/:userId`)
  * action: **Used**
  * object: **System** (`/api/system`)
* Additional properties when lti picker launched
  * target: **Picker** (`/api/picker`)
* Additional properties when viewer opened
  * generated: **VisitId** (`/api/visit/:visitId`)
  * extensions:
    * deactivatedVisitId: The visit id that was deactivated when this visit was generated

Additionally some generic events are created where existing Caliper events aren't appropriate:

## "Hid" Event

* Use cases:
  1.  A question is hidden (When **Viewer Client** sends a [`question:hide`](events_3.3_all.md#question-hide) Obojobo event)
  2.  A question explanation is hidden (When **Viewer Client** sends a [`question:hideExplanation`](events_3.3_all.md#question-hideexplanation) Obojobo event)
  3.  Nav menu is hidden (When **Viewer Client** sends a [`nav:close`](events_3.3_all.md#nav-close) Obojobo event)
* Properties for when a question is hidden:
  * actor: **User** (`/api/user/:userId`)
  * action: **Hid**
  * object: Question **OboNode** being viewed (`/api/draft/:draftId#:nodeId`)
* Properties for when a question explanation is hidden:
  * actor: **User** (`/api/user/:userId`) or **Viewer Client** (`/api/viewer/client`)
  * action: **Hid**
  * object: Question **OboNode** being viewed (`/api/draft/:draftId#:nodeId`)
  * target: question **OboNode with Context** - The question explanation being viewed (`/api/draft/:draftId#:nodeId?context=explanation`)
* Properties for when nav menu hidden:
  * actor: **User** (`/api/user/:userId`) or **Viewer Client** (`/api/viewer/client`)
  * action: **Hid**
  * object: NavMenu **OboNode** being hidden (`/api/viewer/client/nav?draftId=draftId`)

## "Showed" Event

* Use cases:
  1.  Nav menu is showed (When **Viewer Client** sends a [`nav:open`](events_3.3_all.md#nav-open) Obojobo event)
* Properties for when nav menu showed:
  * actor: **User** (`/api/user/:userId`) or **Viewer Client** (`/api/viewer/client`)
  * action: **Showed**
  * object: NavMenu **OboNode** being showed (`/api/viewer/client/nav?draftId=draftId`)

## "Toggled" Event

* Use cases:
  1.  Nav menu is showed (When **Viewer Client** sends a [`nav:toggle`](events_3.3_all.md#nav-toggle) Obojobo event)
* Properties for when nav menu toggled:
  * actor: **User** (`/api/user/:userId`) or **Viewer Client** (`/api/viewer/client`)
  * action: **Toggled**
  * object: NavMenu **OboNode** being toggled (`/api/viewer/client/nav?draftId=draftId`)

## "Activated" Event

* Use cases:
  1.  Nav menu is unlocked (When **Viewer Client** sends a [`nav:unlock`](events_3.3_all.md#nav-unlock) Obojobo event)
* Properties for when nav menu unlocked:
  * actor: **Viewer Client** (`/api/viewer/client`)
  * action: **Activated**
  * object: NavMenu **OboNode** being unlocked (`/api/viewer/client/nav?draftId=draftId`)

## "Deactivated" Event

* Use cases:
  1.  Nav menu is locked (When **Viewer Client** sends a [`nav:lock`](events_3.3_all.md#nav-lock) Obojobo event)
* Properties for when nav menu locked:
  * actor: **Viewer Client** (`/api/viewer/client`)
  * action: **Deactivated**
  * object: NavMenu **OboNode** being locked (`/api/viewer/client/nav?draftId=draftId`)

## "Submitted" Event

* Use cases:
  1.  **User** checks their answer for a practice question (When **Viewer Client** sends a [`question:checkAnswer`](events_3.3_all.md#question-checkanswer) Obojobo event)
* Properties:
  * actor: **User** (`/api/user/:userId`)
  * action: **Submitted**
  * Object: **Practice Question Attempt** (`/api/practice/:draftId/:oboNodeId`)

## "Reset" Event

* Use cases:
  1.  A practice question is reset (When **Viewer Client** sends a [`question:scoreClear`](events_3.3_all.md#question-scoreclear) Obojobo event)
  2.  **User** is retrying a practice question (When **Viewer Client** sends a [`question:retry`](events_3.3_all.md#question-retry) Obojobo event)
* Properties:
  * action: **Reset**
* Additional properties when a practice question is reset
  * actor: **Server App** (`/api/server`)
  * object: Score URN
  * target: **Practice Question Attempt** (`/api/practice/:draftId/:oboNodeId`)
* Additional properties when a user is retrying a practice question
  * actor: **User** (`/api/user/:userId`)
  * object: **Draft** (`/api/draft/:draftId`)
  * target: **Practice Question Attempt** (`/api/practice/:draftId/:oboNodeId`)

## "Abandoned" Event

* Use cases:
  1.  **User** has gone idle (When **Viewer Client** sends a [`viewer:inactive`](events_3.3_all.md#viewer-inactive) Obojobo event)
  2.  **User** is no longer looking at the draft (When **Viewer Client** sends a [`viewer:leave`](events_3.3_all.md#viewer-leave) Obojobo event)
* Properties:
  * action: **Abandoned**
  * actor: **User** (`/api/user/:userId`)
  * object: **Draft** (`/api/draft/:draftId`)
* Additional properties when user goes idle
  * extensions:
    * type: `'inactive'`
    * lastActiveTime: _ECMAScript Date toString value_
    * inactiveDuration: _milliseconds_
* Additional properties when user is no longer looking at the draft
  * extensions:
    * type: `'leave'`

## "Resumed" Event

* Use cases:
  1.  **User** has returned from idle (When **Viewer Client** sends a [`viewer:returnFromInactive`](events_3.3_all.md#viewer-returnfrominactive) Obojobo event)
  2.  **User** is again looking at the draft (When **Viewer Client** sends a [`viewer:return`](events_3.3_all.md#viewer-return) Obojobo event)
* Properties:
  * action: **Resumed**
  * actor: **User** (`/api/user/:userId`)
  * object: **Draft** (`/api/draft/:draftId`)
* Additional properties when a user has returned from idle
  * extensions:
    * type: `'return'`
    * relatedEventId: **"Abandoned" Event UUID**
* Additional properties when a user is again looking at the draft
  * extensions:
    * type: `'returnFromInactive'`
    * lastActiveTime: _ECMAScript Date toString value_
    * inactiveDuration: _milliseconds_
    * relatedEventId: **"Abandoned" Event UUID**

## "VisitCreate" Event

* Use cases:
  1.  **User** has loaded a draft page
* Properties:
  * action: **Created**
  * actor: **User** (`/api/user/:userId`)
  * object: **Draft** (`/api/draft/:draftId`)
  * generated: **Visit** (`/api/visit/:visit`)
  * extensions:
    * deactivatedVisitId: `id of visit that was deactivated`
