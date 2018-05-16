---
id: caliper_3.3_changes
title: Changes since 3.2
sidebar_label: Changes
---

* "Hid" event for hiding a question explanation has been updated to correctly specify the actor of the event. The known issue from 3.2 that is now partially solved is repeated below:

> "Hid" event _always_ has an actor of **User** but in cases where a question explanation is hidden not due to a direct user interaction (i.e. the question is reset and as a result the explanation is automatically hidden) the **Viewer Client** _should_ be the actor instead.

* Answering assessment questions no longer create two AssessmentItem events. The known issue from 3.2 is repeated below:

> Answering an assessment question will create two AssessmentItem events. One will incorrectly be for the **Practice Question Attempt** and the other will correctly be for an **Attempt**. This is due to both `question:setResponse` and `assessment:setResponse` Obojobo events being fired when answering an assessment question.

The "Hid" event for hiding a question still incorrectly specifies a **User** rather than the **Viewer Client**.

* In the previous Obojobo 3.2 Caliper Events document the definition for the "Hid" event for hiding a question explanation didn't specify the property name which should have been `target`. This has been corrected.

* "GradeEvent" now specifies the related **Assessment** for the assessment **Attempt** being graded as a `target`. Practice attempts do not include this property.

* "GradeEvent" for assessment attempts have new extension properties (listed below). Additionally the documentation did not document these properties - this documentation has been added.

  * attemptCount: Unchanged
  * attemptScore: Unchanged
  * highestAttemptScore: Removed
  * didSendLtiOutcome: Removed
  * assessmentScore: Added
  * ltiScoreSent: Added

* **Picker** IRI added

* **Visit** IRI added

* **SessionEvent** is no longer created when a user opens the viewer - a **ToolUseEvent** is created instead

* **SessionEvent** is now created when a visit is created.

* All _unix timestamp_ properties have been changed to _ECMAScript Date toString_ values.
