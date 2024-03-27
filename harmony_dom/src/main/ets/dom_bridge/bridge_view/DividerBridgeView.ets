import { DividerNode } from '../../dom/divider/DividerNode'
import { OhFontStyle, OhTextSpan, TextNode } from '../../dom/text/TextNode'

/**
 * author: wulinpeng
 * date: 2024/1/27
 * desc:
 */
@Component
export struct DividerBridgeView {
  @ObjectLink dividerNode: DividerNode

  build() {
    Divider()
      .width(this.dividerNode.getWidth())
      .height(this.dividerNode.getHeight())
      .color(this.dividerNode.backgroundColor)
      .backgroundColor(this.dividerNode.backgroundColor)
  }
}