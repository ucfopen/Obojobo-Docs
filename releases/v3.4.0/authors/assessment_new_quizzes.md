---
title: New Questions for each Attempt
menus: authors_assessments_how_to
---

QuestionBank can be set up to present an entirely separate pool of questions for each attempt.

## Maximizing Randomness

Given this abbreviated example:

```xml
<!-- ... -->
  <Assessment id="my-assessment" attempts="3">
    <Page> <!-- ... --> </Page>

    <QuestionBank choose="3" select="random-unseen">
      <!-- Imagine 10 Assessment questions here -->
    </QuestionBank>

    <!-- ... -->
  </Assessment>
<!-- ... -->
```

Obojobo will randomly pick three questions from the pool in the QuestionBank for each attempt.

Once used, questions are then removed from the pool, having been "seen".

Each additional attempt will select another random set of three questions from the remaining pool.

If the pool of unseen questions is exhausted, Obojobo will refill the pool with questions that have only been seen once and begin randomly selecting again.

This ensures maximum randomization and minimum re-use of questions.

## Unique questions per Attempt

Nesting QuestionBanks allows full control of which questions are shown on each attempt.

```xml
<!-- ... -->
  <Assessment id="my-assessment" attempts="3">
    <Page><!-- ... --></Page>

    <QuestionBank choose="1" select="sequential">
      <QuestionBank> <!-- 1st attempt --> </QuestionBank>
      <QuestionBank> <!-- 2nd attempt --> </QuestionBank>
      <QuestionBank> <!-- 3rd attempt --> </QuestionBank>
    </QuestionBank>

    <!-- ... -->
  </Assessment>
<!-- ... -->
```

This method uses a new pool of questions for each attempt, ensuring no reuse of questions.

If allowed a fourth attempt, the selection would wrap around, starting again with the first QuestionBank.

> QuestionBanks can be infinitely be nested, but limiting to two levels is recommended. View [**Question Selection Algorithm**](../developers/question_selection_algorithm.html) for a complete technical description on how questions are chosen for Assessment Attempts.

## Question Alternates

The above structure can be used to mimic how previous versions of Obojobo implemented **Question Alternates**.

```xml
<!-- ... -->
  <Assessment id="my-assessment" attempts="3">
    <Page><!-- ... --></Page>

    <QuestionBank>

      <QuestionBank choose="1" select="random">
        <Question><!-- topic A question --></Question>
        <Question><!-- topic A question alternate --></Question>
      </QuestionBank>

      <QuestionBank choose="1" select="random">
        <Question><!-- topic B question --></Question>
        <Question><!-- topic B question alternate --></Question>
      </QuestionBank>

    </QuestionBank>

    <!-- ... -->
  </Assessment>
<!-- ... -->
```
