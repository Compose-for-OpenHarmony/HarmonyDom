// @ts-nocheck
import { BaseNode } from './BaseNode';

/**
 * author: wulinpeng
 * date: 2024/1/27
 * desc:
 */
export class BaseNodeGroup extends BaseNode implements IDataSource {
  children: BaseNode[] = []
  protected listeners: DataChangeListener[] = []

  totalCount(): number {
    return this.children.length
  }

  getData(index: number): any {
    return this.children[index]
  }

  registerDataChangeListener(listener: DataChangeListener) {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener)
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener) {
    const index = this.listeners.indexOf(listener)
    if (index >= 0) {
      this.listeners.splice(index, 1)
    }
  }

  insert(index: number, node: BaseNode) {
    this.children.splice(index, 0, node)
    for (let listener of this.listeners) {
      listener.onDataAdded(index)
    }
  }

  move(fromIndex: number, toIndex: number, count: number) {
    let dest = toIndex
    if (fromIndex < toIndex) {
      dest = toIndex - count
    }
    let data = this.children.splice(fromIndex, count)
    this.children.splice(dest, 0, data)
    for (let listener of this.listeners) {
      for (let i = 0; i < count.length; i++) {
        // TODO
        listener.onDataMove(fromIndex + i, toIndex + i)
      }
    }
  }

  remove(index: number, count: number) {
    this.children.splice(index, count)
    for (let listener of this.listeners) {
      for (let i = index + count - 1; i > index - 1; i--) {
        listener.onDataDelete(index)
      }
    }
  }

  clear() {
    this.children = []
    for (let listener of this.listeners) {
      for (let i = index + count - 1; i > index - 1; i--) {
        listener.onDataReloaded()
      }
    }
  }

}