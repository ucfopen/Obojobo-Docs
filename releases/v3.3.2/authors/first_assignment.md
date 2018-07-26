---
title: Creating Your First Assessment
menus: writing_assessments
---

## The Role of Assessments

Obojobo Modules are designed to combine content and targeted assessment into a single module.

However, Obojobo documents are not required to have an Assessment section.

Assessments are how Obojobo creates and collects scores. While practice questions can be created throughout the content section, they are not usable for collecting score data.

Assesment sections collect scores to evaluate a students knowledge or mastery of the Module's content. Assesment scores can be exported and automatically transferred to an LMS's gradebook.

Currently Obojobo supports only a single Assessment per Module.

## Creating An Assessment

This is a step by step guide to create a very basic Assessment.

### 1. Add an Assessment Section

Assessment Sections must be direct children of the Module tag.  Their siblings can be any number of Content sections in any order. Before, after, or sandwiched between multile Content sections.

Add the Assessment's `id` attribute with a unique identifier of your liking, we'll need it later.

**Allowed Values**: any unique string.

```xml
<ObojoboDraftDoc>
  <Module>
    <Content><!-- ... --></Content>

    <Assessment id="my-assessment"></Assessment>

  </Module>
</ObojoboDraftDoc>
```
> The examples will ommit the Doc, Module and Content tags as we continue in this guide.

### 2. Set the Number of Attempts (optional)

Adding an attempt limit will restrict the number of times a student can submit an assessment score.  If ommited, it defaults to `"unlimited"`.

**Allowed Values**: `"unlimited"`, integers from `"1"` to `"256"`

```xml
<!-- ... -->
<Assessment id="my-assessment" attempts="3">
</Assessment>
<!-- ... -->
```

> There are many different and nuanced reasons to use attempt limits.  Think critically about what the module's purpose is and what role the attempt limit plays for all types of students.
>
> Low attempt limits are high-stress, but can be valuable for laser-focused evaluations.  Conversely, high limits can allow a more diverse students the ability to perform well. However, they can also encourage guessing.
>
> We've seen evidence that many students don't perform better after a certain number of attempts - a sure sign that they simply don't understand the topic at hand.  There are many theories and practices here with no generic rules that apply to all learning models.
>
> Experiment and adjust as needed.


### 3. Set Review Mode (optional)

Reviews modes dictate how students are allowed to review their answers for this attempt.  The default value is `"never"`.

**Allowed Values**: `"never"`, `"always"`, `"no-attempts-remaining"`

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

Rubrics specify how an Assessment Score is calculated.

Rubrics allow complex scoring rules outlined by {{ 'Assessment' | obo_node }}.

This example will use the default rubric type.

```xml
<!-- ... -->
<Assessment
  id="my-assessment"
  attempts="3"
  review="always"
>
  <rubric type='attempt'></rubric>
</Assessment>
<!-- ... -->
```

### 5. Add an Intro Page

Assessments must contain 2 child nodes, the **first required child** is an intro page. This page can contain any text content like instructions, objectives, or guidelines for the assessment.

> The Intro Page is only shown before the first attempt is started.

```xml
<Assessment
  id="my-assessment"
  attempts="3"
  review="always"
>
  <rubric type='attempt'></rubric>

  <Page></Page>

</Assessment>
```

### 6. Add a Start Button

To start an Assessment, the intro page needs an ActionButton.

Use the assessment's `id` value to indicate which assessment should be started.

> Obojobo currently supports one Assessment per Module.

```xml
<Assessment id="my-assessment" attempts="3" review="always">
  <rubric type='attempt'></rubric>
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

### 7. Add a Question Bank

The second **required** child of the Assessment tag is a {{ 'QuestionBank' | obo_node }}.

```xml
<Assessment id="my-assessment" attempts="3" review="always">
  <rubric type='attempt'></rubric>
  <Page> <!-- ... --> </Page>

  <!-- Page MUST come before QuestionBank -->
  <QuestionBank></QuestionBank>

</Assessment>
```

### 7. Add a Question

Add a {{ 'Question' | obo_node }} to the Question Bank.

Below is a simple multiple choice question with 2 possible answers.

```xml
<Assessment id="my-assessment" attempts="3" review="always">
  <rubric type='attempt'></rubric>
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

### 8. Add an After-Attempt page

It's a **required** page that is displayed after the assessment.

The simplest example is a single page for all scores. Define a {{ 'scoreAction' | obo_node }} for all scores (`[0,100]`) and a Page containing another ActionButton used to begin another attempt.

Multiple pages can be added for different feedback depending on attempt score. Perhaps words of encouragement or advice when the student's score is below a certain threshold.

```xml
<Assessment id="my-assessment" attempts="3" review="always">
  <rubric type='attempt'></rubric>
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
### 9. Add Triggers to lock and unlock Navigation

Obojobo suggests locking out navigation to the content durring and assessment.  This is not required.

Add 2 triggers to the Assessment, one that locks the nav when the attempt begins, and one that unlocks it when it's complete.

```xml
<Assessment id="my-assessment" attempts="3" review="always">
  <rubric type='attempt'></rubric>
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

> **NOTE**: Although {{ 'Page' | obo_node }} must be first, and {{ 'QuestionBank' | obo_node }} must be second, the order of any {{ 'scoreAction' | obo_node }}, {{ 'rubric' | obo_node }} and {{ 'trigger' | obo_node }} tags are not important.


## Complete Example XML

Here's a full example of the step-by-step assessment created in the previous steps.

```xml
<ObojoboDraftDoc>
  <Module>
    <Content> <!-- Pages of learning content --> </Content>
    <Assessment id="my-assessment" attempts="3" review="always">
      <rubric type='attempt'></rubric>

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

      <!-- Lock Navigation durring an attempt -->
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

1. Student clicks to the Assessment link in the navigation menu.
2. Obojobo shows the Assessment Intro Page.
3. Student clicks the Start Attempt button.
4. Obojobo begins an attempt, showing them the one question in the Question Bank.
5. The navigation to the content is disabled.
6. The student answers the question.
7. The student clicks submit Attempt (a built in button).
8. Obojobo scores the student's answers.
9. Obojobo reduces the remaining attempts for this student by 1.
10. The post-attempt page matching the student's score is displayed.
11. The answer review is displayed
12. The student can click the post-attempt page's ActionButton to try again.

![Assessment Walk Through]({{ site.baseurl }}{% link /assets/images/assessment_walk_through.gif %})

