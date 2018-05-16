---
id: assessment_example
title: Basic Assessment
sidebar_label: Example
---

Here's an example of a simple assessment

```xml
<ObojoboDraftDoc>
  <Module>
    <Content> <!-- Content goes here --> </Content>
    <Assessment id="my-assessment">
      <Page> <!-- Landing page -->
        <ActionButton label="Start Attempt"> <!-- Button to start assessment attempt -->
          <triggers>
            <trigger type="onClick">
              <actions>
                <action type="assessment:startAttempt">
                  <value id="my-assessment">
                </action>
              </actions>
            </trigger>
          </triggers>
        </ActionButton>
      </Page>
      <QuestionBank> <!-- Assessment question bank -->
        <Question>
          <!-- Question content here -->
        </Question>
      </QuestionBank>
      <scoreActions>
        <scoreAction for="[0,100]"> <!-- Post-attempt page -->
          <Page>
            <ActionButton label="Start Attempt"> <!-- Button to try another assessment attempt -->
              <triggers>
                <trigger type="onClick">
                  <actions>
                    <action type="assessment:startAttempt">
                      <value id="my-assessment">
                    </action>
                  </actions>
                </trigger>
              </triggers>
            </ActionButton>
          </Page>
        </scoreAction>
      </scoreActions>
    </Assessment>
  </Module>
</ObojoboDraftDoc>
```

In this setup the student will click the Start Attempt button to begin taking the assessment. The student will be shown all questions in the Assessment Question Bank, and the student will be able to navigate away from the assessment freely. There is no limit to the number of attempts available for the student.

Note that the `Assessment` has been given an `id` property. This id is used in the `assessment:startAttempt` value field. This is the wiring necessary to set up assessments.

The scoreAction page is required - this is the page that will be displayed once the Assessment Attempt has been completed. You can create multiple scoreAction pages - the page that is displayed is determined by the `for` property: The first `for` range that includes the Recorded Score will be displayed. Since this example doesn't specify multiple scoreAction pages you must set `for` to `"[0,100]"` as this will match any possible score.