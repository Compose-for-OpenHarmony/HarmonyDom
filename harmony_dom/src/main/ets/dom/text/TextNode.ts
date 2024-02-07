// @ts-nocheck
import { BaseNode } from '../base/BaseNode';
import { BaseNodeGroup } from '../base/BaseNodeGroup';

/**
 * author: wulinpeng
 * date: 2024/1/27
 * desc:
 */
@Observed
export class TextNode extends BaseNode {
  text: string = ""
  fontStyle: OhFontStyle = OhFontStyle.Normal
  fontColor: string
  fontSize: number
  maxLines: number
  spans: OhTextSpan[] = []
  
  setText(text: string): void {
    this.text = text
  }

  setFontStyle(fontStyle: OhFontStyle) {
    this.fontStyle = fontStyle
  }

  setFontColor(fontColor: string) {
    this.fontColor = fontColor
  }

  setFontSize(fontSize: number) {
    this.fontSize = fontSize
  }

  setMaxLines(maxLines: number) {
    this.maxLines = maxLines
  }

  setSpans(spans: OhTextSpan[]) {
    this.spans = spans
  }
}

export enum OhFontStyle {
  Normal, Italic
}

export class OhTextSpan {
  startIndex: number
  endIndex: number
  fontColor: string
  fontSize: number
  fontStyle: OhFontStyle
}