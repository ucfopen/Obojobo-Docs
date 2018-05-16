---
id: assessment_creation
title: Creating Assessments
---

1.  Add an Assessment Section
    1.  (Optional) Set a number of attempts
    1.  (Optional) Specify the review mode
    1.  (Optional) Define an Assessment Rubric
1.  Inside your Assessment Section create a landing page that students will see when they visit the Assessment section for the first time.
1.  In your landing page add a button which will start the Assessment
1.  Inside your Assessment Section create a QuestionBank - This will form the pool of available questions to choose from when Assessment Attempt quizzes are generated.
    1.  (Optional) Specify options for how questions are chosen
1.  Inside your QuestionBank create assessment Questions
1.  Inside your Assessment Section create the post-attempt summary page with Score Actions
    1.  (Optional) Create multiple post-attempt pages for different Assessment Scores
1.  (Optional) Inside your Assessment Section add triggers that will lock and unlock navigation when an Assessment Attempt is started and ended.

**NOTE**: The `Page` OboNode must come before the `QuestionBank` OboNode. The order of any `scoreActions`, `rubric` and `triggers` XML elements are not important.
