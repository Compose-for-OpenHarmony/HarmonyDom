// @ts-nocheck
import { BaseNode } from '../base/BaseNode';
import { BaseNodeGroup } from '../base/BaseNodeGroup';

/**
 * author: wulinpeng
 * date: 2024/1/27
 * desc:
 */
@Observed
export class ButtonNode extends BaseNode {
  text: string = ""
  clickBlock?: () => void

  setText(text: string): void {
    this.text = text
  }

  onClick(onClick: () => void) {
    this.clickBlock = onClick
  }
}