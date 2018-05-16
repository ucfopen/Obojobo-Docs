---
id: events_3.2_updated
title: Updated Events
sidebar_label: Updated Events
---

* `question:setResponse`: `1.0.0` to `2.0.0`
* `assessment:setResponse`: `1.0.0` to `2.0.0`
* `assessment:attemptStart`: `1.0.0` to `1.1.0`
* `assessment:attemptEnd`: `1.0.0` to `1.1.0`
* `score:set`: `1.0.0` to `2.0.0`
* `score:clear`: `1.0.0` to `2.0.0`

### Changes:

#### `question:setResponse` events

Question responses and logic are changed. We've attempted to reduce the number of events sent as well as include the state of the response with the event (currently this information can only be gathered by looking at all events for a question).

Previously when selecting a multiple choice answer this would send an event for every multiple choice answer.

`pick-one` MCAssessment Question Example:

```
Question A
	( ) Choice 1
	( ) Choice 2
	( ) Choice 3
```

When selecting Choice 3, for example, this would send three events. Specifically the following `question:setResponse` event bodies would be sent:

```
{
	questionId: 'A',
	responderId: '1',
	response: { set:false }
}
```

```
{
	questionId: 'A',
	responderId: '2',
	response: { set:false }
}
```

```
{
	questionId: 'A',
	responderId: '3',
	response: { set:true }
}
```

In 3.2 `responderId`s have been renamed to `targetId`. Additonally, `response` has been changed to represent a list of MCChoice ids that have been selected for this answer. Continuing with our example in 3.2 selecting Choice 3 would send the following event only:

```
{
	questionId: 'A',
	response: { ids: ['3'] },
	targetId: '3'
}
```

`pick-all` MCAssessment Question Example:

```
Question A
	[ ] Choice 1
	[ ] Choice 2
	[ ] Choice 3
```

If a user selects Choice 2, then selects Choice 3, then unselects Choice 2 the following events would be fired:

```
{
	questionId: 'A',
	responderId: '2',
	response: { set:true }
}
```

```
{
	questionId: 'A',
	responderId: '3',
	response: { set:true }
}
```

```
{
	questionId: 'A',
	responderId: '2',
	response: { set:false }
}
```

In 3.2 the following events would be fired instead:

```
{
	questionId: 'A',
	response: { ids: ['2'] },
	targetId: '2'
}
```

```
{
	questionId: 'A',
	response: { ids: ['2', '3'] },
	targetId: '3'
}
```

```
{
	questionId: 'A',
	response: { ids: ['3'] },
	targetId: '2',
	version: '3.2'
}
```

These changes also apply to `assessment:setResponse` events.

#### Score events

* `score:set` events now generate a UUID. This UUID is included in a corresponding `score:clear`. This UUID is now the `id` of the event. The previous `id` property (in version `1.0.0`) is now the `itemId` property. Additionally `score:clear` now includes the score that was set by `score:set`.

**score:set** previous to 3.2:

```
{
	id: 'some-node-id',
	score: 100
}
```

**score:set** in 3.2:

```
{
	id: '00000000-0000-0000-0000-000000000000',
	itemId: 'some-node-id',
	score: 100
}
```

**score:clear** previous to 3.2:

```
{
	id: 'some-node-id'
}
```

**score:clear** in 3.2:

```
{
	id: '00000000-0000-0000-0000-000000000000',
	itemId: 'some-node-id',
	score: 100
}
```

#### New properties added

These are events that gained new properties (non-breaking changes):

* `assessment:setResponse` now has `assessmentId`
* `assessment:attemptStart` now has `attemptCount`
* `assessment:attemptEnd` now has `attemptCount`
