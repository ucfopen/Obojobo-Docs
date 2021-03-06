---
title: Assessment
menus: chunks
full_name: ObojoboDraft.Sections.Assessment
class: obo_node
node_class: section
---

The Assessment contains one or more questions. Students start the Assessment then answer a series of questions, generated by the settings and relationship of one or more QuestionBanks. When finished they submit the Assessment and are given an Assessment Score as well as told their Highest Assessment Score. Students can attempt the Assessment multiple times depending on the Assessment options.

## Properties

| Property | Required | Type | Description |
|-
| scoreActions | Required | Array<{{ 'scoreAction' | obo_node }}> | This defines one or more landing pages after the student submits their assessment attempt. Students can be sent to different pages based on their highest Assessment Score.
| attempts | no | Integer, `unlimited` | Default: `unlimited`. The number of attempts allowed for this assessment. If not `unlimited` the value must be 1 or higher.
| review | no | String | Default: `never`. Specifies if a full Assessment Review should be shown after an Assessment Attempt Quiz. Supported values shown in table below.
| rubric | no | {{ 'rubric' | obo_node }} | Rules that specify how an Assessment Score is calculated from an Attempt Score
| title | no | String | Default: `Assessment`. The title to show in the navigation.
| triggers | no | Array<{{ 'trigger' | obo_node }}> | Could contain triggers for `onStartAttempt` and/or `onEndAttempt` to, for example, lock and unlock navigation.

### Supported Values for `review`

| Type Name | Description |
|-
| never | After each Assessment Attempt Quiz students only see which questions they got correct or incorrect. Students never see their responses or the correct and incorrect answers.
| always | After each Assessment Attempt Quiz students can see their responses and the incorrect and correct answers.
| no-attempts-remaining | If any attempts remain then review acts equivalent to `never`. If no attempts remain then review acts equivalent to `always`. This means that students only see their responses and correct and incorrect answers once they have no attempts left.

## Supported Trigger Types

| Action Type | Description
|-
| onMount | Fired when a node is added to the DOM
| onUnmount | Fired when a node is removed from the DOM
| onNavEnter | Fired when a node is navigated to
| onNavExit | Fired when a node is navigated away from
| onStartAttempt | Fired when an assessment attempt is started
| onEndAttempt | Fired when an assessment attempt is submitted

## Required Children

Assessment expects exactly two children in order:

1.  {{ 'Page' | obo_node }}: The initial page shown when a student first navigates to the assessment. This page should contain a {{ 'ActionButton' | obo_node }} to start the assessment.
2.  {{ 'QuestionBank' | obo_node }}: A question bank that contains all the possible questions contained in the Assessment.

## Registered Variables

| Variable Name | Description |
|-
| `{% raw %}{{assessment:attemptsRemaining}}{% endraw %}` | The number of attempts remaining or `unlimited` if no attempt limit is set.
| `{% raw %}{{assessment:attemptsAmount}}{% endraw %}` | The total number of attempts or `unlimited` if no attempt limit is set.

## Example

### JSON

```json
{
  "type": "ObojoboDraft.Sections.Assessment",
  "id": "assessment",
  "content": {
    "attempts": 3,
    "review": "always",
    "rubric": {
      "type": "attempt",
      "mods": [
        { "attemptCondition": "1", "reward": "5" }
      ]
    },
    "scoreActions": [
      {
        "for": "[0,100)",
        "page": {
          "type": "ObojoboDraft.Pages.Page",
          "id": "...",
          "children": [ ... ]
        }
      },
      {
        "for": "100",
        "page": {
          "type": "ObojoboDraft.Pages.Page",
          "id": "...",
          "children": [ ... ]
        }
      }
    ]
  },
  "children": [
    {
      "type": "ObojoboDraft.Pages.Page",
      "id": "...",
      ...
      "children": [ ... ]
    },
    {
      "type": "ObojoboDraft.Chunks.QuestionBank",
      "id": "...",
      "content": {
        "choose": 3,
        "select": "random"
      },
      "children": [ ... ]
    }
  ]
}
```

### XML

```xml
<Assessment attempts="3" review="always">
  <scoreActions>
    <scoreAction for="[0,100)">
      <Page> <!-- ... --> </Page>
    </scoreAction>
    <scoreAction for="100">
      <Page> <!-- ... --> </Page>
    </scoreAction>
  </scoreActions>
  <Page>
    <p>You have {% raw %}{{assessment:attemptsRemaining}}{% endraw %} attempts remaining. Click begin below to attempt the assessment. Scoring a 100% will move you to the next module, otherwise you will have a chance to review the content and retake the assessment with different questions.</p>
    <ActionButton label="Begin">
      <triggers>
        <trigger type="onClick">
          <actions>
            <action type="assessment:startAttempt">
              <value id="assessment">
            </action>
          </actions>
        </trigger>
      </triggers>
    </ActionButton>
  </Page>
  <QuestionBank choose="3" select="random">
    <!-- ... -->
  </QuestionBank>
  <rubric type="pass-fail" passingAttemptScore="80" passedResult="$attempt_score" failedResult="0">
    <mods>
      <mod attemptCondition="1" reward="5" />
    </mods>
  </rubric>
</Assessment>
```

> Many more examples of assessments can be found in the [Author How To section](../../authors/assessment_pretest.html)
