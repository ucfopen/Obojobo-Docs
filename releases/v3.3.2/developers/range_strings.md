---
title: Range Strings
menu: dev_misc
---

Range strings are used to briefly describe a range of values.

## Range String Syntax

`( or [` + `Number` + `,` + `Number` + `) or ]`

Where supported, you can use variables in place of numbers.

## Examples

| Example | Description
|-
| `[1,3]` | Square brackets are **inclusive**. This matches `1`, `2` and `3`.
| `(1,3]` | Parentheses are **exclusive**. This matches `2` and `3`.
| `[1,3)` | Matches `1` and `2`
| `(1,3)` | Matches `2` (This is functionally equivalent to `2`)
| `[1,$last_attempt)` | Matches from `1` to the value of `$last_attempt`
