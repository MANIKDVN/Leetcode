class Solution:
    def reverse(self, x: int) -> int:
        if x==0:
            return x
        if x<0:
            dummy=abs(x)
            rev=''
            while dummy!=0:
                rem=dummy%10
                rev=rev+str(rem)
                dummy=int(dummy/10)
            n=-int(rev)
            if n not in range(-2**31, 2**31 - 1):
                return 0
            else:
                return n
        
        else:
            dummy=x
            rev=''
            while dummy!=0:
                rem=dummy%10
                rev=rev+str(rem)
                dummy=int(dummy/10)
            n=int(rev)
            if n not in range(-2**31, 2**31 - 1):
                return 0
            else:
                return n


        