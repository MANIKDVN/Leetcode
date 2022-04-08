class Solution:
    def nextGreatestLetter(self, letters: List[str], target: str) -> str:
        key=letters[0]
        diff=math.inf
        low=0
        high=len(letters)-1
        while low<=high:
            mid=low+(high-low)//2
            d=ord(letters[mid])-ord(target)
            if d<diff and d>0:
                diff=d
                key=letters[mid]
            elif ord(letters[mid])>ord(target):
                high=mid-1
            else:
                low=mid+1
        return key