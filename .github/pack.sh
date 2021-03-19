#!/bin/bash
mkdir outputs
mkdir -p tmpci/ci
cd themes
DIR=`ls .`
for dir in ${DIR};do
	if [ -d ${dir} ];then
	    mkdir ${dir}/tmp
	    cd ..
	    cp -rf icons/* themes/${dir}/tmp/
		cd themes/${dir}
		mv icons icons.zip
		unzip -o icons.zip -d tmp/ >/dev/null
		rm -rf icons.zip
		cd tmp
		zip -r icons.zip * >/dev/null
		cd ..
		mv tmp/icons.zip icons
		rm -rf tmp
		mv icons.zip icons
		zip -r ${dir}.zip * >/dev/null
		cd ../.. 
		cp -rf themes/${dir}/${dir}.zip outputs/${dir}.hwt
		cd themes
	fi
done
cd ..
