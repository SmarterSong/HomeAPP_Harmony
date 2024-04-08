import { sendDeviceControl } from '../models/AccessHttpServer'
import Prompt from '@system.prompt'
import { deviceDataType } from '../models/HttpDataType'

@CustomDialog
export struct roomLightControl {
  controller: CustomDialogController
  @State switchList :Array<String> = ['客厅','卧室1','卧室2','卧室3','厨房','卫生间']
  @State control: deviceDataType = new deviceDataType()
  build() {
    Column() {
      Text('灯光控制').fontSize(20).margin({bottom:'10%'})
      Grid() {
        ForEach(this.switchList, switchList => {
          GridItem() {
            Row(){
              Text(switchList)
              Toggle({ type: ToggleType.Switch, isOn: false })
                .width(60).height(40)
                .onChange((isOn)=>{
                  if(isOn){
                    this.control.light = 1
                    sendDeviceControl(this.control)
                    Prompt.showToast({ message: switchList +'灯已打开', duration: 2000})
                    console.log(JSON.stringify(this.control))
                  }
                  else{
                    this.control.light = 0
                    sendDeviceControl(this.control)
                    Prompt.showToast({ message: switchList +'灯已关闭', duration: 2000})
                    console.log(JSON.stringify(this.control))
                  }
                })
            }
          }
        }, switchList => switchList)
      }
      .rowsTemplate('1fr 1fr 1fr')
      .columnsTemplate('1fr 1fr ')
      .height('80%')
    }.height('50%')
    .backgroundImage($r('app.media.lightCtrlBK'))
    .backgroundImageSize(ImageSize.Cover)
  }
}
