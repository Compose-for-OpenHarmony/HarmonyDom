// @ts-nocheck
import { BaseNode } from '../base/BaseNode';
import { BaseNodeGroup } from '../base/BaseNodeGroup';

/**
 * author: wulinpeng
 * date: 2024/1/29
 * desc:
 */
@Observed
export class ImageNode extends BaseNode {
  url: string = ""
  isCircle: boolean = false

  setUrl(url: string) {
    this.url = url
  }
  setIsCircle(isCircle: boolean) {
    this.isCircle = isCircle
  }
}