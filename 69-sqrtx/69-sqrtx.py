class Solution:
    def mySqrt(self, x: int) -> int:
        if x<2:
            return x
        low=2
        high=x//2
        while low<=high:
            mid=low+(high-low)//2
            guess=mid*mid
            if guess==x:
                return mid
            elif guess<x:
                low=mid+1
            else:
                high=mid-1
        return high