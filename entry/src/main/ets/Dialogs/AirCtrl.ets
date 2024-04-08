import { Level, Size } from '@ohos/hypium'
import { deviceDataType } from '../models/HttpDataType'

export class airDetails{
  house:number = 0
  temper:number = 25
  mode:number = 0
  windLevel:number = 0
  windDirection:number = 0
  power:number = 0
  status:boolean = false
}
@CustomDialog
export struct AirControl {
  controller: CustomDialogController
  Status: (state:boolean) => void
  @State airCtrl :airDetails = new airDetails()
  @State tValue :number = 25
  @State buttonColor:Color = Color.White
  @State switchList :Array<String> = ['客厅','卧室1','卧室2','卧室3',]
  @State control: deviceDataType = new deviceDataType()
  build() {
    Column() {
      Row(){
        Text(this.switchList[this.airCtrl.house].toString()).fontSize(20)
        Image($r('app.media.homeA')).width(25).height(25)
      }
      .onClick(()=>{
        this.airCtrl.house ++
        this.airCtrl.house %= this.switchList.length
      })

      Row({space:20}){
        //温度显示
        Image($r('app.media.back')).width(45).height(45)
          .onClick(()=>{
            if(this.airCtrl.temper > 16){
              this.airCtrl.temper --
            }
          })
        Text(this.airCtrl.temper.toString() + '`C').fontSize(50)
          .fontWeight(FontWeight.Bold)
        Image($r('app.media.enter')).width(60).height(60)
          .onClick(()=>{
            if(this.airCtrl.temper < 30){
              this.airCtrl.temper ++
            }
          })
      }.margin({top:'6%'})
      //风速控制
      Row(){
        Text('-').fontWeight(FontWeight.Bold).fontSize(50)
          .onClick(()=>{
            this.airCtrl.windLevel --
          })
        Progress({value:0, total:4, type:ProgressType.Capsule}).width('60%').height(30)
          .value(this.airCtrl.windLevel).color('#ffbcd943')
        Text('+').fontWeight(FontWeight.Bold).fontSize(50)
          .onClick(()=>{
            this.airCtrl.windLevel ++
          })
      }
      if(this.airCtrl.windLevel === 0){
        Text('AUTO')
      }
      else{
        Text('风速')
      }
      //模式选择
      Row({space:10}){
        Button(){
          Image($r('app.media.cold')).width(36).height(36)
        }.width(50).height(50).backgroundColor(this.buttonColor)
        Button(){
          Image($r('app.media.warm')).width(36).height(36)
        }.width(50).height(50).backgroundColor(this.buttonColor)
        Button(){
          Image($r('app.media.dry')).width(36).height(36)
        }.width(50).height(50).backgroundColor(this.buttonColor)
        Button(){
          Image($r('app.media.wind')).width(40).height(40)
        }.width(50).height(50).backgroundColor(this.buttonColor)

      }.width('70%').margin('5%')
      Text('模式')
      //功能控制
      Row({space:10}){
        Button(){
          Image($r('app.media.mute')).width(36).height(36)
        }.width(80).height(50).backgroundColor(this.buttonColor)
        Button(){
          Image($r('app.media.sleep')).width(36).height(36)
        }.width(80).height(50).backgroundColor(this.buttonColor)
        Button(){
          Image($r('app.media.timer')).width(36).height(36)
        }.width(80).height(50).backgroundColor(this.buttonColor)

      }.width('80%').margin('5%')
      Text('功能')
      //电源
      Row({space:10}){
        Column(){
          Text('左右风')
          Button(){
            Image($r('app.media.ver')).width(36).height(36)
          }.width(70).height(50).backgroundColor(this.buttonColor)
        }

        Button(){
          Image($r('app.media.open')).width(80).height(80)
        }.width(100).height(100).backgroundColor(this.buttonColor)
        Column(){
          Text('上下风')
          Button(){
            Image($r('app.media.hor')).width(40).height(40)
          }.width(70).height(50).backgroundColor(this.buttonColor)
        }
      }.width('80%').margin('5%')
    }.backgroundImage($r('app.media.airCtrlBK')).borderRadius(20)
    .backgroundImageSize(ImageSize.Cover)
    .height('80%').width('100%')

  }
}
