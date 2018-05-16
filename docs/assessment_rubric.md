---
id: assessment_rubric
title: Assessment Rubric & Extra Credit (Mods)
sidebar_label: Assessment Rubric & Extra Credit (Mods)
---

Assessment Rubrics are used to calculate the Assessment Score and to specify extra credit and penalties (referred to as "Mods"). You do not have to specify a rubric - if it is omitted the default rubric will be used instead.

There are two types of Rubrics you can specify:

### 'attempt'

This will simply set the Assessment Score equal to the Attempt Score plus the total rewarded mods. This is the default option and will be used if no custom rubric is specified.

### 'pass-fail'

Allows you to specify a "passing" Attempt Score, as well as the resulting Assessment Score when a learner passes and when the don't pass (or, fail). Additionally you can specify another resulting Assessment Score when the learner has exhausted all of their attempts but hasn't passed. This will allow a student to move on even if they don't achieve the target passing score.

## Properties

See the **ObojoboDraft.Sections.Assessment** section of the OboNode specification for a complete list of properties and their descriptions for Assessment Rubrics.

## Rubric Examples

An example of a `rubric` is presented below (in XML format):

```xml
<Assessment>
  ...
  <rubric
    type='pass-fail',
    passingAttemptScore='80',
    passedResult='$attempt_score',
    failedResult='no-score',
    unableToPassResult='$highest_attempt_score'
  >
    <mods>
      <mod attemptCondition="1" reward="5" />
    </mods>
  </rubric>
  ...
</Assessment>
```

(In the XML above `$attempt_score` is a special variable that will be replaced with their most recent Attempt Score and `$highest_attempt_score` will be replaced with their highest Attempt Score. `no-score` is a special token indicating that no Assessment Score should be rewarded.)

In the example above a student must achieve an Attempt Score of 80% or higher to pass. If they pass their Assessment Score will be equal to their Attempt Score. If they fail their Assessment will remain ungraded (`no-score`). If they exhaust all remaining attempts their Assessment Score will be whatever their highest Attempt Score was. If they pass the assessment on their first attempt they will be rewarded 5 additional points.

An example of scoring using this rubric (with an Assessment set to 4 attempts):

* Attempt 1: Student achieves a 85% Attempt Score. This is > 80% so they pass (and they are able to collect the extra credit mod since they passed on their first attempt). Their Assessment Score is equal to their Attempt Score + Extra Credit = 85 + 5 = **90**. A **90** is sent to any LTI gradebook, if one exists.
* Attempt 2: Student achieves a 85% again. This is another passing attempt, however they aren't eligible for the extra credit mod. Their Assessment Score is their Attempt Score = **85**. Their highest Assessment Score is **90** however, so they maintain a **90**. A **90** is sent to any LTI gradebook, if one exists.
* Attempt 3: Student achieves a 70%. This is < 80% so this is a failed attempt. They receive no Assessment Score (the `no-score` score), however they still have a highest Assessment Score of **90** so again they maintain a **90**. A **90** is sent to any LTI gradebook, if one exists.
* Attempt 3 - Last Attempt: Student achieves a 100% Attempt Score. This is another passing attempt. While they are now out of attempts the `unableToPassResult` rule doesn't trigger since they achieved at least one passing attempt. Their Assessment Score is their Attempt Score = **100**. This is their new highest Assessment Score so their Assessment Score is now **100**. A **100** is sent to any LTI gradebook, if one exists.

Let's look at another example:

```xml
<Assessment>
  ...
  <rubric
    type='pass-fail',
    passingAttemptScore='80',
    passedResult='100',
    failedResult='0',
    unableToPassResult='50'
  >
    <mods>
      <mod attemptCondition="[1,2]" reward="5" />
    </mods>
  </rubric>
  ...
</Assessment>
```

In this example learners earn either a 100% or 0% depending on if they achieve an Attempt Score of 80% or higher. If they don't pass after exhausting all available attempts they instead earn an Assessment Score of 50%. Additionally if they pass on the first or second attempt (range specified by the `[1,2]` syntax) they will achieve an additional 5 points. It's important to note that Assessment Scores cannot exceed 100%. In this example a learner could get a 105% (100% passed result plus 5 Extra Credit) but this will be capped to 100%.

Consider another example using this rubric with an assessment providing three attempts:

* Attempt 1: Student achieves an Attempt Score of 50 which is not passing. As a result they are awarded an Assessment Score of **0**. A **0** is sent to any LTI gradebook, if one exists.
* Attempt 2: Student achieves an Attempt Score of 0 which again is not passing. Their Assessment Score of **0** is sent to any LTI gradebook, if one exists. These two attempts did not trigger the mod - future attempts will not be eligible for mods.
* Attempt 3: Student improves with an Attempt Score of 70 but still does not pass. Since they are out of attempts and have not scored a passing Attempt Score the `unableToPassResult` rule is triggered and they recieve an Assessment Score of **50**. A **50** is sent to any LTI gradebook, if one exists.

```xml
<rubric
  type='pass-fail'
>
</rubric>
```

Creates a `pass-fail` assessment requiring an Attempt Score of **100%** to "pass". Passing results in an Assessment Score of **100%**. Failing results in an Assessment Score of **0%**. This example uses all the default values for `pass-fail`.

---

```xml
<rubric
  type='pass-fail'
  passingAttemptScore="10"
  passedResult="0"
  failedResult="100"
  unableToPassResult="$attempt_score"
>
  <mods>
    <mod attemptCondition="2" reward="5" />
    <mod attemptCondition="[2,$last_attempt)" reward="5" />
    <mod attemptCondition="$last_attempt" reward="5" />
    <mod attemptCondition="$last_attempt" reward="5" />
  </mods>
</rubric>
```

This is an esoteric example to showcase the available options. This is a `pass-fail` assessment which requires a 10% to "pass". Passing results in a **0** and failing results in a **100%** Assessment Score. If all attempts are exhausted your last attempt score will be your Assessment Score. Passing on your second attempt will reward two mods worth 5 points each, so 10 points total (Mods #1 and #2). Passing on your second attempt up to (but not including) your last attempt will reward 5 points (Mod #2). Passing on your last attempt will reward two mods worth 5 points each for 10 points total (Mods #3 and #4). As with this example note that duplicate mods are technically allowed, however in practice this most likely should be avoided.

---

```xml
<rubric
  type='attempt'
>
</rubric>
```

This is the default rubric. This will be used if no custom rubric is specified. This simply means that a learner's Assessment Score is equal to their Attempt Score.
