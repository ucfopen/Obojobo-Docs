---
title: Extra Credit & Penalties
menus: authors_assessments_how_to
---

The Assessment Rubric allows extra credit or penalties to be specified. In this example we grant an extra 5 points to a student's first attempt and deduct 5 points from a student's last attempt:

```xml
<ObojoboDraftDoc>
  <Module>
    <Content> <!-- Content goes here --> </Content>
    <Assessment id="my-assessment" attempts="3">
      <Page> <!-- Landing page --> </Page>
      <QuestionBank> <!-- Assessment question bank --> </QuestionBank>
      <scoreActions>
        <scoreAction for="[0,100]"> <!-- Post-attempt page --> </scoreAction>
      </scoreActions>
      <rubric>
        <mods>
          <mod attemptCondition="1" reward="5" />
          <mod attemptCondition="$last_attempt" reward="-5" />
        </mods>
      </rubric>
    </Assessment>
  </Module>
</ObojoboDraftDoc>
```

The `$last_attempt` variable indicates that this mod will only be triggered on the last attempt. You can also specify a range for `attemptCondition`, for example:

```xml
<mod attemptCondition="[1,2]" reward="5" />
```

Meaning attempts 1 and 2. Or,

```xml
<mod attemptCondition="[1,$last_attempt)" reward="5" />
```

Which would trigger for every attempt except the last attempt.
