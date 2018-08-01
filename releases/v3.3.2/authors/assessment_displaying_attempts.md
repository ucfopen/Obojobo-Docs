---
title: Displaying Remaining Attempts
menus: authors_assessments_how_to
---

The number of attempts used and attempts remaining are availible using [Variables](variables.html).

This example shows how to display it on a start attempt button using two assessment variables:

- {% raw %}`{{assessment:attemptsRemaining}}`{% endraw %}
- {% raw %}`{{assessment:attemptsTaken}}`{% endraw %}

> Note: {{ 'ActionButton' | obo_node }}'s `label` attribute does not support variables. Use of a textGroup is required.

```xml
<ObojoboDraftDoc>
  <Module>
    <Content> <!-- Pages of learning content --> </Content>
    <Assessment id="my-assessment" attempts="3">

      <Page>
        <ActionButton>
          <textGroup>
            <t>Start Attempt ({% raw %}{{assessment:attemptsRemaining}}{% endraw %} remaining)</t>
          </textGroup>
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

      <QuestionBank>
        <!-- ...-->
      </QuestionBank>

      <scoreActions>
        <scoreAction for="[0,100]">
          <Page>
            <p>You have taken {% raw %}{{assessment:attemptsTaken}}{% endraw %} attempts.</p>
            <ActionButton>
              <textGroup>
                <t>Start Attempt ({% raw %}{{assessment:attemptsRemaining}}{% endraw %} remaining)</t>
              </textGroup>
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
  </Module>
</ObojoboDraftDoc>
```
