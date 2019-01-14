---
title: Creating Your First Assessment
menus:
  writing_assessments:
    weight: -2
---

## The Role of Assessments

Obojobo Modules are designed to combine content and targeted assessment into a single module (however you are not required to have an Assessment section).

Assessments are how Obojobo creates and collects scores. While practice questions can be created throughout the content section, they are not usable for collecting score data.

Assessment scores are used to evaluate a students knowledge or mastery of the Module's content. Assessment scores can be exported and automatically transferred to an LMS grade-book.

Currently Obojobo supports only a single Assessment per Module.

## Creating An Assessment

This is a step by step guide to create a simple Assessment.

### 1. Add an Assessment Section

Assessment Sections must be direct children of the Module tag. Their siblings can be any number of Content sections in any order. Before, after, or sandwiched between multiple Content sections.

Add the Assessment's `id` attribute with a unique identifier of your liking, we'll need it later. You can use any unique string as long as it only contains letters, numbers and dashes (`-`). Here we've used `"my-assessment"`.

```xml
<ObojoboDraftDoc>
  <Module>
    <Content><!-- ... --></Content>

    <Assessment id="my-assessment"></Assessment>

  </Module>
</ObojoboDraftDoc>
```

> The examples will omit the Doc, Module and Content tags as we continue in this guide.

### 2. Set the Number of Attempts (optional)

Adding an attempt limit will restrict the number of times a student can submit an assessment score. In the example below we've allowed for a total of three attempts. Omit this value (or specify `attempts="unlimited"`) to allow for an unlimited number of attempts.

```xml
<!-- ... -->
<Assessment id="my-assessment" attempts="3">
</Assessment>
<!-- ... -->
```

> There are many different and nuanced reasons to use attempt limits. Consider what the module's purpose is and what role the attempt limit plays for all types of students.
>
> Low attempt limits are high-stress, but can be valuable for laser-focused evaluations. Conversely, high limits can allow more opportunities for struggling students to perform well. However, they can also encourage guessing.
>
> There are many theories and practices here with no generic rules that apply to all learning models.

### 3. Set Review Mode (optional)

After each assessment attempt students can see which questions they got right or wrong but their responses (and other answer choices) will be hidden. You can provide more feedback by enabling Assessment Review. With Assessment Review students can the full question, their responses, the correct answers and any answer feedback and question explanations (if they exist).

This setting is dictated by the `review` value. The default value is `"never"` meaning Assessment Review is never shown. Set `review="always"` to always show attempt review after each attempt. You can also only show assessment review after a student has no more attempts left - for that specify `review="no-attempts-remaining"`.

In the example below we've specified to always show assessment review:

```xml
<!-- ... -->
<Assessment
  id="my-assessment"
  attempts="3"
  review="always"
>
</Assessment>
<!-- ... -->
```

### 4. Add a Scoring Rubric (optional)

Rubrics allow you to define how scores are calculated. You can do things like requiring students to achieve an 80% or higher attempt score. Rubrics have several options and since this is our first assessment we'll leave it out for now. Take a look at the Assessments How To section if you'd like to investigate what you can do with rubrics.

### 5. Add an Intro Page

Assessments must contain 2 child nodes, the **first required child** is an intro page. This page can contain any text content like instructions, objectives, or guidelines for the assessment.

> The Intro Page is only shown before the first attempt is started.

```xml
<Assessment
  id="my-assessment"
  attempts="3"
  review="always"
>
  <Page> </Page>
</Assessment>
```

### 6. Add a Start Button

Now we need a way for students to take the assessment. We can do this by adding an ActionButton. We'll wire this button up so that when clicked the assessment will be started - this is done by setting the `id` property inside the `ActionButton` value element to the id of the assessment we created.

```xml
<Assessment id="my-assessment" attempts="3" review="always">
  <Page>

    <ActionButton label="Start Attempt">
      <triggers>
        <trigger type="onClick">
          <actions>
            <action type="assessment:startAttempt">
              <value id="my-assessment" />
            </action>
          </actions>
        </trigger>
      </triggers>
    </ActionButton>

  </Page>
</Assessment>
```

> Triggers, trigger, actions, action? This code is part of Obojobo's programmable document structure. It allows you to define behavior based on conditions. Check out {{ "action" | obo_node }} for more information.

### 7. Add a Question Bank

The second **required** child of the Assessment tag is a {{ 'QuestionBank' | obo_node }}. In the next step we'll use it to contain our assessment {{ 'Question' | obo_node }}s.

```xml
<Assessment id="my-assessment" attempts="3" review="always">
  <Page> <!-- ... --> </Page>

  <!-- Page MUST come before QuestionBank -->
  <QuestionBank></QuestionBank>

</Assessment>
```

> We're keeping it simple for now but QuestionBanks have some options to allow you to create randomized and different assessment attempt quizzes. Take a look at {{ 'QuestionBank' | obo_node }} and [New Questions for each Attempt](assessment_new_quizzes.html) to see how it's done.

### 8. Add a Question

Add a {{ 'Question' | obo_node }} to the Question Bank.

When a student takes an assessment attempt they will be presented with all the questions in your QuestionBank, so we need to create some questions! Below is a simple multiple choice question with 2 possible answers as an example.

```xml
<Assessment id="my-assessment" attempts="3" review="always">
  <Page> <!-- ... --> </Page>

  <!-- Page MUST come before QuestionBank -->
  <QuestionBank>

    <Question>
      <p>What is 2+2?</p>
      <MCAssessment>
        <MCChoice score="0">
          <MCAnswer><p>2</p></MCAnswer>
        </MCChoice>
        <MCChoice score="100">
          <MCAnswer><p>4</p></MCAnswer>
        </MCChoice>
      </MCAssessment>
    </Question>

  </QuestionBank>

</Assessment>
```

> Have a look at {{ 'Question' | obo_node }} and {{ 'MCAssessment' | obo_node }} to see some options available for customizing your questions.

### 9. Add a Post-Attempt page

It's a **required** page that is displayed after the assessment.

The simplest example is a single page for all scores. Define a {{ 'scoreAction' | obo_node }} for all scores (`[0,100]`) and a Page containing another ActionButton used to begin another attempt.

```xml
<Assessment id="my-assessment" attempts="3" review="always">
  <Page> <!-- ... --> </Page>
  <QuestionBank> <!-- ... --> </QuestionBank>

  <scoreActions>
    <scoreAction for="[0,100]">
      <Page>
        <ActionButton label="Start Attempt">
          <triggers>
            <trigger type="onClick">
              <actions>
                <action type="assessment:startAttempt">
                  <value id="my-assessment" />
                </action>
              </actions>
            </trigger>
          </triggers>
        </ActionButton>
      </Page>
    </scoreAction>
  </scoreActions>

</Assessment>
```

> Multiple pages can be added for different feedback depending on attempt score. Perhaps you could direct students to additional learning materials when their score is below a certain threshold. View [Post-Attempt Pages](post_attempt_pages.html) to see how its done.

### 10. Add Triggers to lock and unlock Navigation

While it's not required we suggest locking out navigation to the content during assessment.

To do this add two triggers to the Assessment - one that locks the nav when the attempt begins and another that unlocks it when it's complete.

```xml
<Assessment id="my-assessment" attempts="3" review="always">
  <Page> <!-- ... --> </Page>
  <QuestionBank> <!-- ... --> </QuestionBank>
  <scoreActions> <!-- ... --> </scoreActions>

  <triggers>
    <trigger type="onStartAttempt">
      <actions>
        <action type="nav:lock" />
      </actions>
    </trigger>
    <trigger type="onEndAttempt">
      <actions>
        <action type="nav:unlock" />
      </actions>
    </trigger>
  </triggers>

</Assessment>
```

> **NOTE**: Although {{ 'Page' | obo_node }} must be first and {{ 'QuestionBank' | obo_node }} must be second, the order of any {{ 'scoreAction' | obo_node }}, {{ 'rubric' | obo_node }} and {{ 'trigger' | obo_node }} tags are not important.

## Complete Example XML

Here's a full example of the step-by-step assessment created in the previous steps.

```xml
<ObojoboDraftDoc>
  <Module>
    <Content> <!-- Pages of learning content --> </Content>
    <Assessment id="my-assessment" attempts="3" review="always">

       <!-- Assessment Intro page, must be first child -->
      <Page>
        <!-- Button to start assessment attempt -->
        <ActionButton label="Start Attempt">
          <triggers>
            <trigger type="onClick">
              <actions>
                <action type="assessment:startAttempt">
                  <value id="my-assessment" />
                </action>
              </actions>
            </trigger>
          </triggers>
        </ActionButton>
      </Page>

      <!-- QuestionBank, must be second -->
      <QuestionBank>
        <!-- A multiple choice question with 2 answer choices -->
        <Question>
          <p>What is 2+2?</p>
          <MCAssessment>
            <MCChoice score="0">
              <MCAnswer><p>2</p></MCAnswer>
            </MCChoice>
            <MCChoice score="100">
              <MCAnswer><p>4</p></MCAnswer>
            </MCChoice>
          </MCAssessment>
        </Question>
      </QuestionBank>

      <scoreActions>
        <scoreAction for="[0,100]">
          <!-- Post-attempt page for all possible scores -->
          <Page>
            <!-- Button to start another assessment attempt -->
            <ActionButton label="Start Attempt">
              <triggers>
                <trigger type="onClick">
                  <actions>
                    <action type="assessment:startAttempt">
                      <value id="my-assessment" />
                    </action>
                  </actions>
                </trigger>
              </triggers>
            </ActionButton>
          </Page>
        </scoreAction>
      </scoreActions>

      <!-- Lock Navigation during an attempt -->
      <triggers>
        <trigger type="onStartAttempt">
          <actions>
            <action type="nav:lock" />
          </actions>
        </trigger>
        <trigger type="onEndAttempt">
          <actions>
            <action type="nav:unlock" />
          </actions>
        </trigger>
      </triggers>

    </Assessment>
  </Module>
</ObojoboDraftDoc>
```

### Student Walk Through

1.  Student clicks to the Assessment link in the navigation menu.
2.  Obojobo shows the Assessment Intro Page.
3.  Student clicks the Start Attempt button.
4.  Obojobo begins an attempt, showing them the one question in the Question Bank.
5.  The navigation to the content is disabled.
6.  The student answers the question.
7.  The student clicks submit Attempt (a built in button).
8.  Obojobo scores the student's answers.
9.  Obojobo reduces the remaining attempts for this student by 1.
10. The post-attempt page matching the student's score is displayed.
11. The answer review is displayed
12. The student can click the post-attempt page's ActionButton to try again.

![Assessment Walk Through]({{ site.baseurl }}{% link /assets/images/assessment_walk_through.gif %})

## Congrats!

You've completed your first assessment. If you're interested in the other options and ways you can customize your assessment we have several examples in the Assessments How To section.
