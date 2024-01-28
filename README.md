# <center>Harmony Dom</center>

-------------------------------------------------------------------------------

`Harmony Dom` is a dom api for OpenHarmony Components.

## Install

```json5
{
  // ...
  "dependencies": {
    "oh_compose/harmony_dom": "0.1.2"
  }
}
```

## Sample Code
```extendtypescript
import { BaseNode, ButtonNode, ColumnNode, createNode, TextNode } from '@oh_compose/harmony_dom';

@Entry
@Component
struct Index {

  createDomNode(): BaseNode {
    let rootNode = new ColumnNode()

    let text = new TextNode()
    text.setText("0")

    let button = new ButtonNode()
    button.setText("Add")
    button.onClick(() => {
      let currentCount = Number.parseInt(text.text)
      text.setText(`${currentCount + 1}`)
    })

    rootNode.insert(0, button)
    rootNode.insert(1, text)

    return rootNode
  }

  build() {
    Stack() {
      createNode(this.createDomNode())
    }
  }
}
```