import sys,linecache

totalUser=sys.argv[1]
increment=sys.argv[2]

namespace={}
result=[]
for i in 1,2:
        for j in 4,9,16:
                namespace['line%d' % i]= linecache.getline("output/loadTest_stats.csv",i)
                result.append((namespace['line%d' % i].split(',')[j]))
#print(*result, sep = ", ")
print("It's the result of %s users(increaseing %s users/second).According to the output/oadTest_stats.csv the server is able to handle %s requests per second. In the final figure below,the median response time(green line)-is %s ms, and 95%% response time(yellow line) is %s ms then."%(totalUser,increment,result[4],result[3],result[5])) 
