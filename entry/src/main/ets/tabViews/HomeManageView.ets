
import Prompt from '@system.prompt'
import { roomLightControl } from '../Dialogs/roomLightCtrl'
import { doorControl } from '../Dialogs/doorCtrl'
import { curtainControl } from '../Dialogs/curtainCtrl'
import { carHouseControl } from '../Dialogs/carHosueCtrl'
import { AirControl } from '../Dialogs/AirCtrl'
import { TVControl } from '../Dialogs/TVCtrl'
import ArrayList from '@ohos.util.ArrayList'
import http from '@ohos.net.http'
import { deviceInfo, HomeMessageType, resultType, resultValType } from '../models/HttpDataType'
import httpRequest from '../models/AccessHttpServer'

@Component
export  default  struct  HomeComponents {
  //----------------------------------渲染变量区----------------------------------//
  @State messageBuffer: HomeMessageType = {
    homeName: '我们的小家',
    homePosition: '洛阳',
    deviceID: new ArrayList(),
    deviceType: new ArrayList(),
    roomType: new ArrayList()
  }
  @State weatherBuffer: resultValType = {
    city: '',
    realtime: {
      temperature: '__',
      humidity: '__',
      info: '___'
    },
    future: undefined
  };
  @State TimerID:number = -1
  @State receiveBuffer:deviceInfo = {
      temp:'__',
      humidity:'__',
      illumination:'__',
      smoke:0,
      fire:0,
      gate:0,
      garage:0,
      curtain: 0,
      light:0,
      kongtiao:0,
  }
  //----------------------------------------构建灯光控制弹窗-------------------------------------//
  lightController: CustomDialogController = new CustomDialogController({
    builder: roomLightControl({}),
    alignment: DialogAlignment.Bottom, // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })
  //----------------------------------------构建房门控制弹窗-------------------------------------//
  doorController: CustomDialogController = new CustomDialogController({
    builder: doorControl({}),
    alignment: DialogAlignment.Bottom, // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })
  //----------------------------------------构建车库控制弹窗-------------------------------------//
  carHouseController: CustomDialogController = new CustomDialogController({
    builder: carHouseControl({}),
    alignment: DialogAlignment.Bottom, // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })
  //----------------------------------------构建窗帘控制弹窗-------------------------------------//
  curtainController: CustomDialogController = new CustomDialogController({
    builder: curtainControl({}),
    alignment: DialogAlignment.Bottom, // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })
  //----------------------------------------构建电视控制弹窗-------------------------------------//
  TVController: CustomDialogController = new CustomDialogController({
    builder: TVControl({}),
    alignment: DialogAlignment.Bottom, // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })
  //----------------------------------------构建空调控制弹窗-------------------------------------//
  AirController: CustomDialogController = new CustomDialogController({
    builder: AirControl({}),
    alignment: DialogAlignment.Bottom, // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })

  //----------------------------------------构建页面-------------------------------------//
  build() {
    Column({ space: 5 }) {
      //房屋名称
      Column() {
        Row() {
          Image($r('app.media.myHome'))
            .width(50)
            .height(50)
          Text(this.messageBuffer.homeName)
            .fontSize(24).fontColor('#fff4f4f4')
          Image($r('app.media.Location'))
            .width(50)
            .height(50)
            .margin({ left: '40%' })
          Text(this.messageBuffer.homePosition)
            .fontSize(20).fontColor('#fff4f4f4')
        }
        .width('95%')
        .height(50)

        Row({ space: 30 }) {
          Text('烟雾报警').fontColor('#fff4f4f4')
          if (this.receiveBuffer.fire === 0) {
            Image($r('app.media.warn'))
              .width(30).height(30)
          }
          else {
            Image($r('app.media.warning'))
              .width(30).height(30)
          }
          Text('火灾报警').fontColor('#fff4f4f4')
          if (this.receiveBuffer.smoke === 0) {
            Image($r('app.media.warn'))
              .width(30).height(30)
          }
          else {
            Image($r('app.media.warning'))
              .width(30).height(30)
          }
        }.width('90%').margin({ top: '50%' })
      }.height('38%').borderRadius(10)
      .backgroundImage($r('app.media.homeBK'))
      .backgroundImageSize(ImageSize.Cover)

      //房间属性
      Column() {
        //实时天气
        Row() {
          Text('天气:')
          Text('温度: ' + this.weatherBuffer.realtime.temperature + '`C')//`${this.homeDataBuffer.realTemper}`
            .margin({ left: 10 })
          Text('湿度: ' + this.weatherBuffer.realtime.humidity + '%')//`${this.homeDataBuffer.realHumidity}`
            .margin({ left: 20 })
          Text(this.weatherBuffer.realtime.info)//`${this.homeDataBuffer.realPm}`
            .margin({ left: 20 })
        }.width('90%').margin('13%')

        //房屋状态显示
        Row({ space: 10 }) {
          Text('室内:')
          Image($r('app.media.temper'))
            .width(20)
            .height(20)
          Text(this.receiveBuffer.temp + '`C')
            .fontSize(20)
            .fontColor('#d20e3fea')
          Image($r('app.media.humidity'))
            .width(20)
            .height(20)
          Text(this.receiveBuffer.humidity + '%')
            .fontSize(20)
            .fontColor('#d224ea0e')
          Image($r('app.media.Light'))
            .width(30)
            .height(30)
          Text(this.receiveBuffer.illumination + 'Lx')
            .fontSize(20)
            .fontColor('#d2eca846')
        }.width('90%')
      }
      .width('95%')
      .height('20%')
      .margin('5%')
      .borderRadius(10)
      .backgroundColor(Color.White)


      //---------------------------------------开关控制面板---------------------------------------
      //房间门控制 ========  车库门控制
      Row({ space: 20 }) {
        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Row({ space: 20 }) {
            Image($r('app.media.lock')).width(50).height(50)
            Text('房门')
          }
        }
        .borderRadius(8)
        .backgroundColor('#FFFFFF')
        .width('47%')
        .height('8%')
        .onClick(() => {
          this.doorController.open()
        })

        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Row({ space: 20 }) {
            Image($r('app.media.cardoor')).width(50).height(50)
            Text('车库门')
          }
        }
        .borderRadius(8)
        .width('47%')
        .height('8%')
        .backgroundColor('#FFFFFF')
        .onClick(() => {
          this.carHouseController.open()
        })
      }.width('95%').margin({ top: 10 })

      //照明控制 ========  窗帘控制
      Row({ space: 20 }) {
        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Row({ space: 20 }) {
            Image($r('app.media.LED')).width(35).height(35)
            Text('灯光')
          }
        }
        .borderRadius(8)
        .backgroundColor('#FFFFFF')
        .width('47%')
        .height('8%')
        .onClick(() => {
          this.lightController.open()
        })

        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Row({ space: 20 }) {
            Image($r('app.media.curtain')).width(40).height(40)
            Text('窗帘')
          }
        }
        .borderRadius(8)
        .backgroundColor('#FFFFFF')
        .width('47%')
        .height('8%')
        .onClick(() => {
          this.curtainController.open()
        })
      }.width('95%').margin({ top: 10 })

      //TV控制器 ========  空调控制器
      Row({ space: 20 }) {
        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Row({ space: 20 }) {
            Image($r('app.media.TV')).width(50).height(50)
            Text('电视')
          }
        }
        .borderRadius(8)
        .backgroundColor('#FFFFFF')
        .width('47%')
        .height('8%')
        .onClick(() => {
          this.TVController.open()
        })

        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Row({ space: 20 }) {
            Image($r('app.media.air')).width(50).height(50)
            Text('空调')
          }
        }
        .borderRadius(8)
        .backgroundColor('#FFFFFF')
        .width('47%')
        .height('8%')
        .onClick(() => {
          this.AirController.open()
        })
      }.width('95%').margin({ top: 10 })

    }
  }

  //----------------------------------------post请求数据------------------------------//
  private weatherRequest() {
    let url: string = "http://apis.juhe.cn/simpleWeather/query?key=397c9db4cb0621ad0313123dab416668&city=洛阳"
    httpRequest(url).then(res => {
      const data: resultType = res.data as resultType;
      if (data.result == null || data.result.realtime == null) {
        Prompt.showToast({ message: '发生未知错误！无法获取天气', duration: 2000 })
      }
      else {
        this.weatherBuffer = data.result;
      }
    });
  }

  // private getHomeMessage() {
  //   let messageUrl = ''
  //   httpRequest(messageUrl).then(res => {
  //     const data: HomeMessageType = res.data as HomeMessageType;
  //     if (data.homeName === null || data.homePosition === null) {
  //       Prompt.showToast({
  //         message: '发生未知错误!',
  //         duration: 2000 })
  //     }
  //     else {
  //       this.messageBuffer = data
  //       console.info('请求结果:' + JSON.stringify(this.messageBuffer));
  //     }
  //   })
  // }

  //-----------------------------------broker数据请求--------------------------//
  private updateDeviceData() {
    //开启子线程监听设备数据
      let url = 'http://8.134.239.14:5000/user/post'
      httpRequest(url,http.RequestMethod.GET).then(res => {
        if(res.msg !== '500'){
          this.receiveBuffer = res.data as deviceInfo
          console.log(JSON.stringify(res.data))
        }
      })
  }
  //-----------------------------------初始页面函数-----------------------------//
  aboutToAppear() {
    // this.getHomeMessage();
    this.weatherRequest();
    this.updateDeviceData();
    if(this.receiveBuffer.temp == '__'){
      Prompt.showToast({ message: '家庭网络问题，请等待！', duration: 2000 })
    }
    this.TimerID = setInterval(()=>{
      this.updateDeviceData();
    },2000)
  }
}