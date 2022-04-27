class Solution:
    def twoSum(self, numbers: List[int], target: int) -> List[int]:
        n=len(numbers)
        left=0
        right=n-1
        while left<right:
            mid=numbers[left]+numbers[right]
            if mid==target:
                return [left+1,right+1]
            elif target<mid:
                right-=1
            else:
                left+=1
        return [-1,-1]