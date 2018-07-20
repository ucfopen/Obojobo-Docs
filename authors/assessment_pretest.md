---
title: Adding a Pre-Test
menus: authors_how_to
---

Using navigation lock and unlock events and the `start` property of the Module OboNode students can be directed to the Assessment first, requiring them to attempt the Assessment before they can explore the rest of the document.

Setting Module's `start="my-assessment"` attribute tells Obojobo to send students to the `"my-assessment"` as soon as the document has loaded.

The Assessment's intro Page `onMount` trigger fires as soon as that page is displayed, causing the navigation to lock right away.

After the first attempt the landing page is no longer displayed so the `onMount` trigger doesn't fire after the first time. This means that on additional visits students are not forced to take an Assessment Attempt.

```xml
<ObojoboDraftDoc>
  <Module start="my-assessment">
    <Content> <!-- ... --> </Content>
    <Assessment id="my-assessment">
      <Page> <!-- ... -->
        <triggers>
          <trigger type="onMount">
            <actions>
              <action type="nav:lock" />
            </actions>
          </trigger>
      </Page>
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

