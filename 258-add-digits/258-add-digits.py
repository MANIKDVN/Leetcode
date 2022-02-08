class Solution:
    def addDigits(self, num: int) -> int:
        if num<10:
            return num
        l=list(str(num))
        sum=0
        for i in l:
            sum+=int(i)
        return self.addDigits(sum)
            