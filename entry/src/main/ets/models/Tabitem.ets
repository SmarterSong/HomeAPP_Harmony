//页面标签组件
export interface TabItem
{
  tabIcon: Resource;
  tabIconSelect:Resource;
  title:string;
  id:number;
}
export enum tabID
{
  HOME,
  SCENE,
  USER
}

export const tabItemList:TabItem[] = [
  {
    tabIcon: $r('app.media.homeB'),
    tabIconSelect:$r('app.media.homeA'),
    title:'小屋',
    id:tabID.HOME
  },
  {
    tabIcon: $r('app.media.SceneA'),
    tabIconSelect:$r('app.media.SceneB'),
    title:'场景',
    id:tabID.SCENE
  },
  {
    tabIcon: $r('app.media.userA'),
    tabIconSelect:$r('app.media.userB'),
    title:'我的',
    id:tabID.USER
  }

]

