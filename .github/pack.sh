#!/bin/bash
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
		zip -r icons.zip tmp/* >/dev/null
		rm -rf tmp
		mv icons.zip icons
		cd ..
		zip -r ${dir}.zip ${dir}/* >/dev/null
		cd .. 
		mkdir outputs
		cp -rf themes/${dir}.zip outputs/${dir}.zip
		cd themes
	fi
done
cd ..
cd outputs
rename 's/\.zip/.hwt/'    *.zip