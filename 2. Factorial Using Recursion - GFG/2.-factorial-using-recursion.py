#User function Template for python3

class Solution:
    def factorial(self,n):
        #code here
        if n==0:
            return 1
        return n*self.factorial(n-1)

#{ 
#  Driver Code Starts
#Initial Template for Python 3

#contributed by RavinderSinghPB
if __name__ =='__main__':
    tcs=int(input())
    
    for _ in range(tcs):
        n=int(input())
        ob=Solution()
        print(ob.factorial(n))
# } Driver Code Ends