// @ts-nocheck
import { BaseNode } from '../base/BaseNode';

/**
 * author: wulinpeng
 * date: 2024/3/27
 * desc:
 */

@Observed
export class DividerNode extends BaseNode {
  backgroundColor: string

  setBackgroundColor(color: string) {
    this.backgroundColor = color
  }
}