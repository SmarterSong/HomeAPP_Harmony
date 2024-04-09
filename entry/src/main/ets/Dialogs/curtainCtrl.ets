import  {sendDeviceControl}  from '../models/AccessHttpServer'
import Prompt from '@system.prompt'
import { deviceDataType } from '../models/HttpDataType'

@CustomDialog
export struct curtainControl {
  controller: CustomDialogController
  @State switchList :Array<String> = ['客厅','卧室1','卧室2','卧室3']
  @State control: deviceDataType = new deviceDataType()
  build() {
    Column() {
      Text('窗帘控制').fontSize(20).margin({bottom:'20%'})
      Grid() {
        ForEach(this.switchList, switchList => {
          GridItem() {
            Row(){
              Text(switchList)
              Toggle({ type: ToggleType.Switch, isOn: false })
                .width(60).height(40)
                .onChange((isOn)=>{
                  if(isOn){
                    this.control.curtain = 1
                    sendDeviceControl(this.control)
                    Prompt.showToast({ message: switchList +'窗帘已打开', duration: 2000})
                    //console.log(switchList +'窗帘已打开')
                  }
                  else{
                    this.control.curtain = 0
                    sendDeviceControl(this.control)
                    Prompt.showToast({ message: switchList +'窗帘已关闭', duration: 2000})
                  }
                })
            }
          }
        }, switchList => switchList)
      }
      .rowsTemplate('1fr 1fr 1fr')
      .columnsTemplate('1fr 1fr ')
    }.height('50%')
    .backgroundImage($r('app.media.curtainsBK'))
    .backgroundImageSize(ImageSize.Cover)
  }
}
