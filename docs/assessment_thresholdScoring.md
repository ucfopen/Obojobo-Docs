---
id: assessment_thresholdScoring
title: Threshold Scoring
sidebar_label: Threshold Scoring
---

Using a `'pass-fail'` type Assessment Rubric you can establish a pass/fail type scoring system. In this example the Assessment requires that you score an 75% or higher to pass. Passing will result in a `100%` recorded score. Failing will result in a `0%`, requring the student to retake the assessment.

```xml
<ObojoboDraftDoc>
  <Module>
    <Content> <!-- Content goes here --> </Content>
    <Assessment id="my-assessment">
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
        passingResult="100"
        failingResult="0"
      />
      <scoreActions> <!-- Score Actions --></scoreActions>
    </Assessment>
  </Module>
</ObojoboDraftDoc>
```

Since this assessment QuestionBank has four questions then students must answer three out of four questions correct to pass.

You can then use the Score Actions to present a page when the student fails and another when they pass:

```xml
<ObojoboDraftDoc>
  <Module>
    <Content> <!-- Content goes here --> </Content>
    <Assessment id="my-assessment">
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
        passingResult="100"
        failingResult="0"
      />
      <scoreActions>
        <scoreAction for="0">
          <Page> <!-- Failing page here --> </Page>
        </scoreAction>
        <scoreAction for="100">
          <Page> <!-- Passing page here --> </Page>
        </scoreAction>
      </scoreActions>
    </Assessment>
  </Module>
</ObojoboDraftDoc>
```
