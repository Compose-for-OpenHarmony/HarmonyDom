import { BaseNode } from '../dom/base/BaseNode'
import { BaseNodeGroup } from '../dom/base/BaseNodeGroup'
import { ButtonNode } from '../dom/button/ButtonNode'
import { ColumnNode } from '../dom/column/ColumnNode'
import { DividerNode } from '../dom/divider/DividerNode'
import { ImageNode } from '../dom/image/ImageNode'
import { TextNode } from '../dom/text/TextNode'
import { ListNode, RowNode } from '../Index'
import { ButtonBridgeView } from './bridge_view/ButtonBridgeView'
import { ColumnBridgeView } from './bridge_view/ColumnBridgeView'
import { DividerBridgeView } from './bridge_view/DividerBridgeView'
import { ImageBridgeView } from './bridge_view/ImageBridgeView'
import { ListBridgeView } from './bridge_view/ListBridgeView'
import { RowBridgeView } from './bridge_view/RowBridgeView'
import { TextBridgeView } from './bridge_view/TextBridgeView'

/**
 * author: wulinpeng
 * date: 2024/1/27
 * desc: Bridge of Dom and Component
 */
@Builder
export function createUIFromNode(node: BaseNode) {
  if (node instanceof ColumnNode) {
    ColumnBridgeView({columnNode: node})
  } else if (node instanceof RowNode) {
    RowBridgeView({rowNode: node})
  } else if (node instanceof TextNode) {
    TextBridgeView({ textNode: node })
  } else if (node instanceof ButtonNode) {
    ButtonBridgeView({buttonNode: node})
  } else if (node instanceof ImageNode) {
    ImageBridgeView({imageNode: node})
  } else if (node instanceof ListNode) {
    ListBridgeView({listNode: node})
  } else if (node instanceof DividerNode) {
    DividerBridgeView({dividerNode: node})
  }
}

@Builder
export function createChildren(node: BaseNodeGroup) {
  LazyForEach(node, (item: BaseNode, index: number) => {
    createUIFromNode(item)
  }, (item: BaseNode, index: number) => {
    return item.id
  })
}