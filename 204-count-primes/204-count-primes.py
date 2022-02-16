import math
class Solution(object):
    def countPrimes(self, n):
        """
        :type n: int
        :rtype: int
        """
        num=int(sqrt(n))
        if n==0 or n==1 or n==2:
            return 0
        mask=[False,False]+[True]*(n-2)
        p=2
        c=0
        for p in range(2,num+1):
            if mask[p]:
                for j in range(p*p,n,p):
                    mask[j]=False
        return sum(mask)
                