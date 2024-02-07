export class WeiboModel {
  user_name: string
  avatar_url: string
  source: string
  text: string
  create_at: string
  pics: string
  topics: string
}

export function createFakeWeiboModel(): WeiboModel {
  const model = new WeiboModel()
  model.user_name = "36氪"
  model.avatar_url = "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.180/001Ur7cfly8h8wsg5ik4pj60u00u0wey02.jpg?KID=imgbed,tva&Expires=1706125352&ssig=aMItysiXqH"
  model.source = "微博网页版"
  model.text = "【#氪星播报#｜1月24日晚间都有哪些#今日大事件#？】\nTop3大新闻\n1、#麦当劳崩了##麦当劳客服回应无法点餐#：已记录，会反馈给相关部门\n2、#2次辍学的00后小伙大学逆袭年级第一#，目前在准备专升本考试\n3、#个人养老金制度将推进全面实施#，先行工作取得积极成效\n科技财经互联网热点\n1、#特斯拉回应将生产紧凑型跨界车#：从未听说\n2、#保时捷为争销量打折出售#，青岛女销售一年卖170台保时捷\n3、#华为长安合资公司估值达上千亿元#，大疆车载正在推进融资流程\n还有哪些其他要闻\n1、#7年长跑情侣互换龙年礼后决定结婚#，择吉日结婚领证\n2、#女子险遭钢筋贯穿因手机得救#，未酿成重大事故\n3、#波司登董事长现场演示踩缝纫机#，波司登最新市值388亿元港币\n4、波澜壮阔，#4分半视频回顾改革开放#5、#主办方曾要求C罗带伤上场#，让C罗颇为不满\n6、#两小学教师强奸9名女生1人获死刑#，校长曾对家长举报置之不理\n7、#男子无自杀勇气砸死路人求死刑#，犯以危险方法危害公共安全罪判处死刑"
  model.create_at = "2024-01-24T22:00:23"
  model.pics = "https://wx1.sinaimg.cn/large/001Ur7cfly1hm4zzyspukj60nm2941ep02.jpg,https://wx4.sinaimg.cn/large/001Ur7cfly1hm4pc47pi6j60vu0v2ah802.jpg"
  model.topics = "氪星播报,今日大事件,麦当劳崩了,麦当劳客服回应无法点餐,2次辍学的00后小伙大学逆袭年级第一,个人养老金制度将推进全面实施,特斯拉回应将生产紧凑型跨界车,保时捷为争销量打折出售,华为长安合资公司估值达上千亿元,7年长跑情侣互换龙年礼后决定结婚,女子险遭钢筋贯穿因手机得救,波司登董事长现场演示踩缝纫机,4分半视频回顾改革开放,主办方曾要求C罗带伤上场,两小学教师强奸9名女生1人获死刑,男子无自杀勇气砸死路人求死刑"
  return model
}

export function getSpanList(text: string, topics: string): string[] {
  for (let topic of topics.split(",")) {
    let topicText = `#${topic}#`
    if (text.indexOf(topicText) != -1) {
      let split = text.split(topicText)
      return [...getSpanList(split[0], topics), topicText, ...getSpanList(split[1], topics)]
    }
  }
  return [text]
}