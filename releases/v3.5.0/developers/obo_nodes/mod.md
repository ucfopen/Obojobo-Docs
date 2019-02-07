---
title: Assessment > rubric > mod
menus: chunks
class: content_block
---

A Mod is a condition under which the assessment score will have additional points added or removed. Mods are only rewarded if the `passed` status is achieved.

> Mods should most likely be kept to one or two at most. In a planned future release mod rules will be specified to the student through an automatically generated table and several mods will be difficult for a student to read clearly. There is a limit of **20** mod rules allowed (any additional mods after the 20th mod will be ignored).

Mods must always be wrapped in a Mods array.

## Properties

| Property | Required | Type | Description |
|-
| reward | Required | Number | The amount (-100 to 100) that the passing attempt score is modified. Positive values are extra credit and negative values are penalties.
| attemptCondition | no | [Range String](../range_strings.html), Integer, `$last_attempt` | Default: `[1,$last_attempt]`. Specifies which attempt numbers this mod will be applied towards. Values must be 1 or higher. Use a [Range String](../range_strings.html) to specify a range of values. `$last_attempt` is a variable that will be replaced with the value of {{ 'Assessment' | obo_node }}'s `attempts` property. As the default value shows, `$last_attempt` can be used in the Range String syntax.

## Example

### JSON

```json
"mods": [
  { "attemptCondition": "1", "reward": "5" }
]
```

### OboXML

```xml
<mods>
  <mod attemptCondition="1" reward="5" />
</mods>
```

This example would award a bonus 5 points to assessments that are passed on the first attempt

> More examples can be found in [Extra Credit & Penalties](../../authors/assessment_extra_credit.html)
