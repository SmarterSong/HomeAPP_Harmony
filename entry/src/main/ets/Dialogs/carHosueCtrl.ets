
import Prompt from '@system.prompt'
import { sendDeviceControl } from '../models/AccessHttpServer'
import { deviceDataType } from '../models/HttpDataType'

@CustomDialog
export struct carHouseControl {
  controller: CustomDialogController
  @State password:string = ' '
  @State control: deviceDataType = new deviceDataType()
  build() {
    Column() {
      Text('请输入密码开门').fontSize(24).margin({top:'5%'})
      TextInput({ placeholder: '6位数字密码' })
        .type(InputType.Number)
        .maxLength(6)
        .onChange((value: string) => {
          this.password = value
        }).width('50%').margin('10%')

      if(this.password.length === 6){
        Button('OPEN').type(ButtonType.Circle)
          .width(100).height(100)
          .onClick(()=>{
            if(this.password === '888888')
              this.control.garage = 1
            sendDeviceControl(this.control)
            Prompt.showToast({ message: '车库门已开', duration: 2000})
            this.controller.close()
          })
      }
      else {
        Button('SET').type(ButtonType.Circle)
          .width(100).height(100)
          .stateEffect(false)
          .backgroundColor('#888')
      }
    }.height('40%')
  }
}
