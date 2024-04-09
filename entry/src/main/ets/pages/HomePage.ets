import HomeComponents from '../tabViews/HomeManageView';
import { tabID, tabItemList } from '../models/Tabitem';
import UserCenterComponents from '../tabViews/UserCenterView';
import SceneComponents from '../tabViews/SmartSceneView';
@Entry
@Component
struct HomePage {
  @State pageIndex: number  = 0;  //页面索引
  private tabContorl: TabsController = new TabsController(); //tab切换控制器
  @Builder selfTabBuilder(index: number)
  {
    Column({space:10}){
      Image(index === this.pageIndex ? tabItemList[index].tabIconSelect:tabItemList[index].tabIcon)//三目运算符
        .width(32)
        .height(32)
      Text(tabItemList[index].title)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.pageIndex === index ? '#f8000000':'#888')
    }
  }
  build() {
    Tabs({barPosition:BarPosition.End}){
      TabContent(){
        HomeComponents();   //初始化小屋页面显示
      }
      .tabBar(this.selfTabBuilder(tabID.HOME))
      TabContent(){
        SceneComponents();//初始化场景页面显示
      }
      .tabBar(this.selfTabBuilder(tabID.SCENE))
      TabContent(){
        UserCenterComponents();//初始化个人中心页面显示
      }
      .tabBar(this.selfTabBuilder(tabID.USER))
    }
    .width('100%')
    .height('100%')
    .barWidth('100%')
    .backgroundColor('#fff0f0f0')
    .barMode(BarMode.Fixed)
    .onChange((index)=>{
      this.pageIndex = index;
    })
  }
}