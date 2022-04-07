class Solution:
    def findTheDistanceValue(self, arr1: List[int], arr2: List[int], d: int) -> int:
        c=0
        arr2=sorted(arr2)
        if d==0:
            return 0
        for i in arr1:
            flag=True
            low=0
            high=len(arr2)-1
            while low<=high:
                mid=low+(high-low)//2
                if arr2[mid]==i or abs(i-arr2[mid])<=d:
                    flag=False
                    break
                elif arr2[mid]<i:
                    low=mid+1
                else:
                    high=mid-1
            c+=flag
        return c