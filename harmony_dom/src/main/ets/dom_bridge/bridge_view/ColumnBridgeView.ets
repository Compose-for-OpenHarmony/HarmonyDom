import { ColumnNode } from '../../dom/column/ColumnNode'
import { createChildren } from '../DomBridge'

/**
 * author: wulinpeng
 * date: 2024/1/27
 * desc:
 */
@Component
export struct ColumnBridgeView {
  @ObjectLink columnNode: ColumnNode

  build() {
    Column() {
      createChildren(this.columnNode)
    }
    .padding(this.columnNode.getPadding())
    .width(this.columnNode.getWidth())
    .height(this.columnNode.getHeight())
    .layoutWeight(this.columnNode.layoutWeight)
  }
}