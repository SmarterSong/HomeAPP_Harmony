
import router from '@ohos.router'
import Prompt from '@system.prompt'
import { destroy } from '../Dialogs/destory'
import { exitLoginDialog } from '../Dialogs/missLogin'

@Component
export  default  struct  UserCenterComponents {
  @State headPhoto: Resource = $r('app.media.userB')
  @State username: string = 'Admin'
  @State listColor:Color = Color.White       //'#fff0f0f0'

  //-----------------------------------------构建弹窗------------------------------//
  exitController: CustomDialogController = new CustomDialogController({
    builder: exitLoginDialog({}),
    alignment: DialogAlignment.Bottom, // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })
  destroyController: CustomDialogController = new CustomDialogController({
    builder: destroy({}),
    alignment: DialogAlignment.Bottom, // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })
  build() {
    Column() {
      //用户基本信息
      Column() {
        Image(this.headPhoto)
          .width(68)
          .height(68)
          .borderRadius(34)
        Text(this.username)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .margin(30)
      //设备和家庭管理
      Row({ space: 20 }) {
        Column() {
          Image($r('app.media.find')).width(50).height(50)
          Text('我的设备').fontSize(18)
        }.margin({ left: 30 })
        .onClick(()=>{
          this.callbackDeviceManage()
        })

        Column() {
          Image($r('app.media.family')).width(50).height(50)
          Text('家庭管理').fontSize(18)
        }
        .onClick(()=>{
          this.callbackFamilyManage()
        })

        Column() {
          Image($r('app.media.expend')).width(50).height(50)
          Text('品牌兼容').fontSize(18)
        }
        .onClick(()=>{
          this.callbackBrandManage()
        })

      }
      .margin(20)
      .border({ radius: { topLeft: 24, topRight: 24, bottomLeft: 24, bottomRight: 24 } })
      .backgroundColor('#ffffffff')
      .width('90%')
      .height(150)
      //功能列表
      Column() {
        Row() {
          Text('个人隐私').fontSize(20).margin({ left: 10 })
          Image($r('app.media.enter')).width(30).height(30).margin({left:160})
        }.width('90%').height(50).backgroundColor(this.listColor)
        .onClick(()=>{
          this.callbackPrivacy()
        })
        Divider().width('80%')


        Row() {
          Text('修改密码').fontSize(20).margin({ left: 10 })
          Image($r('app.media.enter')).width(30).height(30).margin({left:160})
        }.width('90%').height(50).backgroundColor(this.listColor)
        .onClick(()=>{
          this.callbackCode()
        })
        Divider().width('80%')


        Row() {
          Text('退出登录').fontSize(20).margin({ left: 10 })
          Image($r('app.media.enter')).width(30).height(30).margin({left:160})
        }.width('90%').height(50).backgroundColor(this.listColor)
        .onClick(()=>{
          this.callbackExit()
        })
        Divider().width('80%')


        Row() {
          Text('当前版本').fontSize(20).margin({ left: 10 })
          Image($r('app.media.enter')).width(30).height(30).margin({left:160})
        }.width('90%').height(50).backgroundColor(this.listColor)
        .onClick(()=>{
          this.callbackVersion()
        })
        Divider().width('80%')


        Row() {
          Text('关于我们').fontSize(20).margin({ left: 10 })
          Image($r('app.media.enter')).width(30).height(30).margin({left:160})
        }.width('90%').height(50).backgroundColor(this.listColor)
        .onClick(()=>{
          this.callbackAbout()
        })
        Divider().width('80%')


        Row() {
          Text('注销账号').fontSize(20).fontColor('#ffa54040').margin({ left: 10 })
          Image($r('app.media.enter')).width(30).height(30).margin({left:160})
        }.width('90%').height(50).backgroundColor(this.listColor)
        .onClick(()=>{
          this.callbackDestroy()
        })
        Divider().width('80%')
      }
      .margin(10)
      .border({ radius: { topLeft: 24, topRight: 24, bottomLeft: 24, bottomRight: 24 } })
      .width('90%')
      .height(330)
      .backgroundColor('#ffffffff')
    }
    .width('100%')
    .height('100%')
  }
  //功能列表回调函数
  private callbackPrivacy():void{
    router.pushUrl({
      url: 'pages/UserFunctionPage',
      params:{ index: 3}
    })
  }
  private callbackCode():void{     //修改密码

  }
  private callbackExit():void{    //退出登录
    this.exitController.open()
  }
  private callbackVersion():void{  //版本号
    Prompt.showToast({ message: '当前为最新版本———V1.0', duration: 2000 })
  }
  private callbackAbout():void{   //关于

  }
  private callbackDestroy():void{  //注销
    this.destroyController.open()
  }
  //按键回调函数
  private  callbackDeviceManage(){
    router.pushUrl({
      url: 'pages/UserFunctionPage',
      params:{ index: 0}
    })
  }
  private  callbackFamilyManage(){
    router.pushUrl({
      url: 'pages/UserFunctionPage',
      params:{ index: 1}
    })
  }
  private  callbackBrandManage(){
    router.pushUrl({
      url: 'pages/UserFunctionPage',
      params:{ index: 2}
    })
  }

}

function missLoginDialog(arg0: {}): any {
  throw new Error('Function not implemented.')
}
