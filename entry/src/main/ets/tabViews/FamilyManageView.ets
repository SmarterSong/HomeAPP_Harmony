import router from '@ohos.router'

@Component
export  default  struct  FamilyManageComponents {
  @State headPhoto: Resource = $r('app.media.userB')
  @State username: string = 'Admin'
  @State listColor:Color = Color.White       //'#fff0f0f0'
  build() {
    Column(){
      Row(){
        Image($r('app.media.back')).width(40).height(40)
        Text('我的家庭').fontSize(20).margin('10%')
      }.width('95%')
      .onClick(()=>{
        router.back()
      })
      Row(){
        Text('添加家庭').fontSize(26).margin({left:110})
      }
      .width('90%')
      .height(80)
      .margin(5)
      .border({ radius: { topLeft: 24, topRight: 24, bottomLeft: 24, bottomRight: 24 } })
      .backgroundColor('#ffffffff')
      .onClick(()=>{
        //this.callbackChangeScene()
      })
      Text('已添加信息').fontSize(20)
      List(){

      }.height('60%')
    }
  }
}