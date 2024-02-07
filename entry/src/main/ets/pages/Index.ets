import { BaseNode, createNode } from '@oh_compose/harmony_dom';
import { CounterDemo } from '../kotlin/compose-ez-ui-sample-counter';
import { WBCard } from '../weibo/WBCard';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  private node: BaseNode = new CounterDemo().createCounterNode()

  build() {
    Stack() {
      createNode(this.node)
      // WBCard()
    }
  }
}