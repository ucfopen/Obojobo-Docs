---
id: events_3.3_breakingChanges
title: Breaking Changes
sidebar_label: Breaking Changes
---

## Removed events

### assessment:setResponse

This event is now made redundant by new properties added to `question:setResponse`. Use `question:setResponse` instead.

## Renamed events

### score:set

`2.0.0` Renamed to `question:scoreSet` `1.0.0`

### score:clear

`2.0.0` Renamed to `question:scoreClear` `1.0.0`

## Updated events

### assessment:attemptScored

`1.1.0` ----> `2.0.0`

### viewer:inactive

`1.0.0` ----> `2.0.0`

### viewer:returnFromInactive

`1.0.0` ----> `2.0.0`

### lti:replaceResult:

`1.0.0` ----> `2.0.0`
