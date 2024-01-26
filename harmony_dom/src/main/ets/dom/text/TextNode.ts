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
  
  setText(text: string): void {
    this.text = text
  }

  setFontStyle(fontStyle: OhFontStyle) {
    this.fontStyle = fontStyle
  }
}

export enum OhFontStyle {
  Normal, Italic
}