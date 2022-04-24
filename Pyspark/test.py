## Time Complexity o(n^2)
def excludeDuplicate(lis):
    dict1 = {}
    outList = []
    
    for elem in lis:
        if elem in dict1:
            dict1[elem] += 1
        else:
            dict1[elem] = 1
    
    
    
    for key,value in dict1.items():
        if value ==1:
            outList.append(key)
    return  outList   

## Time Complexity o(n)| Space Complexity o(n) . This is optimal solution as here iso of dict we are using variable a and using memorization to reduce space complexity.
def excludeDuplicate2(lis):
    outList = []
    for i in range(1,len(lis)): ## TC = o(n). All the operation inside the loop is constant time operation
        if lis[i] == lis[i-1]:
            a = lis[i]
        else:
            if lis[i-1] == a:
                pass
            else:
                if i == len(lis)-1:           
                    outList.append(lis[i-1])
                    outList.append(lis[i])
                else:
                    outList.append(lis[i-1])
    return  outList  
                
    
if __name__ == "__main__":
    lis = [1,1,1,2,2,3,4,5,6]  ## Sorted List
    print(excludeDuplicate2(lis))