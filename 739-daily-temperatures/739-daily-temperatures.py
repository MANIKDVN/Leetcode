class Solution:
    def dailyTemperatures(self, temperatures: List[int]) -> List[int]:
        answer=[0 for i in range(len(temperatures))]
        stack=[] #[temp,index]
        for i,t in enumerate(temperatures):
            while stack and t>stack[-1][0]:
                temp,index=stack.pop()
                answer[index]=(i-index)
            stack.append([t,i])
        return answer
            
            