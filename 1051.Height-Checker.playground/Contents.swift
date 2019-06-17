/*
 https://leetcode.com/problems/height-checker/description/
 Students are asked to stand in non-decreasing order of heights for an annual photo.
 
 Return the minimum number of students not standing in the right positions.  (This is the number of students that must move in order for all students to be standing in non-decreasing order of height.)
 
 
 
 Example 1:
 
 Input: [1,1,4,2,1,3]
 Output: 3
 Explanation:
 Students with heights 4, 3 and the last 1 are not standing in the right positions.
 */

class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        var count = 0
        var datas = heights
        quickSort(list: &datas, low: 0, high: heights.count-1)
        for i in 0..<heights.count {
            if heights[i] != datas[i] {
                count = count+1
            }
        }
        return count
    }
    private func quickSort(list: inout Array<Int>, low: Int, high: Int) {
        if low < high {
            let mid = partition(list: &list, low: low, high: high)
            quickSort(list: &list, low: low, high: mid - 1)   //递归前半部分
            quickSort(list: &list, low: mid + 1, high: high)  //递归后半部分
        }
    }
    
    private func partition(list: inout Array<Int>, low: Int, high: Int) -> Int {
        var low = low
        var high = high
        let temp = list[low]
        while low < high {
            
            while low < high && list[high] >= temp {
                high -= 1
            }
            list[low] = list[high]
            
            while low < high && list[low] <= temp {
                low += 1
            }
            list[high] = list[low]
        }
        list[low] = temp
        return low
    }
}

Solution.init().heightChecker([1,1,4,2,1,3])

