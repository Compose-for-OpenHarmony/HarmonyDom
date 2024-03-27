import { OhFontStyle, OhTextSpan, TextNode } from '../../dom/text/TextNode'

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
      if (this.textNode.spans.length > 0) {
        ForEach(this.getSpanList(this.textNode, this.textNode.spans), (item: OhTextSpan, index: number) => {
          Span(this.textNode.text.substring(item.startIndex, item.endIndex + 1))
            .fontColor(item.fontColor)
            .fontSize(item.fontSize)
            .fontStyle(this.convertFontStyle(item.fontStyle))
        }, (item: OhTextSpan, index: number) => {
          return `${this.textNode.text.substring(item.startIndex, item.endIndex + 1)}-${item.startIndex}-${item.endIndex}`
        })
      }
    }
    .fontStyle(this.convertFontStyle(this.textNode.fontStyle))
    .fontColor(this.textNode.fontColor)
    .fontSize(this.textNode.fontSize)
    .maxLines(this.textNode.maxLines)
    .padding(this.textNode.getPadding())
    .width(this.textNode.getWidth())
    .height(this.textNode.getHeight())
    .layoutWeight(this.textNode.layoutWeight)
    .textAlign(this.textNode.textCenter ? TextAlign.Center : TextAlign.Start)
  }

  private convertFontStyle(fontStyle: OhFontStyle): FontStyle {
    if (fontStyle == OhFontStyle.Italic) {
      return FontStyle.Italic
    } else {
      return FontStyle.Normal
    }
  }

  /**
   * convert text to spans
   * @param text
   * @param spans
   * @returns
   */
  private getSpanList(textNode: TextNode, spans: OhTextSpan[]): OhTextSpan[] {
    let lastEnd = -2
    let result: OhTextSpan[] = []
    if (spans[0].startIndex != 0) {
      lastEnd = -1
    }
    for (let spansElement of spans) {
      if (lastEnd != -2) {
        result.push(this.createNormalSpan(lastEnd + 1, spansElement.startIndex - 1, textNode))
      }
      result.push(spansElement)
      lastEnd = spansElement.endIndex
    }
    if (lastEnd != textNode.text.length - 1) {
      result.push(this.createNormalSpan(lastEnd + 1, textNode.text.length - 1, textNode))
    }
    return result
  }

  private createNormalSpan(startIndex: number, endIndex: number, textNode: TextNode): OhTextSpan {
    let span = new OhTextSpan()
    span.startIndex = startIndex
    span.endIndex = endIndex
    span.fontColor = textNode.fontColor
    span.fontSize = textNode.fontSize
    span.fontStyle = textNode.fontStyle
    return span
  }
}