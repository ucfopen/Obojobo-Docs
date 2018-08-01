---
title: Obojobo Glossary
menu: dev_misc
---

## Software Component Concepts

**Draft Viewer**: This is the student-facing web application which renders an Obojobo Draft Document. This app handles the logic and display of the document. Additionally it records the interactions and responses from the student and maintains the state of the student's relationship with the document.

**Draft Editor**: This is the interface that authors use to create Obojobo Documents.

**Obojobo Server**: This is the Express.js application that serves Obojobo's assets and performs server side logic, like storing and retrieving documents from the database.

**Document XML Parser**: This library handles converting OboXML into an Obojobo Draft Document.

## Obojobo Document

**Obojobo Draft Document** (also simply referred to as a _Document_): JSON describing the configuration and relationship of multiple OboNodes which are stored in Obojobo and used to render a module in the Obojobo system.

**OboXML Format**: XML format describing an Obojobo Draft Document. This format is suitable for authoring documents by hand much like an HTML page.

**OboXML Document**: XML file using the OboXML format.

**OboXML Parser**: Code which parses an OboXML Document to produce an Obojobo Draft Document.

**OboXML Element**: An XML element in an OboXML document representing an OboNode Component, for example `<ObojoboDraft.Chunks.Text>`. They always start with an Uppercase letter.

**Content Block**: Objects defined on the `content` property of **OboNodes**, for example {{ 'textGroup' | obo_node }}.

**OboXML Content Block Element**: An XML element in an OboXML document representing a content block attribute of an OboNode Component, for example `<scoreActions>`. Lowercased. Additional parsers or extensions can parse these elements to construct a conformant content attribute for the resulting Obojobo Draft Document.

**OboHTML Element**: An XML element which mimics the syntax of HTML elements (for example `<p>` or `<h1>`). These elements are read by the OboXML Parser and are converted into their OboXML representation. These are provided to make writing OboXML easier by providing a familiar and less verbose syntax for common tasks.

**OboNode**: Data structure which defines the use of an OboNode Component and its related data & content. Multiple OboNodes comprise an Obojobo Draft Document.

**OboNode Component**: An installed sub-module with code defining the logic and display of this module. An OboNode references an installed OboNode Component via its Component Identifier.

**Component Identifier**: OboNode Components are identified and registered by an identifier in the format of `[Component namespace].[Component name]`. Default components are prefixed with `ObojoboDraft`, for example `ObojoboDraft.Chunks.Text`.

**Component Namespace**: The prefix in an OboNode Component identifier, for example `ObojoboDraft.Chunks`. May contain alphanumeric characters and periods. Namespaces allows OboNode Components with the same component name to be differentiated and installed.

**Component Name**: The ending term in an OboNode Component identifier, for example `Text` in `ObojoboDraft.Chunks.Text`.

**Trigger**: OboNodes can listen for events that the Obojobo Draft Viewer or other OboNode Components fire - these are described as triggers. When a trigger is activated one or more actions are executed.

**Action**: Actions are contained inside triggers. Actions are fired as events through the Obojobo Draft Viewer - They contain a name and payload.

## Assessments

**Assessment**: An {{ 'Assessment' | obo_node }} section. Includes the assessment intro, attempt quizzes and post-assessment review.

**Assessment Review**: The post-assessment page showing which questions had been answered correctly and incorrectly.

**Assessment Full-Review**: An enhanced review which shows student responses along with correct answers and any feedback, if available. Assessment Full-Review is shown based on the value of the `review` property on {{ 'Assessment' | obo_node }}.

**Attempt**: A generated quiz created from {{ 'QuestionBank' | obo_node }} nodes in an Assessment.

**Rubric**: A {{ 'rubric' | obo_node }} Content Block which defines rules for how to calculate attempt scores.

**Raw Attempt Score**: This is an attempt score calculated from the number of correct responses given in an attempt.

**Attempt Status**: Represents the state of an attempt, determined by the Raw Attempt Score and a rubric.

**Post-Rubric Score**: The resulting counted attempt score calculated from the Rubric and Attempt Status.

**Overall Assessment Score**: The final score for an Assessment. This is the highest of all Post-Rubric Scores.

## Misc

**Visit**: Used to represent a view of a specific document by a specific user. The Visit is used to corrilate all of the data about the viewing session.
