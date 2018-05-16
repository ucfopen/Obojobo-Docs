---
id: assessment_pretest
title: Pre-Test
sidebar_label: Pre-Test
---

Using navigation lock and unlock events and the `start` property of the Module OboNode you can direct students to the Assessment and require them to first attempt the Assessment before they can explore the rest of the document.

```xml
<ObojoboDraftDoc>
  <Module start="my-assessment">
    <Content> <!-- Content goes here --> </Content>
    <Assessment id="my-assessment">
      <Page> <!-- Landing page -->
        <triggers>
          <trigger type="onMount">
            <actions>
              <action type="nav:lock" />
            </actions>
          </trigger>
      </Page>
      <QuestionBank> <!-- Assessment question bank --> </QuestionBank>
      <scoreActions> <!-- scoreActions --> </scoreActions>
      <triggers>
        <trigger type="onStartAttempt">
          <actions>
            <action type="nav:lock" />
          </actions>
        </trigger>
        <trigger type="onEndAttempt">
          <actions>
            <action type="nav:unlock" />
          </actions>
        </trigger>
      </triggers>
    </Assessment>
  </Module>
</ObojoboDraftDoc>
```

`start="my-assessment"` in the Module OboNode tells Obojobo to send students to the `"my-assessment"` Assessment section as soon as the document has loaded. The `onMount` trigger in the Assessment landing page fires whenever that page is displayed, causing the navigation to lock right away.

After the first attempt the landing page is no longer displayed so the `onMount` trigger doesn't fire after the first time. This means that on additional visits students are not forced to take an Assessment Attempt.
