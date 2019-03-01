/*
 https://leetcode.com/problems/two-sum/
Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:

Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
 */


class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [Int]()
        var match = [Int: Int]()
        for i in 0...nums.count-1 {
            let num = nums[i]
            let left = target - num
            if match.keys.contains(left) {
                result.append(match[left]!)
                result.append(i)
                break
            }
            match.updateValue(i, forKey: num)
        }
        return result
    }
}

Solution.init().twoSum([2, 7, 11, 15], 9)

