import { RowNode } from '../../Index'
import { createChildren } from '../DomBridge'

/**
 * author: wulinpeng
 * date: 2024/1/27
 * desc:
 */
@Component
export struct RowBridgeView {
  @ObjectLink rowNode: RowNode

  build() {
    Row() {
      createChildren(this.rowNode)
    }
    .padding(this.rowNode.getPadding())
    .width(this.rowNode.getWidth())
    .height(this.rowNode.getHeight())
    .layoutWeight(this.rowNode.layoutWeight)
  }
}