---
id: obo_minimal_document
title: Minimal Document
sidebar_label: Minimal Document
---

While the Obojobo structure is flexible the current default or base nodes used to create a document expect the following general structure:

* Module
  * Sections
    * Pages
      * Chunks

Here is a JSON example of such a minimal document:

```json
{
  "id": "module",
  "type": "ObojoboDraft.Modules.Module",
  "content": {
    "title": "My Module"
  },
  "children": [
    {
      "id": "content",
      "type": "ObojoboDraft.Sections.Content",
      "children": [
        {
          "id": "page-1",
          "type": "ObojoboDraft.Pages.Page",
          "content": {
            "title": "My First Page"
          },
          "children": [
            {
              "id": "paragraph-1",
              "type": "ObojoboDraft.Chunks.Text",
              "content": {
                "textGroup": [
                  {
                    "text": {
                      "value": "Hello World!"
                    }
                  }
                ]
              }
            }
          ]
        }
      ]
    }
  ]
}
```

This will create an Obojobo Module containing a content section consisting of a single page with the text "Hello World!".

Here is the same object represented in OboXML Format. OboXML documents should have a singular `<ObojoboDraftDoc>` element containing multiple Obojobo component elements.

```xml
<ObojoboDraftDocument>
  <ObojoboDraft.Modules.Module id="module" title="My Module">
    <ObojoboDraft.Sections.Content id="content">
      <ObojoboDraft.Pages.Page id="page-1">
        <ObojoboDraft.Chunks.Text id="paragraph-1">
          <textGroup>
            <t>Hello World!</t>
          </textGroup>
        </ObojoboDraft.Chunks.Text>
      </ObojoboDraft.Pages.Page>
    </ObojoboDraft.Sections.Content>
  </ObojoboDraft.Modules.Module>
</ObojoboDraftDocument>
```

The `ObojoboDraft` namespace can be omitted as the OboXML Parser doesn't require it. Additionally `id` properties are not required in OboXML (they will be generated automatically if left out). Here's the same document with the namespaces and ids omitted:

```xml
<ObojoboDraftDocument>
  <Module title="My Module">
    <Content>
      <Page>
        <Text>
          <textGroup>
            <t>Hello World!</t>
          </textGroup>
        </Text>
      </Page>
    </Content>
  </Module>
</ObojoboDraftDocument>
```

Finally, here is the same document again but using OboHTML tags where possible:

```xml
<ObojoboDraftDocument>
  <Module title="My Module">
    <Content>
      <Page>
        <p>Hello World!</p>
      </Page>
    </Content>
  </Module>
</ObojoboDraftDocument>
```

## Navigation

The default Module, Section and Page nodes will generate the navigation based on document order and titles.
