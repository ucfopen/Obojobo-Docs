---
title: Question Selection Algorithm
menu: dev_misc
---

This describes how an Assessment Attempt quiz is generated:

1.  Add the top-most QuestionBank to the list of _Assessment Attempt Questions_.
1.  On the top-most QuestionBank run the **FindQuestions** routine outlined below:

**FindQuestions**(QuestionBank _QB_):

1.  Sort _QB_'s Question and QuestionBank children by the following criteria
    - If `select` is `sequential`: Document order
    - If `select` is `random`: Random
    - If `select` is `random-unseen`: Number of times this child has been used in an Assessment Attempt quiz. If two children have been used an equal number of times then sort these two children randomly.
1.  Select the top-most number of children equal to `choose`. If `choose` is greater than the number of children to choose then select all children. Replace _QB_ in the _Assessment Attempt Questions_ list with all selected children.
1.  For every _Child_ in _QB_'s children:
    1.  Run **FindQuestions**(_Child_)
