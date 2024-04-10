import router from '@ohos.router'

import ArrayList from '@ohos.util.ArrayList'
import { HomeMessageType } from '../models/HttpDataType'
import util from '@ohos.util';


export class deviceList {
  key: string = util.generateRandomUUID(true);
  name: string;
  icon: Resource;

  constructor(name: string, icon: Resource) {
    this.name = name;
    this.icon = icon;
  }
}
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
  private deviceItems = [
    new deviceList('吸顶灯', $r("app.media.LED")),
    new deviceList('窗帘', $r("app.media.curtain")),
    new deviceList('TV', $r("app.media.TV")),
    new deviceList('空调', $r("app.media.air")),
    new deviceList('房门', $r("app.media.lock")),
    new deviceList('车库门', $r("app.media.cardoor"))
  ]


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
      List() {
          ListItem() {
            Row() {
              Image(this.deviceItems[0].icon).width(40).height(40)
              Text(this.deviceItems[0].name).fontSize(20).margin({left:'40%'})
            }
            .width('90%')
            .justifyContent(FlexAlign.Center)
          }
        ListItem() {
          Row() {
            Image(this.deviceItems[1].icon).width(40).height(40)
            Text(this.deviceItems[1].name).fontSize(20).margin({left:'40%'})
          }
          .width('90%')
          .justifyContent(FlexAlign.Center)
        }
        ListItem() {
          Row() {
            Image(this.deviceItems[2].icon).width(40).height(40)
            Text(this.deviceItems[2].name).fontSize(20).margin({left:'40%'})
          }
          .width('90%')
          .justifyContent(FlexAlign.Center)
        }
        ListItem() {
          Row() {
            Image(this.deviceItems[3].icon).width(40).height(40)
            Text(this.deviceItems[3].name).fontSize(20).margin({left:'40%'})
          }
          .width('90%')
          .justifyContent(FlexAlign.Center)
        }
        ListItem() {
          Row() {
            Image(this.deviceItems[4].icon).width(40).height(40)
            Text(this.deviceItems[4].name).fontSize(20).margin({left:'40%'})
          }
          .width('90%')
          .justifyContent(FlexAlign.Center)
        }
        ListItem() {
          Row() {
            Image(this.deviceItems[5].icon).width(40).height(40)
            Text(this.deviceItems[5].name).fontSize(20).margin({left:'40%'})
          }
          .width('90%')
          .justifyContent(FlexAlign.Center)
        }
      }
      .width('90%').height('30%')
      .borderRadius(24)
      .backgroundColor('#ffffffff')
      .divider({
        strokeWidth: 1,
        startMargin: 60,
        endMargin: 10,
        color: '#ffe9f0f0'
      })
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