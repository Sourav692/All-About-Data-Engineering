"""
There are two solutions for isPresent():
1) Solve it iteratively

2) Use a helper function whose arguments are root and data

** You can't solve this recursively because in isPresent we can't pass root.left or root.right because self itself is root

Insertion algorithm:
1) If root is None:

create Node with root.data and return this node because this is my new node
2) check whether to call on left or right

3) Call on that side and reveive new root for that side and attach that to the root

--> It inserts the element which might be the same root or might be the other root

Deleting an element:
What should this function return?
Return 2 things

1) True or False - if element is deleted then return True else False

2) root as well

"""

class BinaryTreeNode:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

# Basic structure of BST class
class BST:
    
    def __init__(self):
        self.root = None
        self.numNodes = 0
        
    def printTreeHelper(self,root):
        if root == None:
            return
        print(root.data,end = ":")
        if root.left != None:
            print("L:",end='')
            print(root.left.data,end=',')
        if root.right != None:
            print("R:",end='')
            print(root.right.data,end=',')
        print()
        self.printTreeHelper(root.left)
        self.printTreeHelper(root.right)
    
    def printTree(self):
        self.printTreeHelper(self.root)
    
    def isPresentHelper(self,root,data):
        if root == None:
            return None
        if root == data:
            return data
        if root.data > data:
            return self.isPresentHelper(root.left, data)  
        else:
            # Call on right
            return self.isPresentHelper(root.right, data)
            
    
    def isPresent(self, data):
        return self.isPresentHelper(self.root,data)
    
    
    def insertHelper(self,root,data):
        if root is None:
            node = BinaryTreeNode(data)
            return node
        
        if root.data > data:
            root.left = self.insertHelper(root.left, data)
            return root
        else:
            root.right = self.insertHelper(root.right, data)
            return root
    
    def insert(self, data):
        self.numNodes += 1
        self.root = self.insertHelper(self.root, data)
    
    def min(self, root):
        if root == None:
            return 1000000
        
        if root.left == None:
            return root.data
        
        return self.min(root.left)
        
    
    def deleteDataHelper(self, root, data):
        if root == None:
            return False, None
        
        if root.data < data:
            deleted, newRightNode = self.deleteDataHelper(root.right, data)
            root.right = newRightNode
            return deleted, root
        
        if root.data > data:
            deleted, newLeftNode = self.deleteDataHelper(self.root, data)
            if deleted:
                self.numNodes -= 1
            self.root = newRoot
            return deleted        
        
        # root is leaf
        if root.left == None and root.right == None:
            return True, None
        
        # root has one child
        if root.left == None:
            return True, root.right
        
        if root.right == None:
            return True, root.left
        
        # root has two children
        replacement = self.min(root.right)
        root.data = replacement
        deleted, newRightNode = self.deleteDataHelper(root.right, replacement)
        root.right = newRightNode
        
        return True, root
        
    
    def deleteData(self, data):
        deleted, newRoot = self.deleteDataHelper(self.root, data)
        if deleted:
            self.numNodes -= 1
        self.root = newRoot
        return deleted 
    
    def count(self):
        return self.numNodes
    

b = BST()
li = [int(ele) for ele in input().split()]
i = 0
while(i < (len(li) )):
    choice = li[i]
    if choice == 1:
        data = li[i+1]
        b.insert(data)
        i+=2
    elif choice == 2:
        data = li[i+1]
        b.deleteData(data)
        i+=2
    elif choice == 3:
        data = li[i+1]
        ans = b.isPresent(data)
        if ans is True:
            print('true')
        else:
            print('false')
        i+=2
    else:
        b.printTree()
        i+=1 