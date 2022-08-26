int calculate() {
  return 6 * 7;
}

void main(List<String> arguments) {
  initializeNameNodes();
  initialConnectionNodes();
  print(node3.nextNode!.name);
  var linkedListFunctionInstance = LinkedListFunction();
  linkedListFunctionInstance.addItem(
      newNode: MyNode(name: 'node betwenn 3,4'), previousNewNode: node3);
  print(node3.nextNode!.name);
  linkedListFunctionInstance.removeItem(removedNode: node3.nextNode!);
  print(node3.nextNode!.name);
}

late MyNode node1;
late MyNode node2;
late MyNode node3;
late MyNode node4;
late MyNode node5;

void initializeNameNodes() {
  node1 = MyNode(name: 'node1');
  node2 = MyNode(name: 'node2');
  node3 = MyNode(name: 'node3');
  node4 = MyNode(name: 'node4');
  node5 = MyNode(name: 'node5');
}

/// connect nodes by this format:
///  [prev:node5,name:node1,next:node2]
///  [prev:node1,name:node2,next:node3]
///  [prev:node2,name:node3,next:node4]
///  [prev:node3,name:node4,next:node5]
///  [prev:node4,name:node5,next:node1]
void initialConnectionNodes() {
  node1.previousNode = node5;
  node1.nextNode = node2;
  /*********************/
  node2.previousNode = node1;
  node2.nextNode = node3;
  /*********************/
  node3.previousNode = node2;
  node3.nextNode = node4;
  /*********************/
  node4.previousNode = node3;
  node4.nextNode = node5;
  /*********************/
  node5.previousNode = node4;
  node5.nextNode = node1;
  /*********************/
}

class MyNode {
  String name;
  MyNode? previousNode;
  MyNode? nextNode;
  MyNode({required this.name, this.nextNode, this.previousNode});
}

abstract class ILinkedListFunction {
  void removeItem({required MyNode removedNode});
  void addItem({required MyNode newNode, required MyNode previousNewNode});
}

class LinkedListFunction implements ILinkedListFunction {
  @override
  void addItem({required MyNode newNode, required MyNode previousNewNode}) {
    newNode.previousNode = previousNewNode;
    newNode.nextNode = previousNewNode.nextNode;
    previousNewNode.nextNode = newNode;
    newNode.nextNode!.previousNode = newNode;
  }

  @override
  void removeItem({required MyNode removedNode}) {
    removedNode.nextNode!.previousNode = removedNode.previousNode;
    removedNode.previousNode!.nextNode = removedNode.nextNode;
  }
}
