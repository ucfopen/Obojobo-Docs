---
title: Post-Attempt Pages
menus: authors_assessments_how_to
---

After an attempt is taken students will be presented with a Post-Attempt page. These are creating using {{ 'scoreAction' | obo_node }} elements. You must have a post-attempt page to cover every score that can be awarded. The page that will be displayed will be based on their Overall Assessment Score.

On post-attempt pages you most likely will want to include a button for the student to start another assessment attempt. You can also define any additional content you'd like - you could provide a link to additional learning materials as an example.

## Single post-attempt page for all scores

Here's an example of a single post-attempt page. The `for` property defines what scores this scoreAction is for. The `"[0,100]"` syntax in this example means the range of the scores 0% to 100%.

```xml
<!-- ... -->
  <Assessment id="my-assessment">
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
<!-- ... -->
```

If you have a `pass-fail` {{ 'rubric' | obo_node }} that can award `no-score` you'll need to additionally define a scoreAction for `no-score`. Here's an example:

```xml
<!-- ... -->
  <Assessment id="my-assessment">
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

	  <scoreAction for="no-score">
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
<!-- ... -->
```

## Defining different pages for different scores

Here's an example of providing a page for scores 80-100% and another page for scores below 80%:

```xml
<!-- ... -->
  <Assessment id="my-assessment">
    <Page> <!-- ... --> </Page>
    <QuestionBank> <!-- ... --> </QuestionBank>

    <scoreActions>

      <scoreAction for="[80,100]">
        <Page> <!-- ... --> </Page>
      </scoreAction>

	  <scoreAction for="[0,80)">
        <Page> <!-- ... --> </Page>
      </scoreAction>

    </scoreActions>
  </Assessment>
<!-- ... -->
```

Note the different `for` values. The `[` and `]` brackets in `"[80,100]"` means scores from 80% to 100%. In other words brackets are **inclusive**. The `)` parenthesis is **exclusive**, so `"[0,80)"` means scores from 0% up to (but not-including) 80%.

While the above examples use a range of scores you can also specify single values. Here's an example where we have one page for 100% scores only and a page for all other scores.

```xml
<!-- ... -->
  <Assessment id="my-assessment">
    <Page> <!-- ... --> </Page>
    <QuestionBank> <!-- ... --> </QuestionBank>

    <scoreActions>

      <scoreAction for="100">
        <Page> <!-- ... --> </Page>
      </scoreAction>

	  <scoreAction for="[0,100)">
        <Page> <!-- ... --> </Page>
      </scoreAction>

    </scoreActions>
  </Assessment>
<!-- ... -->
```

Again, if you have a `pass-fail` {{ 'rubric' | obo_node }} that can award `no-score` you'll need to additionally define a scoreAction for `no-score`.

## Determining which pages are displayed

The post-attempt page is displayed based on a student's Overall Assessment Score. This means that if a student has a 100% as their highest attempt score and scores a 75% on a subsequent attempt they will be shown the post-attempt page for 100%, not 75%.

In the case of overlapping score ranges the first matching scoreAction page is chosen. Consider the following example:

```xml
<!-- ... -->
  <Assessment id="my-assessment">
    <Page> <!-- ... --> </Page>
    <QuestionBank> <!-- ... --> </QuestionBank>

    <scoreActions>

      <scoreAction for="[0,80]">
        <Page> <!-- ... --> </Page>
      </scoreAction>

	  <scoreAction for="[80,100]">
        <Page> <!-- ... --> </Page>
      </scoreAction>

    </scoreActions>
  </Assessment>
<!-- ... -->
```

If a student has an 80% as their Overall Assessment Score then they will be shown the first scoreAction page since `"[0,80]"` matches their 80%. The second page with a range of `"[80,100"]` would also match 80% but the first page has priority. This probably wasn't intentional. Instead it would be better to use parentheses `()` so that the 80% score wasn't matched by two different pages.

This would be the recommended way to define the two pages above:

```xml
<!-- ... -->
  <Assessment id="my-assessment">
    <Page> <!-- ... --> </Page>
    <QuestionBank> <!-- ... --> </QuestionBank>

    <scoreActions>

      <scoreAction for="[80,100]">
        <Page> <!-- ... --> </Page>
      </scoreAction>

	  <scoreAction for="[0,80)">
        <Page> <!-- ... --> </Page>
      </scoreAction>

    </scoreActions>
  </Assessment>
<!-- ... -->
```
