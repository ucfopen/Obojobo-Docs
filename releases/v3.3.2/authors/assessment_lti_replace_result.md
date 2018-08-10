---
title: LTI Score Passback
menus: authors_assessments_how_to
---

## When are Scores Sent

Assessment attempt score will be sent to the LMS (via LTI's [`replaceResult`](https://www.imsglobal.org/specs/ltiomv1p0/specification#toc-4)) if the following conditions are met:

1.  Not in preview mode
2.  The module was launched from an LMS using LTI
3.  The LTI launch included a [`lis_outcome_service_url`](https://www.imsglobal.org/specs/ltiomv1p0/specification#toc-2) parameter
4.  [Overall Assessment Score](assessment_scoring.html#overall-assessment-score) is not `null` (no-score)

If these conditions are met the following will be sent:

**LTI Score** = Highest(**Assessment Score**) / 100

## Limiting Score Passback

Obojobo normally sends the [Overall Assessment Score](assessment_scoring.html#overall-assessment-score) to the LMS assignment it's linked to.

The {{ 'rubric' | obo_node }} attributes can be configured to conditionally send scores when they are above a value.

Set the {{ 'rubric' | obo_node }} attribute `failingResult="no-score"` to prevent any score below the value of `passingAttemptScore` from being sent to the LMS.

This can be useful when the assignment in the LMS is used to prevent access to other parts of the course. By not sending a score back, the LMS will not unlock content that requires a passing score.

```xml
<!-- ... -->
    <Assessment id="my-assessment" attempts="3">
      <!-- ... -->

      <rubric
        type="pass-fail"
        passingAttemptScore="75"
        passingResult="$attempt_score"
        failingResult="no-score"
      />

      <!-- ... -->
    </Assessment>
<!-- ... -->
```

This example sets the threshold to send scores back at 75%.

## Final Attempt Scores

It may be useful to withhold the score till all attempts are used. In that case, it is possible to control which score is sent back to the LMS using rubric's `unableToPassResult` attribute.

In this example the highest failing attempt score will be sent.

```xml
<!-- ... -->
    <Assessment id="my-assessment" attempts="3">
      <!-- ... -->

      <rubric
        type="pass-fail"
        passingAttemptScore="75"
        passingResult="$attempt_score"
        failingResult="no-score"
        unableToPassResult="$highest_attempt_score"
      />

      <!-- ... -->
    </Assessment>
<!-- ... -->
```

## Combining with Score Action Pages

ScoreAction Pages can be added for all three conditions:

- Passing `for="[75,100]"`
- Failing with attempts remaining `for="no-score"`
- Failing with **no** attempts remaining `for="[0,75)"`

```xml
<!-- ... -->
    <Assessment id="my-assessment" attempts="3">
      <!-- ... -->

      <rubric
        type="pass-fail"
        passingAttemptScore="75"
        passingResult="$attempt_score"
        failingResult="no-score"
        unableToPassResult="$highest_attempt_score"
      />

      <scoreActions>
        <scoreAction for="no-score">
          <Page> <!-- Failing page --> </Page>
        </scoreAction>
        <scoreAction for="[0,75)">
          <Page> <!-- Failing after all attempts used --> </Page>
        </scoreAction>
        <scoreAction for="[75,100]">
          <Page> <!-- Passing page --> </Page>
        </scoreAction>
      </scoreActions>

    </Assessment>
<!-- ... -->
```

How does the logic matches those three conditions?

When failing with attempts remaining the `for="no-score"` is always matched.

`passingAttemptScore` is set to 75, and the `passingResult` is set to the `$attempt_score` variable. This means in a passing condition, the score will be **75+**, matching `for="[75,100]"`.

Failing with no attempts remaining won't match `for="no-score"` because the `unableToPassResult` attribute is set to a variable that will report a score. This means that when the student runs out of attempts, failing every time, the score will be recorded based on their highest attempt score. This score will be 0-75, so the `for="[0,75)"` condition is matched.

There are several options for `'pass-fail'` rubrics. The full specification is listed in the {{ 'Assessment' | obo_node }} documentation.
