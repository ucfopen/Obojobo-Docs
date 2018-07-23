---
title: Threshold Scoring
menus: authors_how_to
---

Assessment Rubric's `'pass-fail'` type can optionally be used to create a threshold type scoring system.

For example, an assessment can require a score of 75% or higher to pass. When the `passingAttemptScore` is reached, the student's score will be adjusted to the `passingResult` value.

In this example, when the student scores below 75%, the score will be adjusted to 0.  When the student's score is 75% or higher, the score wil be adjusted to `100%`.


```xml
<!-- ... -->
    <Assessment id="my-assessment">
      <Page> <!-- ... --> </Page>
      <QuestionBank> <!-- ... --> </QuestionBank>

      <rubric
        type="pass-fail"
        passingAttemptScore="75"
        passingResult="100"
        failingResult="0"
      />

      <!-- ... -->
    </Assessment>
<!-- ... -->
```

This feature can be combined with Score Action Pages to display specialized messages to the student.

```xml
<!-- ... -->
    <Assessment id="my-assessment">
      <Page> <!-- ... --> </Page>
      <QuestionBank> <!-- ... --> </QuestionBank>
      <rubric
        type="pass-fail"
        passingAttemptScore="75"
        passingResult="100"
        failingResult="0"
      />

      <scoreActions>
        <scoreAction for="0">
          <Page> <!-- Failing page --> </Page>
        </scoreAction>
        <scoreAction for="100">
          <Page> <!-- Passing page --> </Page>
        </scoreAction>
      </scoreActions>

    </Assessment>
<!-- ... -->
```
