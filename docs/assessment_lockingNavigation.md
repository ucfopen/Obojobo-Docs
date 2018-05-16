---
id: assessment_lockingNavigation
title: Locking navigation
sidebar_label: Locking navigation
---

You can prevent students from leaving the Assessment Attempt once it's started by locking the navigation:

```xml
<ObojoboDraftDoc>
  <Module>
    <Content> <!-- Content goes here --> </Content>
    <Assessment id="my-assessment" attempts="3">
      <Page> <!-- Landing page --> </Page>
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

Now students cannot leave the Assessment section once it's started. When the Assessment Attempt has ended students can return to other portions of the document.
