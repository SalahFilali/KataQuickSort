//
//  SortingArray.swift
//  KataQuickSort
//
//  Created by Salah Filali on 3/4/2023.
//

import Foundation

public class SortingArray {
    
    func quickSort(_ arrayToSort: inout [Int]){
        
        if arrayToSort.count == 2 {
            if !arrayIsSorted(arrayToSort) {
                arrayToSort = swapArrayElements(arrayToSort)
            }
        }
        
        if !arrayToSort.isEmpty && arrayToSort.count>2{
            
            let leftSeedIndex = leftSeedIndex(arrayToSort)
            let rightSeedIndex = rightSeedIndex(arrayToSort)
            if leftSeedIndex < rightSeedIndex {
                quickSortsubArrays(&arrayToSort, leftSeedIndex, rightSeedIndex)
            }
        }
    }

    func arrayIsSorted(_ array: [Int]) -> Bool {
        return array[0]<array[1]
    }


    func swapArrayElements(_ array: [Int]) -> [Int] {
        return array.sorted(by: <)
    }

    func leftSeedIndex(_ arrayToSort: [Int]) -> Int {
        return 0
    }

    func rightSeedIndex(_ arrayToSort: [Int]) -> Int {
        return arrayToSort.count-1
    }

    func quickSortsubArrays(_ array: inout [Int], _ leftSeedIndex: Int, _ rightSeedIndex: Int) {
        if leftSeedIndex < rightSeedIndex {
            let partitionIndex = quickSortPivotPermutation(arrayToSort: &array, leftSeedIndex: leftSeedIndex, rightSeedIndex: rightSeedIndex)
            quickSortsubArrays(&array, leftSeedIndex, partitionIndex-1)
            quickSortsubArrays(&array, partitionIndex+1, rightSeedIndex-1)
        }
    }

    func quickSortPivotPermutation(
        arrayToSort: inout [Int],
        leftSeedIndex: Int,
        rightSeedIndex: Int) -> Int {
            let pivot = arrayToSort[rightSeedIndex]
                var i = leftSeedIndex - 1
                for j in leftSeedIndex...rightSeedIndex - 1 {
                    if arrayToSort[j] < pivot {
                        i += 1
                        arrayToSort.swapAt(i, j)
                    }
                }
            arrayToSort.swapAt(i + 1, rightSeedIndex)
                return i + 1
            
        }
    
}

