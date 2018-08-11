---
title: Reviews & Question Feedback
menus: authors_assessments_how_to
---

By default after an Assessment Attempt is completed the student is shown which questions they got correct and incorrect, however they are not able to see the question choices, their responses or the correct answers. Additionally if any Assessment Questions have feedback or solutions these will not be displayed.

If you wish to show students these properties (referred to as a "Full Review") you can specify the `review` property:

```xml
<ObojoboDraftDoc>
  <Module>
    <Content> <!-- Content goes here --> </Content>
    <Assessment id="my-assessment" review="always">
      <!-- Assessment goes here -->
    </Assessment>
  </Module>
</ObojoboDraftDoc>
```

`'always'` means that the Full Review will always be displayed after each Assessment Attempt. You can also specify `'no-attempts-remaining'` which will only show the Full Review after the student has taken all available attempts. The default setting is `'never'`.
