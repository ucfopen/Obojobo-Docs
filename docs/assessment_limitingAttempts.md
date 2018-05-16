---
id: assessment_limitingAttempts
title: Limiting attempts
sidebar_label: Limiting attempts
---
You can specify the number of attempts with the `attempts` property:

```xml
<ObojoboDraftDoc>
  <Module>
    <Content> <!-- Content goes here --> </Content>
    <Assessment id="my-assessment" attempts="3">
      <!-- Assessment goes here -->
    </Assessment>
  </Module>
</ObojoboDraftDoc>
```

Now students are restricted to three attempts.