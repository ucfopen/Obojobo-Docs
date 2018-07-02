---
id: obo_variables
title: Variables
sidebar_label: Variables
---

Obojobo Components can expose variables within the system. These can be used in text with a double curly brace syntax (for example `{{assessment:attemptsRemaining}}`). When an Obojobo Component is rendered containing recognized variables those variables will be replaced with the corresponding value.

## Variables Registered

### ObojoboDraft.Sections.Assessment

* `{{assessment:attemptsRemaining}}`: The number of attempts remaining or `"unlimited"` if no attempt limit is set.
* `{{assessment:attemptsAmount}}`: The total number of attempts or `"unlimited"` if no attempt limit is set.
