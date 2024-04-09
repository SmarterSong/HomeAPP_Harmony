import router from '@ohos.router';
import prompt from '@system.prompt';
import http from '@ohos.net.http';
import { httpRequest}  from '../models/AccessHttpServer';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { readToken, updateToken } from '../models/TokenFilebuffer';
import { LoginPostType, LoginResultType, SignupPostType, SignupResultType } from '../models/HttpDataType';

@Entry
@Component
struct SignupPage {

  @State answer:LoginResultType = {
    code: '---',
    data:null,
    msg:'---'
  }
  @State loginMessage:LoginPostType = {
    user: '123456',
    pwd:'123',
    token:'none'
  }
  @State ComponentStyle:number = 0
  @State filePath:string = this.getPath()
  build(){
    Column(){
       if(this.ComponentStyle === 0) {
         SignupComponent({ answer: this.answer, filePath: this.filePath })
       }
      else if(this.ComponentStyle === 1){
         LoadingComponent()
       }
      else if(this.ComponentStyle === 2){
         LoginComponent({answer:this.answer,filePath:this.filePath,loginMessage:this.loginMessage})
       }
    }
  }
  //-------------------------------获取沙箱路径-----------------------------------//
  private  getPath():string{
    let context = getContext(this) as common.UIAbilityContext;
    let filesDir = context.filesDir;
    let filePath = filesDir + 'token.txt'
    return filePath
  }
  //---------------------------------登录请求--------------------------------//
  private sendLogin():void{
    let url = 'http://8.134.239.14:5000/user/login'
    httpRequest(url,http.RequestMethod.POST,JSON.stringify(this.loginMessage),{token:this.loginMessage.token}).then(res=>{
      const result: LoginResultType = res.data as LoginResultType;
      if(result !== null)
      this.answer = result
    })
  }
  //---------------------------------处理返回参数----------------------------//
  private handleAnswer():void{
    if(this.loginMessage.token == 'success'){ //this.answer.msg === '登录成功'
      router.pushUrl({ url: 'pages/HomePage' })
    }
    else{
      this.ComponentStyle = 2           //跳转登录
    }
  }
  //-----------------------------
  aboutToAppear(){
    fs.access(this.getPath(), (err, res) => {
      if (err) {
        console.log("错误: " + err.message + ", error code: " + err.code);
      } else {
        if (res) {
          this.loginMessage.token = readToken(this.getPath())
          this.ComponentStyle = 1 //切换到加载页面
          this.sendLogin()
          this.handleAnswer()
          prompt.showToast({
          message: JSON.stringify(this.answer),
          duration: 2000})
        }
      }
    });
    this.ComponentStyle = 0
  }
}
//-------------------------------------------------------------------------------------------//
//============================================加载子页面=======================================//
//-------------------------------------------------------------------------------------------//
@Component
struct LoadingComponent{
  build(){
    Column() {
      Text('Loading...').fontSize(30)
    }
  }
}

//=========================================================================================//
//---------------------------------------------注册子页面------------------------------------//
//=========================================================================================//
@Component
struct SignupComponent{
  @Prop filePath:string
  @Prop answer :LoginResultType
  @State signupMessage:SignupPostType = {
    user: '',
    pwd:'',
    proveNumber:'none'
  }

  @State isClick:boolean = false
  @State rePassword:string = '---'
  build() {
    Column({ space: 10 }) {
      Image($r('app.media.APPicon'))
        .width(78)
        .height(78)
        .margin({ top: 120, bottom: 20 })
      Text('欢迎使用智慧管家')
        .fontSize(24)
        .fontWeight(FontWeight.Medium)
        .fontColor('#182431')
      Text('请注册您的账号')
        .fontSize(16)
        .fontColor('#798189')
        .margin({ top: 20, bottom: 20 })
      TextInput({ placeholder: '账号/手机号' })
        .maxLength(11)
        .type(InputType.Number)
        .onChange((value: string) => {
          this.signupMessage.user = value;
        })
        .backgroundColor('#F0F2F4')
        .width('90%')
      TextInput({ placeholder: '新密码' })
        .type(InputType.Password)
        .onChange((value: string) => {
          this.signupMessage.pwd = value;
        })
        .backgroundColor('#F0F2F4')
        .width('90%')
      TextInput({ placeholder: '再次确认密码' })
        .type(InputType.Password)
        .onChange((value: string) => {
          this.rePassword = value;
        })
        .backgroundColor('#F0F2F4')
        .width('90%')
      //判断注册逻辑，确定按钮是否可用

      if(this.signupMessage.pwd === this.rePassword
        && this.rePassword !== '' && this.signupMessage.user !== ''){
        Button('确定').width('80%').margin({ top: 20})
          .onClick(()=>{
            this.requestSignup()
            this.handleAnswer()
          })
      }
      else {
        Button('确定').width('80%').margin({ top: 20})
          .stateEffect(false)
          .backgroundColor('#888')
      }

    }.width('100%')
    .margin({ top: 10 })
  }
  //--------------------------回调函数-----------------
  private requestSignup(){
    let url = 'http://8.134.239.14:5000/user/reg'
    httpRequest(url,http.RequestMethod.POST,JSON.stringify(this.signupMessage)).then(res=>{
      const result: SignupResultType = res.data as SignupResultType;
      if(result !== null ){
        this.answer = result
        //验证token信息是否为空
        if(this.answer.data !== null ){
          //updateToken(this.answer.data.token,this.filePath)
          updateToken('success',this.filePath)
        }
        else{
          prompt.showToast({ message: '未知错误！请重试', duration: 2000})
        }
      }
      else{
        prompt.showToast({ message: '网络问题！请重试', duration: 2000})
      }
    })
  }
  //-------------------------处理请求-----------------------------//
  private handleAnswer(){
    if(this.answer.msg === '用户创建成功' ){
      router.pushUrl({ url: 'pages/HomePage' })
    }
    else {
      prompt.showToast({ message: this.answer.msg, duration: 2000})
    }
  }
}
//--------------------------------------------------------------------------------------------//
//========================================登陆子页面===========================================//
//------------------------------------------------------------------------------------------//

@Component
struct LoginComponent {
  @Prop loginMessage:LoginPostType
  @Prop filePath:string
  @Prop answer :LoginResultType
  build() {
    Column({ space: 10 }) {
      Image($r('app.media.APPicon'))
        .width(78)
        .height(78)
        .margin({ top: 120, bottom: 20 })
      Text('欢迎使用智慧管家')
        .fontSize(24)
        .fontWeight(FontWeight.Medium)
        .fontColor('#182431')
      Text('登录账号以使用更多服务')
        .fontSize(16)
        .fontColor('#798189')
        .margin({ top: 20, bottom: 20 })
      TextInput({ placeholder: '账号/手机号' })
        .maxLength(11)
        .type(InputType.PhoneNumber)
        .onChange((value: string) => {
          this.loginMessage.user = value;
        })
        .backgroundColor('#ffdddbdb')
        .width('95%')
      TextInput({ placeholder: '密码' })
        .type(InputType.Password)
        .onChange((value: string) => {
          this.loginMessage.pwd = value;
        })
        .backgroundColor('#ffdddbdb')
        .width('95%')
      Row() {

        Text('注册账号/忘记密码？')
          .fontColor('#017DFF')
          .onClick(()=>{
            router.pushUrl({ url: 'pages/SignupPage' })
          })

      }.width('50%')
      .margin({ top: 10 })
      .justifyContent(FlexAlign.SpaceBetween)
      Button('登录')
        .onClick(() => {
          if(this.loginMessage.user !== '' && this.loginMessage.pwd!== '' ){
            this.loginMessage.token = readToken(this.filePath)
            this.requestLogin()
            this.handleAnswer()
          }
          else{
            prompt.showToast({
              message: '账号或密码为空！请重试',
              duration: 2000})
          }
        })
        .width('80%')
        .margin({ top: 20})
    }.height('100%')
    .width('100%')
    .padding(10)
    .backgroundColor('#F1F3F5')
  }
  //-----------------------------登录请求与验证------

  private requestLogin(){
    let  url = 'http://8.134.239.14:5000/user/login'
    httpRequest(url,http.RequestMethod.POST,JSON.stringify(this.loginMessage),{token:this.loginMessage.token}).then(res=>{
      const data: LoginResultType = res.data as LoginResultType;
      this.answer = data
      //验证token信息是否为空
      if(this.answer.data !== null ){
        prompt.showToast({
          message: '登录错误！请重试',
          duration: 2000})
      }
      else{
        updateToken(this.answer.data.token,this.filePath)
      }
    })
  }
  private  handleAnswer(){
    if(this.answer.msg === '登陆成功'|| this.loginMessage.token == 'success' ){
      router.pushUrl({ url: 'pages/HomePage' })
    }
    else if(this.answer.code == '2'){
      prompt.showToast({
        message: '账号或密码错误！',
        duration: 2000})
    }
    else if(this.answer.code == 'false') {
      prompt.showToast({
        message: '发生未知错误！',
        duration: 2000})
    }
  }
}
