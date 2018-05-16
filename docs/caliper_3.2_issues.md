---
id: caliper_3.2_issues
title: Known Issues
sidebar_label: Known Issues
---

* IRIs are not dereferenceable
* Scores are UUIDs and have no IRI
* "Hid" event _always_ has an actor of **User** but in cases where a question explanation is hidden not due to a direct user interaction (i.e. the question is reset and as a result the explanation is automatically hidden) the **Viewer Client** _should_ be the actor instead.
* Answering an assessment question will create two AssessmentItem events. One will incorrectly be for the **Practice Question Attempt** and the other will correctly be for an **Attempt**. This is due to both `question:setResponse` and `assessment:setResponse` Obojobo events being fired when answering an assessment question.
* Some extension properties are *unix timestamp*s but ideally should be **DateTime**s to align with Caliper standards.
* **OboNode**s are of Caliper type **Frame** but could be typed based on their content (for example **Page** or **MediaObject** or **AssignableDigitalResource**)
