import { OhFontStyle, TextNode } from '../../dom/text/TextNode'
import { BaseNode } from '../../Index'

/**
 * author: wulinpeng
 * date: 2024/1/27
 * desc:
 */
@Component
export struct TextBridgeView {
  @ObjectLink textNode: TextNode

  build() {
    Text(this.textNode.text)
      .fontStyle(this.convertFontStyle(this.textNode.fontStyle))
      .padding(this.textNode.getPadding())
      .width(this.textNode.getWidth())
      .height(this.textNode.getHeight())
      .layoutWeight(this.textNode.layoutWeight)
  }

  convertFontStyle(fontStyle: OhFontStyle): FontStyle {
    if (fontStyle == OhFontStyle.Italic) {
      return FontStyle.Italic
    } else {
      return FontStyle.Normal
    }
  }
}