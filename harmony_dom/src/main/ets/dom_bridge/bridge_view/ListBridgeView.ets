import { ListNode } from '../../dom/list/ListNode'
import { BaseNode } from '../../Index'
import { createChildren, createUIFromNode } from '../DomBridge'

/**
 * author: wulinpeng
 * date: 2024/3/25
 * desc:
 */
@Component
export struct ListBridgeView {
  @ObjectLink listNode: ListNode

  build() {
    List() {
      LazyForEach(this.listNode, (item: BaseNode, index: number) => {
        ListItem() {
          createUIFromNode(item)
        }
      }, (item: BaseNode, index: number) => {
        return item.id
      })
    }
    .padding(this.listNode.getPadding())
    .width(this.listNode.getWidth())
    .height(this.listNode.getHeight())
    .layoutWeight(this.listNode.layoutWeight)
    .alignListItem(ListItemAlign.Start)
    .align(Alignment.Start)
  }
}