#User function Template for python3

class Solution:
    ##Complete this code
    def countOnes(self,arr, N):
        #Your code here
        return self.counts(arr,0,len(arr)-1)
    def counts(self,arr,low,high):
        if low<=high:
            mid=(low+high)//2
            if ((mid==high) or arr[mid+1]==0) and (arr[mid]==1):
                return mid+1
            if arr[mid]==1:
                return self.counts(arr,(mid+1),high)
            return self.counts(arr,low,(mid-1))
        return 0
#{ 
#  Driver Code Starts
#Initial Template for Python 3

import math


def main():
        T=int(input())
        while(T>0):
            
            N=int(input())

            A=[int(x) for x in input().strip().split()]
            
            
            ob=Solution()
            print(ob.countOnes(A,N))
            
            T-=1


if __name__ == "__main__":
    main()
# } Driver Code Ends