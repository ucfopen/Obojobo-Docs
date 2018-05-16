---
id: assessment_displayingAttempts
title: Displaying the number of attempts in the content
sidebar_label: Displaying Attempts
---

Using variables you can write the number of attempts remaining and the number taken in the content. In this example we add it to the buttons and in the page content:

```xml
<ObojoboDraftDoc>
  <Module>
    <Content> <!-- Content goes here --> </Content>
    <Assessment id="my-assessment">
      <Page> <!-- Landing page -->
        <ActionButton> <!-- Button to start assessment attempt -->
          <textGroup>
            <t>Start Attempt ({{assessment:attemptsRemaining}} attempts remaining)</t>
          </textGroup>
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
            <p>You have taken {{assessment:attemptsTaken}} attempts.</p>
            <ActionButton> <!-- Button to try another assessment attempt -->
              <textGroup>
                <t>Start Attempt ({{assessment:attemptsRemaining}} attempts remaining)</t>
              </textGroup>
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
