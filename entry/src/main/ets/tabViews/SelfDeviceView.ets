import router from '@ohos.router'

import ArrayList from '@ohos.util.ArrayList'
import { HomeMessageType } from '../models/HttpDataType'

@Component
export  default  struct  selfDeviceComponents {
  @State listColor:Color = Color.White       //'#fff0f0f0'
  @State postMessage:HomeMessageType = {
    homeName:'我们的小家',
    homePosition:'洛阳',
    deviceID: new ArrayList(),
    deviceType:new ArrayList(),
    roomType :new ArrayList()
  }
  build() {
    Column(){
      Row(){
        Image($r('app.media.back')).width(40).height(40)
        Text('我的设备').fontSize(20).margin('10%')
      }.width('95%')
      .onClick(()=>{
        router.back()
      })
      Row(){
        Text('添加设备').fontSize(26).margin({left:110})
      }
      .width('90%')
      .height(80)
      .margin(5)
      .border({ radius: { topLeft: 24, topRight: 24, bottomLeft: 24, bottomRight: 24 } })
      .backgroundColor('#ffffffff')
      .onClick(()=>{
        //this.callbackChangeScene()
      })
      Text('已添加设备').fontSize(20)
      List(){

      }.height('60%')
    }
  }
  private messageInit(){
    let i = 0
    let IDBuffer = ['abc','ccc','aaa']
    let typeBuffer = ['LED','TV','AIR']
    for(  i = 0 ; i < IDBuffer.length ;i++)
    this.postMessage.deviceID.add(IDBuffer[i])
    this.postMessage.deviceType.add(typeBuffer[i])
  }
}