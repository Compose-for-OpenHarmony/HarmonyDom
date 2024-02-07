import CircleImageView from '@ohos/circleimageview/src/main/ets/components/MainPage/CircleImageView'
import { createFakeWeiboModel, getSpanList, WeiboModel } from './model/WeiboModel'
import media from '@ohos.multimedia.media'

@Component
export struct WBCard {

  weiboModel: WeiboModel = createFakeWeiboModel()

  build() {
    Column() {
      Row() {
        Image(this.weiboModel.avatar_url)
          .width(40)
          .height(40)
          .clip(new Circle({width: 40, height: 40}))
        Column() {
          Text(this.weiboModel.user_name)
            .fontSize(16)
            .fontColor(Color.Orange)
          Row() {
            Text(this.weiboModel.create_at)
              .fontSize(10)
              .fontColor(Color.Grey)
            Text(this.weiboModel.source)
              .fontSize(10)
              .fontColor(Color.Grey)
          }
          .alignItems(VerticalAlign.Center)
        }
        // .width("100%")
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
        .padding({left: 10})
        Image($r('app.media.icon'))
          .width(10)
          .height(10)
      }
      .padding(10)
      .alignItems(VerticalAlign.Center)
      Text(this.weiboModel.text) {
        ForEach(getSpanList(this.weiboModel.text, this.weiboModel.topics), (item: string, index: number) =>  {
          if (item.startsWith("#") && item.endsWith("#")) {
            Span(item)
              .fontColor(Color.Blue)
              .fontSize(15)
          } else {
            Span(item)
              .fontSize(15)
          }
        }, (item: string, index: number) => {
          return item
        })
      }
      .maxLines(5)
      .textOverflow({overflow: TextOverflow.Ellipsis})
      .padding({left: 10, right: 10})
      if (this.weiboModel.pics.split(",").length == 1) {
        Image(this.weiboModel.pics)
          .width(200)
          .height(200)
      } else {
        Grid() {
          ForEach(this.weiboModel.pics.split(","), (item: string, index: number) =>  {
            GridItem() {
              Image(item)
                .height(150)
            }
          }, (item: string, index: number) => {
            return item
          })
        }
        .layoutDirection(GridDirection.Column)
        .columnsTemplate("1fr 1fr 1fr")
        // .rowsTemplate("1fr 1fr 1fr")
        .width('100%')
      }
    }
    .alignItems(HorizontalAlign.Start)
  }
}