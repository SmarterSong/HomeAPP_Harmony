
export class TVDetails{
  status:boolean = false
  house:number = 0
  sound:number = 10
  selectDir:number = 0
  enter:number = 0
  home :number = 0
  back :number = 0
  set  :number = 0
  search:string = '---'
}
@CustomDialog
export struct TVControl {
  controller: CustomDialogController
  @State TVCtrl:TVDetails = new TVDetails()
  @State switchList :Array<String> = ['客厅','卧室1','卧室2','卧室3','厨房','卫生间']
  build() {
    Column() {
      //电视位置标签
      Row() {
        Text(this.switchList[this.TVCtrl.house].toString()).fontSize(20)
        Image($r('app.media.homeA')).width(25).height(25)
      }
      .onClick(() => {
        this.TVCtrl.house++
        this.TVCtrl.house %= this.switchList.length
      })

      //搜索频道
      Row(){
        Toggle({ type: ToggleType.Button, isOn: false }) {
          Text('ON').fontColor('#182431')
            .fontSize(20).fontWeight(FontWeight.Bold)
        }.width(50).height(50)

        TextInput({ placeholder: '输入关键词' })
          .maxLength(11)
          .type(InputType.Normal)
          .onChange((value: string) => {
            this.TVCtrl.search = value;
          })
          .backgroundColor('#ffdddbdb')
          .width('60%')
        Image($r('app.media.search')).width(30).height(30)
      }

      //声音调节
      Row(){
        Text('-').fontWeight(FontWeight.Bold).fontSize(50)
          .onClick(()=>{
            this.TVCtrl.sound --
          }).margin({left:'7%'})
        Progress({value:0, total:20, type:ProgressType.Capsule}).width('60%').height(30)
          .value(this.TVCtrl.sound).color('#000')
        Text('+').fontWeight(FontWeight.Bold).fontSize(50)
          .onClick(()=>{
            this.TVCtrl.sound ++
          })
      }


      //控制频道
      Column(){
        Image($r('app.media.U')).width(70).height(70)
        Row(){
          Image($r('app.media.L')).width(70).height(70)
          Text(' OK ').fontSize(40).fontWeight(FontWeight.Bold)
            .width(80).height(80).fontColor('#888')
            .borderRadius(50).backgroundColor(Color.Black)
          Image($r('app.media.R')).width(70).height(70)
        }
        Image($r('app.media.D')).width(70).height(70)
      }
      //主页和返回
      Row(){
        Image($r('app.media.return')).width(50).height(50)
        Image($r('app.media.list')).width(50).height(50).margin('10%')
        Image($r('app.media.set')).width(50).height(50)
      }

    }.width('100%').height('70%')
    .backgroundImage($r('app.media.airCtrlBK'))
    .backgroundImageSize(ImageSize.Cover)
  }
}
