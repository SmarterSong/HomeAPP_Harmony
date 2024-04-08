
import { sceneSelect } from '../Dialogs/sceneSlecet'
import Prompt from '@system.prompt'

@Component
export  default  struct  SceneComponents {
  //-------------------------------构建弹窗---------------------------//
  SceneModeA: CustomDialogController = new CustomDialogController({
    builder: sceneSelect({
      itemStatus: this.callbackModeA
    }),
    alignment: DialogAlignment.Bottom,  // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })

  SceneModeB: CustomDialogController = new CustomDialogController({
    builder: sceneSelect({
      itemStatus: this.callbackModeB
    }),
    alignment: DialogAlignment.Bottom,  // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })

  SceneModeC: CustomDialogController = new CustomDialogController({
    builder: sceneSelect({
      itemStatus: this.callbackModeC
    }),
    alignment: DialogAlignment.Bottom,  // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })

  SceneModeD: CustomDialogController = new CustomDialogController({
    builder: sceneSelect({
      itemStatus: this.callbackModeD
    }),
    alignment: DialogAlignment.Bottom,  // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })

  SceneModeE: CustomDialogController = new CustomDialogController({
    builder: sceneSelect({
      itemStatus: this.callbackModeE
    }),
    alignment: DialogAlignment.Bottom,  // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })

  SceneModeF: CustomDialogController = new CustomDialogController({
    builder: sceneSelect({
      itemStatus: this.callbackModeF
    }),
    alignment: DialogAlignment.Bottom,  // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })

  SceneModeG: CustomDialogController = new CustomDialogController({
    builder: sceneSelect({
      itemStatus: this.callbackModeG
    }),
    alignment: DialogAlignment.Bottom,  // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })

  SceneModeH: CustomDialogController = new CustomDialogController({
    builder: sceneSelect({
      itemStatus: this.callbackModeH
    }),
    alignment: DialogAlignment.Bottom,  // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })

  SceneModeM: CustomDialogController = new CustomDialogController({
    builder: sceneSelect({
      itemStatus: this.callbackModeM
    }),
    alignment: DialogAlignment.Bottom,  // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })

  SceneModeN: CustomDialogController = new CustomDialogController({
    builder: sceneSelect({
      itemStatus: this.callbackModeN
    }),
    alignment: DialogAlignment.Bottom,  // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })

  //------------------------------构建页面-----------------------------//
  build() {
    Column({ space: 5 }) {
      Row(){
        Text('智能场景').fontSize(24).margin(30)
        Image($r('app.media.addScene'))
          .width(40).height(40).margin({left:'50%'})
          .onClick(()=>{

          })
        Image($r('app.media.message'))
          .width(40).height(40).margin(15)
          .onClick(()=>{

          })
      }.width('100%').margin({top:30})
      Row(){
        Text('更换场景').fontSize(26).margin({left:110})
      }
      .width('90%')
      .height(80)
      .margin(5)
      .border({ radius: { topLeft: 24, topRight: 24, bottomLeft: 24, bottomRight: 24 } })
      .backgroundColor('#ffffffff')
      .onClick(()=>{
        this.callbackChangeScene()
      })
      Text('推荐场景').fontSize(20)
      //------------------------------------功能列表-------------------------------------//
      List(){
        ListItem(){
          Row({space:20}){
            Column(){
              Button({ type: ButtonType.Normal, stateEffect: true }) {
                Image($r('app.media.morningBK')) .borderRadius(10)
              }.width('47%').height(100)
              .borderRadius(10).backgroundColor('#FFFFFF')
              .onClick(()=>{
                this.SceneModeA.open()
              })
              Text('早安')
            }
            Column(){
              Button({ type: ButtonType.Normal, stateEffect: true }) {
                Image($r('app.media.nightBK')) .borderRadius(10)
              }.borderRadius(10).backgroundColor('#FFFFFF')
              .width('47%').height(100)
              .onClick(()=>{
                this.SceneModeB.open()
              })
              Text('夜间')
            }
          }.width('90%')
        }
        ListItem(){
          Row({space:20}){
            Column(){
              Button({ type: ButtonType.Normal, stateEffect: true }) {
                Image($r('app.media.gohomeBK')) .borderRadius(10)
              }.width('47%').height(100)
              .borderRadius(10).backgroundColor('#FFFFFF')
              .onClick(()=>{
                this.SceneModeD.open()
              })
              Text('回家')
            }
            Column(){
              Button({ type: ButtonType.Normal, stateEffect: true }) {
                Image($r('app.media.goOut')) .borderRadius(10)
              }.borderRadius(10).backgroundColor('#FFFFFF')
              .width('47%').height(100)
              .onClick(()=>{
                this.SceneModeC.open()
              })
              Text('外出')
            }
          }.width('90%')
        }
        ListItem(){
          Row({space:20}){
            Column(){
              Button({ type: ButtonType.Normal, stateEffect: true }) {
                Image($r('app.media.welcome')) .borderRadius(10)
              }.width('47%').height(100)
              .borderRadius(10).backgroundColor('#FFFFFF')
              .onClick(()=>{
                this.SceneModeE.open()
              })
              Text('迎客')
            }
            Column(){
              Button({ type: ButtonType.Normal, stateEffect: true }) {
                Image($r('app.media.confort')) .borderRadius(10)
              }.borderRadius(10).backgroundColor('#FFFFFF')
              .width('47%').height(100)
              .onClick(()=>{
                this.SceneModeF.open()
              })
              Text('休闲')
            }
          }.width('90%')
        }
        ListItem(){
          Row({space:20}){
            Column(){
              Button({ type: ButtonType.Normal, stateEffect: true }) {
                Image($r('app.media.evection')) .borderRadius(10)
              }.width('47%').height(100)
              .borderRadius(10).backgroundColor('#FFFFFF')
              .onClick(()=>{
                this.SceneModeE.open()
              })
              Text('出差')
            }
            Column(){
              Button({ type: ButtonType.Normal, stateEffect: true }) {
                Image($r('app.media.defence')) .borderRadius(10)
              }.borderRadius(10).backgroundColor('#FFFFFF')
              .width('47%').height(100)
              .onClick(()=>{
                this.SceneModeF.open()
              })
              Text('安防')
            }
          }.width('90%')
        }
        ListItem(){
          Row({space:20}){
            Column(){
              Button({ type: ButtonType.Normal, stateEffect: true }) {
                Image($r('app.media.trustee')) .borderRadius(10)
              }.width('47%').height(100)
              .borderRadius(10).backgroundColor('#FFFFFF')
              .onClick(()=>{
                this.SceneModeE.open()
              })
              Text('托管')
            }
            Column(){
              Button({ type: ButtonType.Normal, stateEffect: true }) {
                Image($r('app.media.feeding')) .borderRadius(10)
              }.borderRadius(10).backgroundColor('#FFFFFF')
              .width('47%').height(100)
              .onClick(()=>{
                this.SceneModeF.open()
              })
              Text('饲养')
            }
          }.width('90%')
        }
      }.height('70%')
      .listDirection(Axis.Vertical)
      .alignListItem(ListItemAlign.Center)

    }.height('100%')
  }
  //--------------------------------------回调函数----------------------------//
  private callbackChangeScene():void{
    Prompt.showToast({ message: '此版本暂不支持', duration: 2000})
  }

  private callbackModeA(status:boolean):number{
    if(status){
      //开启场景A
    }
    else {
      //开启场景A
    }
    return 0
  }
  private callbackModeB(status:boolean):number{
    if(status){
      //开启场景A
    }
    else {
      //开启场景A
    }
    return 1
  }
  private callbackModeC(status:boolean):number{
    if(status){
      //开启场景A
    }
    else {
      //开启场景A
    }
    return 2
  }
  private callbackModeD(status:boolean):number{
    if(status){
      //开启场景A
    }
    else {
      //开启场景A
    }
    return 3
  }
  private callbackModeE(status:boolean):number{
    if(status){
      //开启场景A
    }
    else {
      //开启场景A
    }
    return 4
  }
  private callbackModeF(status:boolean):number{
    if(status){
      //开启场景A
    }
    else {
      //开启场景A
    }
    return 5
  }
  private callbackModeG(status:boolean):number{
    if(status){
      //开启场景A
    }
    else {
      //开启场景A
    }
    return 6
  }
  private callbackModeH(status:boolean):number{
    if(status){
      //开启场景A
    }
    else {
      //开启场景A
    }
    return 7
  }
  private callbackModeM(status:boolean):number{
    if(status){
      //开启场景A
    }
    else {
      //开启场景A
    }
    return 8
  }
  private callbackModeN(status:boolean):number{
    if(status){
      //开启场景A
    }
    else {
      //开启场景A
    }
    return 9
  }

}
