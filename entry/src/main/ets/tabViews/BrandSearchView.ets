import router from '@ohos.router'

@Component
export  default  struct  BrandSearchComponents {
  @State headPhoto: Resource = $r('app.media.userB')
  @State username: string = 'Admin'
  @State listColor:Color = Color.White       //'#fff0f0f0'
  build() {
    Column(){
      Row(){
        Image($r('app.media.back')).width(40).height(40)
        Text('品牌兼容').fontSize(20).margin('10%')
      }.width('95%')
      .onClick(()=>{
        router.back()
      })
      Text('支持的品牌').fontSize(20)
      List(){

      }.height('60%')
    }
  }
}