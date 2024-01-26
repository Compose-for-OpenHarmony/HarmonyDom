// @ts-nocheck
import { BaseNode } from '../base/BaseNode';
import { BaseNodeGroup } from '../base/BaseNodeGroup';

/**
 * author: wulinpeng
 * date: 2024/1/27
 * desc:
 */
@Observed
export class ColumnNode extends BaseNodeGroup {
  // 避免与 RowNode 结构相同导致 instanceof 判断错误
  private COLUMN_NODE = ''

}