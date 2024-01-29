import { ImageNode } from '../../dom/image/ImageNode'

/**
 * author: wulinpeng
 * date: 2024/1/29
 * desc:
 */
@Component
export struct ImageBridgeView {
  @ObjectLink imageNode: ImageNode

  build() {
    Image(this.imageNode.url)
      .clip(this.imageNode.isCircle ? new Circle({width: this.imageNode.getWidth(), height: this.imageNode.getHeight()}) : false)
      .padding(this.imageNode.getPadding())
      .width(this.imageNode.getWidth())
      .height(this.imageNode.getHeight())
      .layoutWeight(this.imageNode.layoutWeight)
  }
}