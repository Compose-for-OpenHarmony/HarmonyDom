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
    Text(this.textNode.text) {
      ForEach(getSpanList(this.weiboModel.text, this.weiboModel.topics), (item: string, index: number) =>  {
        if (item.startsWith("#") && item.endsWith("#")) {
          Span(item)
            .fontColor(Color.Blue)
            .fontSize(15)
        } else {
          Span(item)
            .fontSize(15)
        }
      }, (item: string, index: number) => {
        return item
      })
    }
    .fontStyle(this.convertFontStyle(this.textNode.fontStyle))
    .fontColor(this.textNode.fontColor)
    .fontSize(this.textNode.fontSize)
    .maxLines(this.textNode.maxLines)
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