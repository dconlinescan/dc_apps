#!bash
#同步APK的APK包！
config_file='./peiAPK.list'
cat ${config_file} |while read line 
do
	name=`echo $line |sed 's/ //'`
	echo $name
	source_file="D:/gitwork/dc_apps/tbapk/xy000$name.apk"

	cd "xy000"$line
	git checkout dev
	git pull origin dev
	echo "拉取$name盘dev"
	cp -r -f $source_file "D:/gitwork/dc_apps/xy000$name"
	echo "替换盘口APK包"
	git add -A
	git commit -m "APK包 "
	git push origin dev
	echo "xy000$name完成同步"
	cd ../
done

sleep 3
