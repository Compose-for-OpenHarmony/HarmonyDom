// @ts-nocheck
import { BaseNodeGroup } from '../base/BaseNodeGroup';

/**
 * author: wulinpeng
 * date: 2024/1/27
 * desc:
 */
@Observed
export class RowNode extends BaseNodeGroup {
  // 避免与 ColumnNode 结构相同导致 instanceof 判断错误
  private ROW_NODE = ''
}