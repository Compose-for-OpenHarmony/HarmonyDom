import systemDateTime from '@ohos.systemDateTime'

/**
 * author: wulinpeng
 * date: 2024/1/27
 * desc:
 */
export class FrameCallback {
  onNextFrame(callback: (Any) => void) {
    // setTimeout(_ => {
      callback(systemDateTime.getTime())
    // }, 10)
  }
}