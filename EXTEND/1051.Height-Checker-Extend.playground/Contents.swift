/*
 https://leetcode.com/problems/height-checker/description/
 Students are asked to stand in non-decreasing order of heights for an annual photo.
 
 Return the minimum number of students not standing in the right positions.  (This is the number of students that must move in order for all students to be standing in non-decreasing order of height.)
 
 
 
 Example 1:
 
 Input: [1,1,4,2,1,3]
 Output: 3
 Explanation:
 Students with heights 4, 3 and the last 1 are not standing in the right positions.
 ---------------------------------------------------
 扩展，如果要求中间高，两端低
 
 Example 1:
 
 Input: [1,1,4,2,1,3]
 Output: 3
 Explanation:
 [1,1,4,3,2,1]
 */

class Solution {
    func heightCheckerExtend(_ heights: [Int]) -> Int {
        let minIndex = 0
        let maxIndex = heights.count - 1
        let midIndex = (maxIndex+minIndex)/2
        let leftCount = selectionSortAsc(heights, minIndex, midIndex)
        let rightCount = selectionSortDesc(heights, midIndex+1, maxIndex)
        let result = leftCount + rightCount
        return result
    }
    func selectionSortAsc(_ datas: [Int],_ startIndex:Int,_ endIndex:Int) -> Int {
        if datas.isEmpty == true || startIndex+1 >= endIndex || datas.count < endIndex {
            return 0
        }
        var nums = datas
        var exchangeCount = 0
        for i in (startIndex...endIndex).reversed() {
            var exchangeIndex = i
            var curExchangeIndex = i
            for j in (startIndex...max(startIndex, (i-1))).reversed() {
                if nums[exchangeIndex] < nums[j] {
                    curExchangeIndex = j
                }
            }
            exchangeIndex = curExchangeIndex
            if i != exchangeIndex {
                (nums[exchangeIndex], nums[i]) = (nums[i], nums[exchangeIndex])
                exchangeCount += 1
            }
        }
        if exchangeCount > 0 {
            exchangeCount += 1
        }
        return exchangeCount
    }
    func selectionSortDesc(_ datas: [Int],_ startIndex:Int,_ endIndex:Int) -> Int {
        if datas.isEmpty == true || startIndex+1 >= endIndex || datas.count < endIndex {
            return 0
        }
        var nums = datas
        var exchangeCount = 0
        for i in startIndex...endIndex {
            var exchangeIndex = i
            var curExchangeIndex = i
            for j in min((i + 1), endIndex)...endIndex {
                if nums[exchangeIndex] < nums[j] {
                    curExchangeIndex = j
                }
            }
            exchangeIndex = curExchangeIndex
            if i != exchangeIndex {
                (nums[exchangeIndex], nums[i]) = (nums[i], nums[exchangeIndex])
                exchangeCount += 1
            }
        }
        if exchangeCount > 0 {
            exchangeCount += 1
        }
        return exchangeCount
    }
}

Solution.init().heightCheckerExtend([1,2,2,2,2,2,1,2,2,1])

