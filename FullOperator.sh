# !/bin/bash

# 判断是否带参数
if [ ! $1 ] ; then
	echo "please add args"
	exit
fi

# 读取不以#开头的行信息
argsList=`sed -n '/^#/!p' $1`

# 循环请求带argsList内的参数
for args in $argsList
do
	url="http://10.20.136.150:8081/web/show.asp?id=$args"
	echo "curl $url"
	echo "curl $url" >> curl.log
	curl $url >> curl.log
done
