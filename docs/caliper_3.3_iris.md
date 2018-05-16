---
id: caliper_3.3_iris
title: IRIs and Objects
sidebar_label: IRIs and Objects
---

### IRIs

* **System**: SoftwareApplication - `/api/system`
* **Viewer Client**: SoftwareApplication - `/api/viewer/client`
* **App Server**: SoftwareApplication - `/api/server`
* **Session**: Session - `/api/session/:sessionId`
* **Launch**: LtiSession - `/api/launch/:launchId`
* **User**: Person - `/api/user/:userId`
* **Draft**: WebPage - `/api/draft/:draftId`
* **OboNode**: Frame - `/api/draft/:draftId#:nodeId`
* **OboNode with Context**: Frame - `/api/draft:draftId#:nodeId?context=:contextName`
* **Practice Question Attempt**: Attempt - `/api/practice/:draftId/:oboNodeId`
* **Assessment**: Assessment - `/api/assessment/:draftId/:assessmentId`
* **Attempt**: Attempt - `/api/attempt/:attemptId`
* **Picker**: Picker - `/api/picker`
* **Visit**: Visit - `/api/visit/:visitId`

### Practice Question Score:

* Properties:
  * type: **Score**
  * id: **Generated UUID** (Generated from **Viewer Client**)
  * maxScore: _decimal_ (100)
  * scoreGiven: _decimal_ (0-100)
  * dateCreated: **DateTime**
  * attempt: **Practice Question Attempt**
  * scoredBy: **Viewer Client**

### Assessment Attempt Score:

* Properties:
  * type: **Score**
  * id: **Generated UUID** (Generated from **App Server**)
  * maxScore: _decimal_ (100)
  * scoreGiven: _decimal_ (0-100)
  * dateCreated: **DateTime**
  * attempt: **Assessment Attempt**
  * scoredBy: **App Server**
