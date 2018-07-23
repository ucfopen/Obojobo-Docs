---
title: Mod
menus:
  chunks:
    title: mod
full_name: mod
node_class: content
---
A Mod is a condition under which the assessment score will have additional points added or removed.  Mods are only rewarded if the `'passed'` status is achieved.

Mods should most likely be kept to one or two at most. In a planned future release mod rules will be specified to the student through an automatically generated table and several mods will be difficult for a student to read clearly. There is a limit of **20** mod rules allowed (any additional mods after the 20th mod will be ignored).

Mods must always be wrapped in a Mods array.

## Structure

* `attemptCondition` Range String or Integer or `'$last_attempt'`: Specifies for which attempt numbers this mod will be applied towards. `'$last_attempt'` is a variable that will be replaced with the value of the `attempts` property of the **[ObojoboDraft.Sections.Assessment](obonode_assessment)** OboNode. Range Strings specify a range of values, and may be formatted as follows:
  * `"[1,3]"`: Square brackets are **inclusive**. This matches `1`, `2` and `3`.
  * `"(1,3]"`: Parentheses are **exclusive**. This matches `2` and `3`.
  * `"[1,3)"`: This matches `1` and `2`
  * `"(1,3)"`: This matches `2` (This is functionally equivalent to `'2'`)
  * `"[1,$last_attempt)"`: This matches `1`, `2` and so on up until the attempt before the last available attempt.
  * `"[1,$last_attempt]"`: This matches `1`, `2` and so on up until the last available attempt.
  * Full syntax: `('(' | '[') + Number + ',' + (Number | '$last_attempt') + (')' | ']')`
* `reward` **REQUIRED** Integer: The reward amount. Positive values are extra credit and negative values or penalties.

A future release may specify additional potential conditions such as a condition based on date/time (`timeCondition`).

## Required Children

None

## Variables Registered

None

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
