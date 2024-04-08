
import Prompt from '@system.prompt'
import { sendDeviceControl } from '../models/AccessHttpServer'
import { deviceDataType } from '../models/HttpDataType'

@CustomDialog
export struct doorControl {
  controller: CustomDialogController
  @State password:string = ' '
  @State control: deviceDataType = new deviceDataType()
  build() {
    Column() {
      Text('请设置开门密码').fontSize(24).margin({top:'5%'})
      Text('为了家庭的安全，暂不支持远程开门，可以使用其他方式开门')
        .fontSize(14).width('70%').fontColor('#888')
      TextInput({ placeholder: '6位数字密码' })
        .type(InputType.Number)
        .maxLength(6)
        .onChange((value: string) => {
          this.password = value
        }).width('50%').margin('5%')

      if(this.password.length === 6){
        Button('SET').type(ButtonType.Circle)
          .width(100).height(100)
          .onClick(()=>{
            this.control.password = this.password
            sendDeviceControl(this.control)
            Prompt.showToast({ message: '设置成功', duration: 2000})
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
