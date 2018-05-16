---
id: assessment_ltiReplaceResult
title: LTI replaceResult
sidebar_label: LTI replaceResult
---

Upon completing an Assessment Attempt a score will be sent (via LTI replaceResult) if the following conditions are met

1.  Not in preview mode
2.  LTI launch found with an outcome service endpoint
3.  Assessment Score is not `null` (no-score)

If these conditions are met the following will be sent:

**LTI Score** = Highest(**Assessment Score**) / 100
