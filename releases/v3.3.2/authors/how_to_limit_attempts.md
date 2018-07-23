---
title: Limiting Assessment Attempts
menus: authors_how_to
---
Adding an attempt limit will restrict the number of times a student can submit an assessment score.  If ommited, it defaults to `"unlimited"`.

**Allowed Values**: `"unlimited"`, integers from `"1"` to `"256"`


```xml
<ObojoboDraftDoc>
  <Module>
    <Content> <!-- ... --> </Content>

    <Assessment id="my-assessment" attempts="3">
      <!-- ... -->
    </Assessment>

  </Module>
</ObojoboDraftDoc>
```

> There are many different and nuanced reasons to use attempt limits.  Think critically about what the module's purpose is and what role the attempt limit plays for all types of students.
>
> Low attempt limits are high-stress, but can be valuable for laser-focused evaluations.  Conversely, high limits can allow a more diverse students the ability to perform well. However, they can also encourage guessing.
>
> We've seen evidence that many students don't perform better after a certain number of attempts - a sure sign that they simply don't understand the topic at hand.  There are many theories and practices here with no generic rules that apply to all learning models.
>
> Experiment and adjust as needed.
