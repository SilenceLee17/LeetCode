/*
 https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).
 
 Find the minimum element.
 
 You may assume no duplicate exists in the array.
 
 Example 1:
 
 Input: [3,4,5,1,2]
 Output: 1
 
 Example 2:
 
 Input: [4,5,6,7,0,1,2]
 Output: 0
 */

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        return binarySearchRecursive(nums, nums.count-1, 0, nums[0]);
//        return binarySearch(nums, nums.count-1, 0);
    }
//    将binarySearch递归改为尾调用
    func binarySearchRecursive(_ nums: [Int], _ max:Int, _ min:Int, _ minValue:Int) -> Int {
        let minIndex = min
        let maxIndex = max
        var minValue = minValue
        
        let minIndexValue = nums[minIndex]
        let maxIndexValue = nums[maxIndex]
        if minIndex >= maxIndex {
            if minValue > minIndexValue {
                minValue = minIndexValue
            }
            return minValue
        }
        
        let midIndex = (minIndex + maxIndex)/2
        var recursiveMaxIndex = midIndex
        var recursiveMinIndex = minIndex
        
        if minIndexValue <= maxIndexValue {
            if minValue > minIndexValue {
                minValue = minIndexValue
            }
        }else {
            let midIndexValue = nums[midIndex]
            if minIndexValue <= midIndexValue {
                if minValue > minIndexValue {
                    minValue = minIndexValue
                }
                recursiveMaxIndex = maxIndex
                recursiveMinIndex = midIndex+1
            }
        }
        return binarySearchRecursive(nums, recursiveMaxIndex, recursiveMinIndex, minValue)
    }
    
    func binarySearch(_ nums: [Int], _ max:Int, _ min:Int) -> Int {
        let minIndex = min
        let maxIndex = max
        var minValue = nums[min]
        
        let minIndexValue = nums[minIndex]
        let maxIndexValue = nums[maxIndex]
        if minIndex >= maxIndex {
            return minValue
        }
        if minIndexValue <= maxIndexValue {
            if minValue > minIndexValue {
                minValue = minIndexValue
            }
        }else {
            let midIndex = (minIndex + maxIndex)/2
            let leftValue = binarySearch(nums, midIndex, minIndex)
            if minValue > leftValue {
                minValue = leftValue
            }
            let rightValue = binarySearch(nums, maxIndex, midIndex+1)
            if minValue > rightValue {
                minValue = rightValue
            }
        }
        return minValue
    }
}

Solution.init().findMin([3,4,5,1,2])
Solution.init().findMin([4,5,6,7,0,1,2])
Solution.init().findMin([2,1])


