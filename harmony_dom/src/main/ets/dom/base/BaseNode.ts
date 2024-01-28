// @ts-nocheck
import { BaseNodeGroup } from './BaseNodeGroup'

/**
 * author: wulinpeng
 * date: 2024/1/27
 * desc:
 */
@Observed
export class BaseNode {
  id: string
  parentNode?: BaseNodeGroup = undefined

  width_string: string = 'auto'
  width: number = 0
  height_string: string = 'auto'
  height: number = 0

  paddingLeft?: number
  paddingTop?: number
  paddingRight?: number
  paddingBottom?: number

  layoutWeight: number = 0

  setWidthString(width: string) {
    this.width_string = width
  }
  setWidth(width: number) {
    this.width = width
  }
  getWidth() {
    return this.width_string != "" ? this.width_string : this.width
  }

  setHeightString(height: string) {
    this.height_string = height
  }
  setHeight(height: number) {
    this.height = height
  }
  getHeight() {
    return this.height_string != "" ? this.height_string : this.height
  }

  setPadding(left?: number, top?: number, right?: number, bottom?: number) {
    this.paddingLeft = left
    this.paddingTop = top
    this.paddingRight = right
    this.paddingBottom = bottom
  }
  getPadding() {
    return {left: this.paddingLeft, top: this.paddingTop, right: this.paddingRight, bottom: this.paddingBottom}
  }

  setLayoutWeight(weight: number) {
    this.layoutWeight = weight
  }
}