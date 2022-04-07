class Solution:
    def isPerfectSquare(self, num: int) -> bool:
        low=0
        high=num
        while low<=high:
            mid=low+(high-low)//2
            guess=mid*mid
            if guess==num:
                return True
            elif guess<num:
                low=mid+1
            else:
                high=mid-1
        return False