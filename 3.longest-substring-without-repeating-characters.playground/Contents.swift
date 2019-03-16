/*
 https://leetcode.com/problems/longest-substring-without-repeating-characters/
 3. Longest Substring Without Repeating Characters

 Given a string, find the length of the longest substring without repeating characters.
 
 Example 1:
 
 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:
 
 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:
 
 Input: "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */


class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var start = 0
        var max = 0
        var dic = [Character: Int]()// value index
        for (charIndex, value) in s.enumerated() {
            let oldIndex = dic[value] ?? 0
            if oldIndex < start || !dic.keys.contains(value)
            {
                if charIndex - start + 1 > max {
                    max = charIndex - start + 1
                }
            }
            else{
                start = oldIndex + 1
            }
            dic[value] = charIndex
        }
        return max
    }
}

Solution.init().lengthOfLongestSubstring("abcabcbb")
Solution.init().lengthOfLongestSubstring("bbbbb")
Solution.init().lengthOfLongestSubstring("pwwkew")
Solution.init().lengthOfLongestSubstring("tmmzuxt")
Solution.init().lengthOfLongestSubstring("aabaab!bb")
Solution.init().lengthOfLongestSubstring("dvdf")








