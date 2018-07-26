---
title: New Questions for each Attempt
menus: authors_how_to
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

QuestionBanks can be infinitely be nested, but limiting to two levels is recommended. For a complete technical description on how questions are chosen for Assessment Attempts refer to the [**Assessment Question Selection Algorithm**](assessment_questionAlgorithm.md).

> @TODO - where is the link above?

## Question Alternates

The above structure can be used to mimic how previous versions of Obojobo implemented **Question Alternates**.

Making different questions for the same topic in each child QuestionBank, the author can ensure students are presented with questions on the topics that correspond with the objectives of the module on each attempt.

```xml
<!-- ... -->
    <Assessment id="my-assessment" attempts="3">
      <Page><!-- ... --></Page>

      <QuestionBank choose="1" select="sequential">
        <!-- 1st attempt -->
        <QuestionBank>
          <Question><!-- topic 1 question --></Question>
          <Question><!-- topic 2 question --></Question>
        </QuestionBank>
        <!-- 2nd attempt -->
        <QuestionBank>
          <Question><!-- topic 1 alternate--></Question>
          <Question><!-- topic 2 alternate--></Question>
        </QuestionBank>
      </QuestionBank>

      <!-- ... -->
    </Assessment>
<!-- ... -->
```
