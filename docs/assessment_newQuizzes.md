---
id: assessment_newQuizzes
title: New Quizzes for each Attempt
sidebar_label: New Quizzes for each Attempt
---

Question Bank options allow you to create new quizzes for each attempt.

```xml
<ObojoboDraftDoc>
  <Module>
    <Content> <!-- Content goes here --> </Content>
    <Assessment id="my-assessment" attempts="3">
      <Page> <!-- Landing page --> </Page>
      <QuestionBank choose="3" select="random-unseen">
        <!-- Assessment questions -->
      </QuestionBank>
      <scoreActions> <!-- Score Actions --></scoreActions>
    </Assessment>
  </Module>
</ObojoboDraftDoc>
```

This will pick three questions from the primary QuestionBank at random for the first attempt. For each additional attempt another random set of three questions will be selected but questions that were not already used in a quiz will be selected before previously seen questions (specified by the `'random-unseen'` `select` property).

QuestionBanks can also be nested. This can allow you to generate new quizzes for each attempt with different amounts of questions.

```xml
<ObojoboDraftDoc>
  <Module>
    <Content> <!-- Content goes here --> </Content>
    <Assessment id="my-assessment" attempts="3">
      <Page> <!-- Landing page --> </Page>
      <QuestionBank choose="1" select="sequential">
        <QuestionBank> <!-- First attempt question bank --> </QuestionBank>
        <QuestionBank> <!-- Second attempt question bank --> </QuestionBank>
        <QuestionBank> <!-- Third attempt question bank --> </QuestionBank>
      </QuestionBank>
      <scoreActions> <!-- Score Actions --></scoreActions>
    </Assessment>
  </Module>
</ObojoboDraftDoc>
```

Now each new attempt will display the next inner QuestionBank. On the fourth attempt the selection algorithm will "wrap around" and select the first QuestionBank again. These inner QuestionBanks can contain as many questions as desired.

QuestionBanks can be infinitely be nested but this is not recommended. Limiting the amount of nested QuestionBanks to two levels (as in the above example) is preferred. For a complete technical description on how questions are chosen for Assessment Attempts refer to the **Assessment Attempt Quiz Question Selection Algorithm** later on in this document.
