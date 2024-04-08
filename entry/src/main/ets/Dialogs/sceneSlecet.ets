import { deviceDataType } from '../models/HttpDataType'

@CustomDialog
export struct sceneSelect{

  controller: CustomDialogController
  itemStatus: (state:boolean) => number
  @State modeState:boolean = false
  @State control: deviceDataType = new deviceDataType()
  @State describeText :Array<String> = [
    '清晨起床自动为您打开卧室灯光，并拉开窗帘，阳光洒入屋内',
    '夜间休息时检测睡眠状态，发现起夜自动为你打开柔光床头灯，让起夜不在摸黑',
    '回家为你开启体感开门无需输入密码,根据太天色亮起灯光',
    '外出时语音提醒是否携带必须物品,关闭所有门窗和灯光',
    '客人来访时提醒,通过人脸识别技术语音迎接客人',
    '根具位置信息，返家回家提前为您打开空调，热水器等，让你体验舒适生活',
    '出差时，开启摄像头监视家中情况，开启报警，开启安防',
    '开启门锁禁用，开启室外摄像，实时提醒防盗',
    '好友或邻居托管家庭，突发情况可第一时间通知好友帮忙处理',
    '不在家时开启宠物定时投喂，以及宠物定位，掌握宠物活动路线'
  ]
  build() {
    Column() {
      Text('场景描述').fontSize(20).margin('5%')
      Text(this.describeText[this.itemStatus(this.modeState)].toString())
        .width('80%').margin({ bottom:'10%' })
      Toggle({ type: ToggleType.Button, isOn: false }) {
        Text('OPEN').fontColor('#182431').fontSize(20)
      }
      .backgroundColor('#888')
      .width('50%').height(50)
      .selectedColor('#ff49b853')
      .onChange((isOn)=>{
        this.modeState = isOn
      })
    }.height('40%')
  }

}