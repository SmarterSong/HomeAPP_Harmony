import router from '@ohos.router'
import { HomeMessageType } from '../models/HttpDataType'
import ArrayList from '@ohos.util.ArrayList'

@Component
export  default  struct  FamilyManageComponents {
  @State headPhoto: Resource = $r('app.media.userB')
  @State username: string = 'Admin'
  @State listColor:Color = Color.White       //'#fff0f0f0'
  @State myHome:HomeMessageType = {
    homeName:'我们的小家',
    homePosition:'洛阳',
    deviceID:new ArrayList(),
    deviceType:new ArrayList(),
    roomType:new ArrayList()
  }
  @State room:Array<string> = ['客厅','卧室1','卧室2','卧室3','卫生间','添加']
  @State master:Array<Array<string>> = [['宋鉴鑫','主人'],['汪彩彩','女主人'],['添加','']]
  build() {
    Column(){
      Row(){
        Image($r('app.media.back')).width(40).height(40)
        Text('我的家庭').fontSize(20).margin('10%')
      }.width('95%')
      .onClick(()=>{
        router.back()
      })
      Column({space:5}) {
        Text('家庭名称').fontSize(24)
        Text(this.myHome.homeName).fontSize(20).fontColor('#a83925ea')
        Divider().width('80%').margin('2%')
        Text('家庭位置').fontSize(24)
        Text(this.myHome.homePosition).fontSize(20).fontColor('#a83925ea')
      }
      .width('90%')
      .height(150)
      .margin(5)
      .borderRadius(24)
      .backgroundColor('#ffffffff')
      .onClick(()=>{
        //this.callbackChangeScene()
      })
      Text('已添加房间').fontSize(20)
      Divider().width('95%').margin('3%')
      Grid() {
        ForEach(this.room, room => {
          GridItem() {
            Text(room).fontSize(22).fontWeight(FontWeight.Bold)
          }
          .height(70).borderRadius(10)
          .backgroundColor('#ffffffff')
        }, room => room)
      }.width('90%').height('20%')
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10).rowsGap(15)
      Divider().width('95%').margin('3%')
      Text('家庭成员')
      List() {
        ListItem() {
          Column() {
            Row({space:20}) {
              Image($r('app.media.userA')).width(40).height(40)
              Text(this.master[0][0]).fontSize(22)
              Text(this.master[0][1]).fontSize(22).fontColor('#ffef5050')
            }
            Divider().width('80%').margin('3%')
          }
        }.height(70).backgroundColor('#ffffffff')

        ListItem() {
          Column() {
            Row({space:20}) {
              Image($r('app.media.userA')).width(40).height(40)
              Text(this.master[1][0]).fontSize(22)
              Text(this.master[1][1]).fontSize(22).fontColor('#ffef5050')
            }
            Divider().width('80%').margin('3%')
          }
        }.height(70).backgroundColor('#ffffffff')
        ListItem() {
          Column() {
            Row({space:20}) {
              Text(this.master[2][0]).fontSize(22)
              Text(this.master[2][1]).fontSize(22).fontColor('#ffef5050')
            }
            Divider().width('80%').margin('3%')
          }
        }.height(70)
        }
      .borderRadius(24).height('50%').width('90%')
      .backgroundColor('#ffffff')
      .alignListItem(ListItemAlign.Center)
      }
    }
  // //ARRAYLIST
  // private  roomInit(){
  //   this.myHome.roomType.add('客厅')
  //   this.myHome.roomType.add('卧室1')
  //   this.myHome.roomType.add('卧室2')
  //   this.myHome.roomType.add('卧室3')
  //   this.myHome.roomType.add('饭厅')
  //   this.myHome.roomType.add('厨房')
  //   this.myHome.roomType.add('卫生间')
  // }
  aboutToAppear(){
    // this.roomInit()
  }
}