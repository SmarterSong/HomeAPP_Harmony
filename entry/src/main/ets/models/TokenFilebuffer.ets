// pages/xxx.ets
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';

export function updateToken(message:string,filePath:string):void {
  // 打开文件
  let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  // 写入一段内容至文件
  let writeLen = fs.writeSync(file.fd, message);
  console.info("The length of str is: " + writeLen);
  // 关闭文件
  fs.closeSync(file);
}

export function readToken(filePath:string):string{
    let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE);
    let buf = new ArrayBuffer(4096);
    let readLen = fs.readSync(file.fd, buf);
    fs.closeSync(file);
    let tokenMessage =  String.fromCharCode.apply(null, new Uint8Array(buf.slice(0, readLen)))
    return tokenMessage
}
