class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        if len(nums)==0:
            return -1,-1
        left=self.leftMostIndex(nums,target)
        right=self.rightMostIndex(nums,target)
        if left==-1:
            return -1,-1
        return left,right
    
    def rightMostIndex(self,nums,target):
        low=0
        high=len(nums)-1
        right=-1
        while low<=high:
            mid=(low+high)//2
            if nums[mid]>target:
                high=mid-1
            elif nums[mid]<target:
                low=mid+1
            else:
                right=mid
                low=mid+1
        return right
    
    def leftMostIndex(self,nums,target):
        low=0
        high=len(nums)-1
        left=-1
        while low<=high:
            mid=(low+high)//2
            if nums[mid]>target:
                high=mid-1
            elif nums[mid]<target:
                low=mid+1
            else:
                left=mid
                high=mid-1
        return left
                