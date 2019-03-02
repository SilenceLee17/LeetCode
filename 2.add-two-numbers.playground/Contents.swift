/*
 https://leetcode.com/problems/add-two-numbers/
 
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example:
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 
 */



//  Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var carry = 0
        var result :ListNode? = nil
        var current :ListNode? = nil
        var list1 = l1
        var list2 = l2
        while (list1 != nil || list2 != nil) || carry != 0 {
            var val = (list1?.val ?? 0) + (list2?.val ?? 0) + carry
            if val >= 10 {
                val = val % 10
                carry = 1
            }else{
                carry = 0
            }
            if result == nil {
                result = ListNode.init(val)
                current = result
            }else{
                let node = ListNode.init(val)
                current?.next = node
                current = node
            }
            list1 = list1?.next
            list2 = list2?.next
        }
        
        return result
    }
    
    func addTwoNumbers1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let result = ListNode.init(0)
        var current :ListNode? = result
        var list1 = l1
        var list2 = l2
        var sum = 0
        while (list1 != nil || list2 != nil){
            sum = sum / 10
            sum = (list1?.val ?? 0) + (list2?.val ?? 0) + sum
            current?.next = ListNode.init(sum % 10)
            current = current?.next
            list1 = list1?.next
            list2 = list2?.next
        }
        if (sum / 10 == 1)
        {
            current?.next = ListNode.init(1);
        }
        return result.next
    }
}

var node1 = ListNode.init(2)
var node2 = ListNode.init(4)
var node3 = ListNode.init(3)
node1.next = node2
node2.next = node3

var node11 = ListNode.init(5)
var node22 = ListNode.init(6)
var node33 = ListNode.init(4)
node11.next = node22
node22.next = node33

Solution.init().addTwoNumbers(node1, node11)


