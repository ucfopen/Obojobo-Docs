---
id: events_3.3_additionalInformation
title: Additional Information
sidebar_label: Additional Information
---

### LTI Status values:

* `'success'`: The LTI replaceResult was sent successfully
* `'not_attempted_no_outcome_service_for_launch'`: The LTI did not have an outcome service so no replaceResult was attempted
* `'not_attempted_score_is_null'`: The assessment score was null so no replaceResult was attempted
* `'not_attempted_preview_mode'`: User is in preview mode so no replaceResult was attempted
* `'error_replace_result_failed'`: Fatal error - The replaceResult failed
* `'error_no_assessment_score_found'`: Fatal error - Obojobo was unable to find the assessment score to send.
* `'error_no_secret_for_key'`: Fatal error - There was no secret found for the given key
* `'error_no_launch_found'`: Fatal error - Obojobo was unable to find the LTI launch details
* `'error_launch_expired'`: Fatal error - The LTI launch has expired
* `'error_score_is_invalid'`: Fatal error - The score to be sent was not a 0-1 value.
* `'error_unexpected'`: Fatal error - An unexpected error occurred.

### LTI Gradebook Status values:

* `'ok_null_score_not_sent'`: The assessment score was null so no score was sent
* `'ok_no_outcome_service'`: The LTI did not have an outcome service so no replaceResult was attempted
* `'ok_gradebook_matches_assessment_score'`: Either the new assessment score was sent successfully or the assessment score being sent matches the last assessment score that was sent
* `'ok_preview_mode'`: User is in preview mode so no replaceResult was attempted
* `'error_newer_assessment_score_unsent'`: A newer score was not sent successfully so the LTI tool consumer does not have the latest score.
* `'error_state_unknown'`: Obojobo was not able to determine the history of what was sent to the LTI tool consumer so Obojobo can't determine if the tool consumer should be sent a score or if it has the latest score.
* `'error_invalid'`: This is an unexpected state. This state is a fatal error.
