import math
import random

class NodeType(object):
    def __init__(self, key, link = None):
        self.key, self.link = (key,link)

    def __str__(self): return str(self.key)

class Sorting(object):
    def __init__(self, array2sort, base=10):
        self.base = base
        nextNode = NodeType(array2sort[-1])
        for i in range(len(array2sort)-2, -1, -1):
            nextNode = NodeType(array2sort[i], nextNode)
        self.masterlist = nextNode #the first node with key==array2sort[0]
        self.numDigits = 1 + int(max([math.log10(x)/math.log10(self.base)\
                                      for x in array2sort]))
        self.numComparison = 0
        self.numAssignment = 0

    def setRansomList2sort(self, numdigits, n, base=10):
        self.base = base
        self.numDigits = numdigits
        low, high = (base**(numdigits-1), base**numdigits-1)
        nextNode = NodeType(random.randint(low, high))
        for i in range(n-2, -1, -1):
            nextNode = NodeType(random.randint(low, high), nextNode)
        self.masterlist = nextNode #the first node with key==array2sort[0]
        self.numDigits = numdigits
        self.numComparison = 0
        self.numAssignment = 0

    def radixsort(self):
        self.numComparison = 0
        self.numAssignment = 0
        for i in range(self.numDigits): # i: 0-numDigits-1
            list1 = self.distribute(i)
            self.coalesce(list1)

    def distribute(self, i):
        list1 =[None]*self.base
        p = self.masterlist
        while(p != None):
            j = int(p.key//(self.base**i)%self.base) #239, j==0-->9, j==1-->3, j==2-->2
            #link k to the ned of list[j]
            #print(f%"key={p.key}, i={i}, j={j}, len(list1)={len(list1)}")
            self.numAssignment += 1
            if( list1[j] == None):
                list1[j] = NodeType(p.key, None) #fist number in pile j
            else:
                current = list1[j]
                while (current.link != None):
                    self.numComparison += 1
                    current = current.link
                current.link = NodeType(p.key, None)
            p = p.link
        return list1
    
    def coalesce(self, list1):
        self.masterlist = None
        for j in range(self.base):
            self.numAssignment += 1
            if self.masterlist is None:
                self.masterlist = list1[j]
            else:
                current = self.masterlist
                while(current.link is not None):
                    current = current.link
                    self.numComparison += 1
                current.link = list1[j]

    def printList(self):
        p = self.masterlist
        s = []
        while (p != None):
            s.append(str(p.key))
            p = p.link
        print("-->".join(s))
        print(f"Number of assignments: {self.numAssignment}")
        print(f"Number of comparisons: {self.numComparison}")
        print(f"maxmium number of digits: {self.numDigits}")

def main():
    a = [239,234,879,878, 123, 358,416,317,137,225]
    rdx = Sorting(a)
    print("Before Sorting.")
    rdx.printList()
    rdx.radixsort()
    rdx.printList()
    rdx.setRansomList2sort(5, 10, 10)
    rdx.printList()
    rdx.radixsort()
    rdx.printList()
if __name__ == "__main__":
    main()
    
