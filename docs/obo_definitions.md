---
id: obo_definitions
title: Obojobo Definitions
sidebar_label: Obojobo Definitions
---

* **Obojobo Draft Viewer**: This is the student-facing web application which renders an Obojobo Draft Document. This app handles the logic and display of the document. Additionally it records the interactions and responses from the student and maintains the state of the student's relationship with the document.
* **Obojobo Draft Document** (also simply referred to as a _document_): JSON describing the configuration and relationship of multiple OboNodes which are stored in Obojobo and used to render a module in the Obojobo system.
* **OboNode**: Data structure which defines the use of an Obojobo Component and its related data & content. Multiple OboNodes comprise an Obojobo Draft Document.
* **OboXML Format**: XML format describing an Obojobo Draft Document.
* **OboXML Document**: XML file following the OboXML format.
* **OboXML Parser**: Code which parses an OboXML Document to produce an Obojobo Draft Document.
* **Obojobo Component**: An installed sub-module with code defining the logic and display of this module. An OboNode references an installed Obojobo Component via its Component Identifier.
* **Component Identifier**: Obojobo components are identified and registered by an identifier in the format of `[Component namespace].[Component name]`. Default components are prefixed with `ObojoboDraft`, for example **[`ObojoboDraft.Chunks.Text`](obonode_text.md)**.
* **Component Namespace**: The prefix in an Obojobo component identifier, for example **`ObojoboDraft.Chunks`**. May contain alphanumeric characters and periods. Namespaces allows Obojobo components with the same component name to be differentated and installed.
* **Component Name**: The ending term in an Obojobo component identifier, for example `Text` in **[`ObojoboDraft.Chunks.Text`](obonode_text.md)**.
* **OboXML Element**: An XML element in an OboXML document representing an Obojobo component, for example `<ObojoboDraft.Chunks.Text>`. Uppercase.
* **OboXML Content Element**: An XML element in an OboXML document representing a content attribute of an Obojobo component, for example `<scoreActions>`. Lowercased. Additional parsers or extensions can parse these elements to construct a conformant content attribute for the resulting Obojobo Draft Document.
* **OboHTML Element**: An XML element which mimics the syntax of HTML elements (for example `<p>` or `<h1>`). These elements are read by the OboXML Parser and are converted into their OboXML representation. These are provided to make writing OboXML easier by providing a familar and less verbose syntax for common tasks.
* **Trigger**: OboNodes can listen for events that the Obojobo Draft Viewer or other Obojobo Components fire - these are described as triggers. When a trigger is activated one or more actions are executed.
* **Action**: Actions are contained inside triggers. Actions are fired as events through the Obojobo Draft Viewer - They contain a name and payload.
