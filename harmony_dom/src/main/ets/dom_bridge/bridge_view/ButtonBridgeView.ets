import { ButtonNode } from '../../dom/button/ButtonNode'
import { TextNode } from '../../dom/text/TextNode'

/**
 * author: wulinpeng
 * date: 2024/1/27
 * desc:
 */
@Component
export struct ButtonBridgeView {
  @ObjectLink buttonNode: ButtonNode

  build() {
    Button(this.buttonNode.text)
      .onClick(_ => {
        if (this.buttonNode.clickBlock) {
          this.buttonNode.clickBlock()
        }
      })
      .padding(this.buttonNode.getPadding())
      .width(this.buttonNode.getWidth())
      .height(this.buttonNode.getHeight())
      .layoutWeight(this.buttonNode.layoutWeight)
  }
}