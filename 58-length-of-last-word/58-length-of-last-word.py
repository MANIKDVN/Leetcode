class Solution(object):
    def lengthOfLastWord(self, s):
        """
        :type s: str
        :rtype: int
        """
        s=s.strip()
        for i in reversed(range(len(s))):
            if s[i]==" ":
                return len(s[i+1:])
        return len(s)