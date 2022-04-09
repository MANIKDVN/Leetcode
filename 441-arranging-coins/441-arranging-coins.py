class Solution:
    def arrangeCoins(self, n: int) -> int:
        low=0
        high=n
        while low<=high:
            k=(low+high)//2
            curr=k*(k+1)//2
            if curr<n:
                low=k+1
            elif curr>n:
                high=k-1
            else:
                return k
        return high