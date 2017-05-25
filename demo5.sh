#/bin/bash
 
dir="/home/njcx/test/"
todir="/home/njcx/test2/"
if [ ! -f file.list ];then
	ls $dir >file.list
elif [ ! -f file.list2 ];then
	mv file.list file.list2
	ls $dir >file.list
	diff file.list file.list2 >bak.list|grep '^<'|sed 's/</ /g'>bak.list
	for x in `cat bak.list`
		do
		if [ -n $x ];then
			cp -R ${dir}${x} $todir
		fi
		done
    rm file.list file.list2	
else
	mv file.list file.list2
	ls $dir >file.list
	diff -a file.list file.list2|grep '^<'|sed 's/</ /g'>bak.list

	for x in `cat bak.list`
		do
		if [ -n $x ];then
				cp -R ${dir}${x} $todir
		fi
		done
    rm file.list file.list2	
fi
#for x in `ls -al $dir`
#do
#    >>file.list
#done
