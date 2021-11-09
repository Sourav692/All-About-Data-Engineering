"""
Given a BST and an integer k. Find and return the path from the node with data k and root (if a node with data k is present in given BST) in a list. Return empty list otherwise.
Note: Assume that BST contains all unique elements.

Input Format :
The first line of input contains data of the nodes of the tree in level order form. The data of the nodes of the tree is separated by space. If any node does not have left or right child, take -1 in its place. Since -1 is used as an indication whether the left or right nodes exist, therefore, it will not be a part of the data of any node.   
The following line of input contains an integer, that denotes the value of k.

Output Format :
The first line and only line of output prints the data of the nodes in the path from node k to root. The data of the nodes is separated by single space.

Sample Input 1:
8 5 10 2 6 -1 -1 -1 -1 -1 7 -1 -1
2
Sample Output 1:
2 5 8

1) root is None?

2) root.data == searchData
       Do something

3) Call on left
   if left returns None:
        call on right
    else:
        append root.data to leftoutput

"""

import queue
class BinaryTreeNode:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

def findPathBST(root,data):
    if root is None:
        return None
    # If data is found in root node
    if root.data == data:
        output = []
        output.append(root.data)
        return output

    # if data is smaller check in left tree
    if root.data > data:
        output = findPathBST(root.left,data)
        if output is not None:
            output.append(root.data)
        return output
    
    # if data is larger check in left tree
    if root.data < data:
        output = findPathBST(root.right,data)
        if output is not None:
            output.append(root.data)
        return output
    

def buildLevelTree(levelorder):
    index = 0
    length = len(levelorder)
    if length<=0 or levelorder[0]==-1:
        return None
    root = BinaryTreeNode(levelorder[index])
    index += 1
    q = queue.Queue()
    q.put(root)
    while not q.empty():
        currentNode = q.get()
        leftChild = levelorder[index]
        index += 1
        if leftChild != -1:
            leftNode = BinaryTreeNode(leftChild)
            currentNode.left =leftNode
            q.put(leftNode)
        rightChild = levelorder[index]
        index += 1
        if rightChild != -1:
            rightNode = BinaryTreeNode(rightChild)
            currentNode.right =rightNode
            q.put(rightNode)
    return root

# Main
levelOrder = [int(i) for i in input().strip().split()]
root = buildLevelTree(levelOrder)
data = int(input())
path = findPathBST(root,data)
if path is not None:
    for ele in path:
        print(ele,end=' ')

