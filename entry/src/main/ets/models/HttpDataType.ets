//--------------获取天气的请求格式------------------------------//
import ArrayList from '@ohos.util.ArrayList';

export interface resultType {
  resultCode: string;
  reason: string;
  result: resultValType | null;
  error_code: string;
}
export interface resultValType {
  city: string;
  realtime: realtimeType;
  future: Object;
}
export interface realtimeType {
  temperature: string;
  humidity: string;
  info: string;
}
//------------------------------------获取登录请求格式-------------------------//
export interface  dataType{
  token:string
}
export interface LoginResultType {
  code:string
  data:dataType
  msg:string
}
export interface LoginPostType {
  user:string
  pwd:string
  token:string
}
export interface SignupPostType {
  user:string
  pwd:string
  proveNumber:string
}
export interface SignupResultType {
  code:string
  data:dataType
  msg:string
}
//-----------------------------获取信息请求格式-----------------------------//
export interface HomeMessageType {
  homeName:string
  homePosition:string
  deviceID:ArrayList<string>
  deviceType:ArrayList<string>
  roomType:ArrayList<string>
}
//-----------------------------获取数据请求格式----------------------------//
export class deviceDataType {
  temp:number =0
  humidity:number= 0
  illumination:string =  '0'
  smoke:number = 0
  fire:number = 0
  gate:number = 0
  garage:number = 0
  curtain: number=0
  light:number = 0
  kongtiao:number = 0
  password: string = '123456'
}
export class  deviceInfo{

  temp:string
  humidity:string
  illumination:string
  smoke:number
  fire:number
  gate:number
  garage:number
  curtain: number
  light:number
  kongtiao:number

}
