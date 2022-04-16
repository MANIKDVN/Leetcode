class Solution:
    def findKthPositive(self, arr: List[int], k: int) -> int:
        if k<=arr[0]-1:
            return k
        k-=arr[0]-1
        for i in range(len(arr)-1):
            currMissing = arr[i+1]-arr[i]-1
            if k<=currMissing:
                return arr[i] + k
            k-=currMissing
        return arr[-1]+k
        
        