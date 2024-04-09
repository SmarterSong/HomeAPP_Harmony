
import http from '@ohos.net.http';
import Prompt from '@system.prompt';
import { deviceDataType } from './HttpDataType';

export interface httpOptions {
  timeOut?: number;
  ContentType?: string;
  header?: Object;
  state?: string;
  callBack?: Function;
}

const HTTP_READ_TIMEOUT = 60000;
const HTTP_CONNECT_TIMEOUT = 60000;
const CONTENT_TYPE = 'application/json'

export function httpRequest(
    url: string,
    method: http.RequestMethod = http.RequestMethod.GET,
    params?: string | Object | ArrayBuffer,
    header?:{"token":string },
    options?: httpOptions
): Promise<ResponseResult> {
  const request = http.createHttp();
  // 处理状态
  if(options?.state) {
    switch (options.state) {
      case 'on':
        request.on('headersReceive', (header) => options.callBack(header));
        break;
      case 'once':
        request.on('headersReceive', (header) => options.callBack(header));
        break;
      case 'off':
        request.off('headersReceive');
        break;
      case 'destroy':
        request.destroy();
        break;
      default:
        break;
    }
    return;
  }
  // 处理请求
  const responseResult = request.request(url, {
    // 超时时间
    readTimeout: options?.timeOut || HTTP_READ_TIMEOUT,
    connectTimeout: options?.timeOut || HTTP_CONNECT_TIMEOUT,
    method,
    extraData: params || {},
    header: header || {
      'Content-Type': options?.ContentType || CONTENT_TYPE
    },
  });
  let serverData: ResponseResult = new ResponseResult();
  // Processes the data and returns.
  return responseResult.then((data: http.HttpResponse) => {
    if (data.responseCode === http.ResponseCode.OK) {
      // Obtains the returned data.
      let result = `${data.result}`;
      let resultJson: ResponseResult = JSON.parse(result);
      serverData.data = resultJson;
      serverData.code = 'success';
      serverData.msg = resultJson?.msg;
    } else {
      serverData.msg = `error info & ${data.responseCode}`;
    }
    return serverData;
  }).catch((err) => {
    serverData.msg = `${err}`;
    return serverData;
  })
}
export class ResponseResult {

  code: string;
  data: string | Object | ArrayBuffer;
  msg: string | Resource;

  constructor() {
    this.code = '';
    this.msg = '';
    this.data = '';
  }
}
//-----------------------------------发送控制命令-----------------------------//
export  function  sendDeviceControl(DataBuffer:deviceDataType) {
  let url = 'http://8.134.239.14:5000/user/sendmsg'
  httpRequest(url, http.RequestMethod.POST, JSON.stringify(DataBuffer)).then(res => {
    if (res.msg === 'false') {
      Prompt.showToast({
        message: '网络错误!请重试',
        duration: 2000 })
    }
    console.log(JSON.stringify(res))
  })
}
//----------------------------------------------------------------------//
export default httpRequest;