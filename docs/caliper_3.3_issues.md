---
id: caliper_3.3_issues
title: Known Issues
sidebar_label: Known Issues
---

* IRIs are not dereferenceable
* Scores are UUIDs and have no IRI
* Some extension properties are _ECMAScript Date toString values_ but ideally should be **DateTime**s to align with Caliper standards.
* **OboNode**s are of Caliper type **Frame** but could be typed based on their content (for example **Page** or **MediaObject** or **AssignableDigitalResource**)
* "Hid" events for hiding a question incorrectly specify an actor of type **User** when the **Viewer Client** should be specified instead.
