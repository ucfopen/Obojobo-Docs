---
title: NumericAssessment > NumericChoice > NumericAnswer
menus: chunks
full_name: ObojoboDraft.Chunks.NumericAssessment.NumericAnswer
class: obo_node
node_class: chunk
---

This represents one possible answer (correct or incorrect) for a numeric question.

## Properties

| Property | Required | Type | Description |
|-
| requirement | Recommended | String | Default: "exact". Determines how to potentially match student input to this answer choice.

## Supported values for requirement

| Requirement Type | Description |
|-
| exact | Exact means that only student responses that represent the exact same value are allowed. For example, an exact answer of `4` will match against student responses for `4`, `4.0`, `8/2`, but not for `4.01`.
| range | Range accepts a range of answers, for example, all numbers -1 to 1. This would match student responses of `-1`, `1`, `0`, `1/1`, `1/2`, but not `-1.1` or `2` for example.
| margin | Margin allows you to define an answer with an accepted margin of error - either absolute or percent error. For example, an answer of `100` with a 5% margin of error would accept student responses for `100` as well as `100.2`, but not `120`.

## Additional properties when requirement is "exact"

| Property | Required | Type | Description |
|-
| answer | Required | Answer String | The numeric value of this answer choice

## Additional properties when requirement is "range"

| Property | Required | Type | Description |
|-
| start | Required | Answer String | The starting numeric value for this answer range
| end | Required | Answer String | The ending numeric value for this answer range

## Additional properties when requirement is "margin"

| Property | Required | Type | Description |
|-
| answer | Required | Answer String | The numeric value of this answer choice
| type | Required | String | The type of error, percent or absolute
| margin | Required | String | Either the percent or absolute error amount allowed

## Format of Answer Strings

Answers can be decimal numbers, in scientific notation, fractions, hexadecimal numbers, octal numbers or binary numbers. Leading zeroes are ignored. Some examples are provided:

| Answer string example | Parsed as | Subtype | Equivalent decimal value | Note
|-
| 0 | decimal || 0 |
| 01.230 | decimal || 1.230 | Trailing zeroes are kept for significant figure purposes
| 100. | decimal || 100. | Trailing "." is kept for significant figure purposes
| 1/2 | fraction || 0.5 |
| -2/4 | fraction || -0.5 | Non-reduced fractions are allowed
| 1/3 | fraction || 0.333333... |
| 6.02e24 | scientific | e | 6020000000000000000000000 |
| 60.2e23 | scientific | e | 6020000000000000000000000 | Improper form (more than one digit to the left of the decimal) is allowed
| 6.02\*10^24 | scientific | asterix | 6020000000000000000000000 |
| 6.02ee24 | scientific | ee | 6020000000000000000000000 |
| 6.02'24 | scientific | apos | 6020000000000000000000000 |
| 6.02x10^24 | scientific | x | 6020000000000000000000000 |
| 0xFF0F | hexadecimal | hexZeroX | 65295 |
| #FF0F | hexadecimal | hexOctothorpe | 65295 |
| $FF0F | hexadecimal | hexDollarSign | 65295 |
| 0o777 | octal || 511 |
| 0b1101 | binary || 13 |

Student input is matched to potential answer values by checking the equivalent decimal value. For example, if a possible answer value is "2", student input of "2/1" is still accepted as a match as it is equivalent in value. An additional special case is afforded for fractional equivalency. If an answer value is "1/3", student input of "0.333333" (or the same input with additional 3s) is considered equivalent ("0.33333" - an answer with five "3"s - is not). Likewise, student input of "1/3" will match against an answer value of "0.333333".

## Supported Trigger Types

| Action Type | Description
|-
| onMount | Fired when a node is added to the DOM
| onUnmount | Fired when a node is removed from the DOM

## Required Children

None

## Variables Registered

None

## Example

### JSON

```json
{
	"type": "ObojoboDraft.Chunks.NumericAssessment.NumericAnswer",
	"id": "...",
	"content": [
		{
			"requirement": "range",
			"start": "-1",
			"end": "1"
		}
	]
}
```

### XML

```xml
<NumericAnswer requirement="range" start="-1" end="1" />
```
