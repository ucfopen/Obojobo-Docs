---
id: assessment_explanation
title: How Assessment Works
sidebar_label: How Assessment Works
---

1.  The student clicks on a button or interacts with a Obojobo Draft Document which fires an `assessment:startAttempt` action.
1.  The student is presented with a list of questions, chosen by the **Assessment Attempt Quiz Question Selection Algorithm**.
1.  The student clicks on the Assessment Attempt submit button which ends the attempt.
1.  The Assessment Attempt Score is calculated and recorded.
1.  The Assessment Score and Assessment Status is calculated from the Assessment Rubric and is recorded. The Recorded Score is the current highest Assessment Score.
1.  If this is a non-preview LTI visit and an outcome service is available and the Recorded Score is not `no-score` then send the Recorded Score via LTI replaceResult to the given outcome service.
1.  Display the Assessment Attempt Results Dialog.
1.  Display the matching Score Action page for the current Recorded Score.
1.  If review is `'always'` or review is `'no-attempts-remaining'` and no more attempts remain then show the Full Review. Otherwise show Partial Review.
