/*
 https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
 
 Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
 
 The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.
 
 Note:
 
 Your returned answers (both index1 and index2) are not zero-based.
 You may assume that each input would have exactly one solution and you may not use the same element twice.
 Example:
 
 Input: numbers = [2,7,11,15], target = 9
 Output: [1,2]
 Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.
 */


class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var flag = true
        var leftIndex = 0
        var rightIndex = numbers.count - 1
        var result = [Int]()
        while rightIndex >= leftIndex && flag {
            let left = numbers[leftIndex]
            let right = numbers[rightIndex]
            if left + right == target {
                result.append(leftIndex+1)
                result.append(rightIndex+1)
                flag = false
            }else if left + right > target
            {
                rightIndex = rightIndex - 1
            }else if left + right < target
            {
                leftIndex = leftIndex + 1
            }
        }
        
        return result
    }
    
}

Solution.init().twoSum([2,7,11,15], 9)

