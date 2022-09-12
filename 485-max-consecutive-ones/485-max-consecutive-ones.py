class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        count=0
        result=0
        for num in nums:
            if num==1:
                count+=1
                result=max(count,result)
            else:
                count=0
        return result