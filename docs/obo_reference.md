---
id: obo_reference
title: OboNode Reference
sidebar_label: OboNode Reference
---

This section defines the current list of nodes and their expected **content** values, expected **children** nodes, **triggers** that they respond to and any **variables** they expose. Unless specified all content values are optional.

## Note on id values in examples

`id`s are required in the JSON format. In cases where the id is not referenced in the examples below they are simply coded as

```json
id: "..."
```

This simply indicates that an `id` should be specified but the specific value of that `id` is not important (it's included for completeness). Since `id`s are not required in the XML format these non-referenced ids are not included in the XML.

## ObojoboDraft.Modules.Module

--

## ObojoboDraft.Sections.Content

--

## ObojoboDraft.Sections.Assessment
#### ScoreAction

##### Legacy properties (Deprecated):

The `from` and `to` properties have been replaced by the `for` property.

* `from`: Integer: The start of the score range
* `to`: Integer: The end of the score range

You must either specify `for` or specify both `from` and `to`. `from` and `to` are deprecated and may be removed in a future release.

#### AssessmentRubric

##### Properties:

* `type` **REQUIRED** String : Must be `'pass-fail'` (future versions may introduce additional rubrics).
* `mods` Array\<**[Mod](content_mod.md)**>: A list of Mods which provide extra credit or penalties.
* `passingAttemptScore`: Integer 0-100 (Default: `100`): The Assessment Attempt score required to be rewarded a `'passed'` status.
* `passedResult`: Integer 0-100 or `'$attempt_score'` (Default: `100`): The base Assessment Score if rewarded a `'passed'` status. If `'$attempt_score'` is specified this Assessment Attempt score will be used for this value.
* `failedResult`: Integer 0-100 or `'$attempt_score'` or `'no-score'` (Default: `0`): The base Assessment Score if rewarded a `'failed'` status.
* `unableToPassResult`: Integer 0-100 or `'no-score'` or `'$highest_attempt_score'` (Default: Not set): The base Assessment Score if rewarded an `unableToPass` status. If `'$highest_attempt_score'` is specified then the highest Assessment Attempt score will be used for this value. If this value is not set then the `unableToPass` status will not be rewarded and this result will not be triggered.

##### Mod

###### Properties:

* `attemptCondition`: AttemptRange or Integer or `'$last_attempt'`: Specifies for which attempt numbers this mod will be applied towards. `'$last_attempt'` is a variable that will be replaced with the value of the `attempts` property of the **[ObojoboDraft.Sections.Assessment](obo_reference.md#obojobodraftsectionsassessment)** OboNode.
* `reward`: Integer **REQUIRED**: The reward amount. Positive values are extra credit and negative values or penalties.

A future release may specify additional potential conditions such as a condition based on date/time (`timeCondition`).

Mods can specify, for example, that a student who passes on their first attempt can be awarded 5 additional points. Mods are only rewarded if the `'passed'` status is achieved.

Mods should most likely be kept to one or two at most. In a planned future release mod rules will be specified to the student through an automatically generated table and several mods will be difficult for a student to read clearly. There is a limit of **20** mod rules allowed (any additional mods after the 20th mod will be ignored).

#### Range

A string that specifies a range. Possible syntax examples:

* `"[1,3]"`: Square brackets are **inclusive**. This matches `1`, `2` and `3`.
* `"(1,3]"`: Parentheses are **exclusive**. This matches `2` and `3`.
* `"[1,3)"`: This matches `1` and `2`
* `"(1,3)"`: This matches `2` (This is functionally equivalent to `'2'`)

Full syntax: `('(' | '[') + Number + ',' + Number + (')' | ']')`

#### AttemptRange

Same as Range above except the second value can be `'$last_attempt'`. Examples:

* `"[1,$last_attempt)"`: This matches `1`, `2` and so on up until the attempt before the last available attempt.
* `"[1,$last_attempt]"`: This matches `1`, `2` and so on up until the last available attempt.

Full syntax: `('(' | '[') + Number + ',' + (Number | '$last_attempt') + (')' | ']')`

--

## ObojoboDraft.Pages.Page

--

## ObojoboDraft.Chunks.Text

--

## ObojoboDraft.Chunks.List

#### ListStyles

A list style can be optionally specified for a list.
The ListStyles object has two properties: **`type`** and **`indents`**:

* `type`: String (Default: `'unordered'`): MUST be one of the following values:
  * `'unordered'`: Creates an unordered list
  * `'ordered'`: Creates an ordered list
* `indents`: Object: An object where the keys are various indent levels and the corresponding values are objects defining the styling options for items at that indent level which override the default styles. Indent levels are zero-indexed so 0 describes the first indent level, 1 is the second indent level and so on.

The indents object includes **`type`**, **`start`** and **`bulletStyle`**:

* `type`: String: Same as type above.
* `start`: Integer: If `type` is `ordered` then this defines the starting value of the list - for example if set to `3` the list will start at 3, then 4, then 5 (and so on). Will default to `1` if no value is set.
* `bulletStyle`: String: One of the following values:
  * For unordered lists:
    * `'disc'`: Filled circle bullets
    * `'circle'`: Hollow circle bullets
    * `'square'`: Filled square bullets
  * For ordered lists:
    * `'decimal'`: 1., 2., 3., ...
    * `'decimal-leading-zero'`: 01., 02., 03., ..., 10., 11., ...
    * `'lower-alpha'`: a., b., c., ...
    * `'upper-alpha'`: A., B., C., ...
    * `'lower-roman'`: i., ii., iii., ...
    * `'upper-roman'`: I., II., III., ...

For indent levels not defined via the **indents** property the following defaults will apply:

**Unordered lists**:

* Filled circle bullets
  * Hollow circle bullets
    * Filled square bullets
      * (Repeat)

**Ordered lists**:

* Numbers
  * Uppercase letters
    * Uppercase roman numerals
      * Lowercase letters
        * Lowercase roman numerals
          * (Repeat)

An example is shown below:

```json
{
  "listStyles": {
    "type": "ordered",
    "indents": {
      "2": {
        "type": "unordered",
        "bulletStyle": "square"
      },
      "4": {
        "start": 5,
        "bulletStyle": "upper-roman"
      }
    }
  }
}
```

This will produce an ordered list with the following styles:

* Numbers
  * Uppercase letters
    * Square bullets (as defined by the `2` value in `indents`)
      * Lowercase letters
        * Uppercase roman numerals starting at V. (as defined by the `4` value in `indents`)

Here is the same structure in XML:

```xml
<listStyles>
  <type>ordered</type>
  <indents>
    <indent level="2" type="unordered" bulletStyle="square" />
    <indent level="4" type="ordered" start="10" bulletStyle="upper-alpha" />
  </indents>
</listStyles>
```

## ObojoboDraft.Chunks.Heading

## ObojoboDraft.Chunks.Code

## ObojoboDraft.Chunks.Break

## ObojoboDraft.Chunks.ActionButton

## ObojoboDraft.Chunks.Figure

## ObojoboDraft.Chunks.MathEquation

## ObojoboDraft.Chunks.HTML

## ObojoboDraft.Chunks.Table

## ObojoboDraft.Chunks.YouTube

## ObojoboDraft.Chunks.QuestionBank

## ObojoboDraft.Chunks.Question

## ObojoboDraft.Chunks.MCAssessment

## ObojoboDraft.Chunks.MCAssessment.MCChoice

## ObojoboDraft.Chunks.MCAssessment.MCAnswer

## ObojoboDraft.Chunks.MCAssessment.MCFeedback
