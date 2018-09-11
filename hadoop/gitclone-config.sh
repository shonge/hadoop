#!/bin/bash
if [ "${GIT_URL}" -a "${SUB_FOLDER}" ];then
    echo "Git ENVs are exists."
else
    echo "You need to define ENVs GIT_URL and SUB_FOLDER"
    exit 1
fi

git init /hdfs-config
cd /hdfs-config 
git remote add origin ${GIT_URL}
git config core.sparsecheckout true 
echo ${SUB_FOLDER} >> .git/info/sparse-checkout
git pull origin master
cd ${SUB_FOLDER}
mv tool /tool
mv -f config/* /usr/local/hadoop/etc/hadoop
mv supervisord /supervisord
rm -rf /hdfs-config
