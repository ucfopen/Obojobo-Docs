---
title: Locking Navigation
menus: authors_how_to
---

You can prevent students from leaving the Assessment Attempt once it's started by locking the navigation:

```xml
<ObojoboDraftDoc>
  <Module>
    <Content> <!-- ... --> </Content>

    <Assessment id="my-assessment">
      <Page> <!-- ... --> </Page>
      <QuestionBank> <!-- ... --> </QuestionBank>
      <scoreActions> <!-- ... --> </scoreActions>

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
