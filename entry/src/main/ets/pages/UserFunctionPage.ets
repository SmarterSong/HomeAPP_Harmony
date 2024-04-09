import BrandSearchComponents from '../tabViews/BrandSearchView'
import FamilyManageComponents from '../tabViews/FamilyManageView'
import PrivacySettingComponents from '../tabViews/PrivacySettingView'
import selfDeviceComponents from '../tabViews/selfDeviceView'
import router from '@ohos.router'
@Entry
@Component
struct UserFunctionPage {
  @State buttonIndex: number = router.getParams()['index']
  build() {
    Column(){
      if(this.buttonIndex === 0){
        selfDeviceComponents()
      }
      else if(this.buttonIndex === 1){
        FamilyManageComponents()
      }
      else if(this.buttonIndex === 2){
        BrandSearchComponents()
      }
      else if(this.buttonIndex === 3){
        PrivacySettingComponents()
      }
    }.width('100%').height('100%')
    .backgroundColor('#fff0f0f0')
  }

}