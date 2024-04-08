import router from '@ohos.router'

@CustomDialog
export struct destroy {
  controller: CustomDialogController
  build() {
    Column() {
      Text('确定注销当前帐号？').fontSize(20).fontColor(Color.Red)
      Row(){
        Text('取消').fontSize(18)
          .onClick(()=>{
            this.controller.close()
          })
        Divider().vertical(true).height('40%').margin('30%')
        Text('确定').fontSize(18).fontColor(Color.Red)
          .onClick(()=>{
            router.pushUrl({ url: 'pages/Index' })
          })
      }
    }.height('20%')
  }
}