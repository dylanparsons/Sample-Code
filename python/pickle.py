import pickle
import math
import random

def arrow(n):
    return str(n)+"--> "

def isPositive(aNumber):
    return aNumber > 0

def abs(aNumber):
    if aNumber >= 0:
        return aNumber
    return -aNumber

def main2():
    """ test two build in high order functions: map and filter functions"""
    oldList = [-10, -20, 0, 30,40]
    print("oldList: ", oldList)
    newList = [] # a string version of oldList
    for number in oldList:
        newList.append(str(number))
    print("newList: ", newList)
    newList2 = list( map(str, oldList) )
    print("newList2: ", newList2)
    newList3 = list( map(arrow, oldList) )
    print("newList3: ", newList3)

    newList4 = list( filter(isPositive, oldList) )
    print("newList4: ", newList4)

    newList5 = list( map(abs, oldList) )
    print("newList5: ", newList5)

    newList6 = list( filter(abs, oldList) )

    print("newList6: ", newList6)
    print()

def main3():
    """ test pickling"""
    lyst = ["COMP", 164, "-03", "pi=", 3.14]
    fileObj = open("items.dat", "wb")
    for item in lyst:
        pickle.dump(item, fileObj)
    fileObj.close()

    lyst2 = list()
    fileObj = open("items.dat", "rb")
    while True:
        try:
            item = pickle.load(fileObj)
            lyst2.append(item)
        except EOFError:
            break
            fileObj.close()

    print(lyst2)

    fileObj = open("items2.dat", "wb")
    pickle.dump(lyst, fileObj)
    fileObj.close()

    print()

    
def main4():
    """ test pickling"""
    lyst = ["COMP", 164, "-03", "pi=", 3.14]
    fileObj = open("items.dat", "wb")
    pickle.dump(lyst, fileObj)
    fileObj.close()
    
    fileObj = open("items.dat", "rb")
    lyst2 = pickle.load(fileObj)
    fileObj.close()
    
    print(lyst2)
    print()

def main5():
    """ test two build in high order functions: map and filter functions"""
    oldList = []
    for i in range(10):
        oldList.append(random.randint(-500, 500))
    print("oldList: ", oldList)
    newList = [] 
    newList = list( map(polynomial, oldList) )
    print("NewList: ", newList)
    newNewList = list(filter(isBetween100, oldList))
    print("Number of Numbers between -100 and 100: ", len(newNewList))
    newJar = open("name.dat", "wb")
    pickle.dump(newList, newJar)
    newJar.close()
    NewestList=[]
    oldJar=open("name.dat", "rb")
    NewestList = pickle.load(oldJar)
    oldJar.close()
    print("Here is the unpickled list: ")
    print(NewestList)
    print()
    
    print("newList: ", newList)
    newList2 = list( map(str, oldList) )
    print("newList2: ", newList2)
    newList3 = list( map(arrow, oldList) )
    print("newList3: ", newList3)

    newList4 = list( filter(isPositive, oldList) )
    print("newList4: ", newList4)

    newList5 = list( map(abs, oldList) )
    print("newList5: ", newList5)

    newList6 = list( filter(abs, oldList) )

    print("newList6: ", newList6)
    print()

def polynomial(x):
    return ((3*x*x)-2*x-1) 
                
def isBetween100(x):
    if x>=-100 and x<=100:
        return True
    return False

   
if __name__ == "__main__":
    main2()
    main3()
    main4()
    main5()
