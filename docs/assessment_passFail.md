---
id: assessment_passFail
title: Using a pass-fail rubric to withhold a score to an external LMS gradebook
sidebar_label: Pass Fail Scoring
---

You can also use the special `no-score` value to withhold an Assessment Score if the target threshold score is not met. When `no-score` is rewarded the Assessment Score is `null` and no value will be sent via LTI replaceResult. This can be useful to lock access to other modules in an external LMS by requiring a score to be sent to the LMS before the next module is unlocked.

```xml
<ObojoboDraftDoc>
  <Module>
    <Content> <!-- Content goes here --> </Content>
    <Assessment id="my-assessment" attempts="3">
      <Page> <!-- Landing page --> </Page>
      <QuestionBank>
        <Question> <!-- Question 1 --> </Question>
        <Question> <!-- Question 2 --> </Question>
        <Question> <!-- Question 3 --> </Question>
        <Question> <!-- Question 4 --> </Question>
      </QuestionBank>
      <rubric
        type="pass-fail"
        passingAttemptScore="75"
        passingResult="$attempt_score"
        failingResult="no-score"
        unableToPassResult="$highest_attempt_score"
      >
        <mods>
          <mod attemptCondition="1" reward="5" />
        </mods>
      </rubric>
      <scoreActions>
        <scoreAction for="no-score">
          <Page> <!-- Failing page here --> </Page>
        </scoreAction>
        <scoreAction for="[0,75)">
          <Page> <!-- Failing page (once all attempts have been taken) --> </Page>
        </scoreAction>
        <scoreAction for="[75,100]">
          <Page> <!-- Passing page here --> </Page>
        </scoreAction>
      </scoreActions>
    </Assessment>
  </Module>
</ObojoboDraftDoc>
```

In this example any attempt score under 75% will result in the `no-score` score. A scoreAction page is added to handle for that result. The `unableToPassResult` has also been added - This is triggered when the student has used all of their available attempts (three in this example) and did not achieve the required 75%. This `unableToPassResult` will send their highest Assessment Attempt Score - This way we can ensure that an external LMS will still receive a score even though it doesn't meet the `passingAttemptScore`. `passingResult` is now `$attempt_score` which means the value of their passing (75% or higher) Assessment Attempt Score will become the Assessment Score. There must be a scoreAction for every possible Assessment Score result so scoreActions has been updated in this example with several ranges covering all possible Assessment Scores.

A mod is included in the rubric above - Should the student pass (achieve an Assessment Attempt Score of 75% or higher) on the first attempt they will be rewarded 5 additional points. Mods are only applied on passing scores.

There are several options for `'pass-fail'` rubrics. Several more examples are provided later on in this document, and a full specification is listed in [**ObojoboDraft.Sections.Assessment**](obonode_assessment.md).
