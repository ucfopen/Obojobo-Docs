---
id: obonode_mathequation
title: ObojoboDraft.Chunks.MathEquation
sidebar_label: ObojoboDraft.Chunks.MathEquation
---

A LaTeX math equation rendered with [Katex](https://github.com/Khan/KaTeX)

### Content Values

* `latex` **REQUIRED** String: The LaTeX string to render (example: `y=\sin(2x)`)
* `align` String: Either `left`, `center` or `right` (defaults to `left` if not set).
* `label` String: If specified adds a label to the right side of the equation, for example `"(1.1)"`
* `size` Number (Default: `1`): The font size of the equation. `1` is the standard size, `2` is twice as big and `0.5` is half as big.

### Children

* No children

### Variables Registered

* None

### Example

#### JSON:

```json
{
	"type": "ObojoboDraft.Chunks.MathEquation",
	"id": "...",
	"content": {
		"latex": "y=\\sin(2x)",
		"label": "(1.1)"
	}
}
```

#### XML:

```xml
<MathEquation latex="y=\sin(2x)" label="(1.1)" />
```
