---
title: Limiting Attempts
menus: authors_assessments_how_to
---

Adding an attempt limit will restrict the number of times a student can submit an assessment score. If omitted, it defaults to `"unlimited"`.

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

> There are many different and nuanced reasons to use attempt limits. Consider what the module's purpose is and what role the attempt limit plays for all types of students.
>
> Low attempt limits are high-stress, but can be valuable for laser-focused evaluations. Conversely, high limits can allow more opportunities for struggling students to perform well. However, they can also encourage guessing.
>
> There are many theories and practices here with no generic rules that apply to all learning models.
