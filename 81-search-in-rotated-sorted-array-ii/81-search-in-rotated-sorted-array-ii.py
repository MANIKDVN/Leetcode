class Solution:
    def search(self, nums: List[int], target: int) -> bool:
        low=0
        high=len(nums)-1
        
        while low<high and nums[low]==nums[high]:
            high-=1
        
        while low<=high:
            mid=(low+high)//2
            if nums[mid]==target:
                return True
            elif nums[mid]>=nums[low]:
                if target>=nums[low] and target<nums[mid]:
                    high=mid-1
                else:
                    low=mid+1
            else:
                if target>nums[mid] and target<=nums[high]:
                    low=mid+1
                else:
                    high=mid-1
        return False