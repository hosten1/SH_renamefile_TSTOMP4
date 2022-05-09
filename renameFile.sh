#!/bin/bash
# TODAY=`date +"%Y%m%d"`;
BACKUP_DIR=$(pwd);
subType=".mp4"

echo $BACKUP_DIR;
function _tstomp4(){
  for table in *.mp4; 
    do
      if [ "${table##*.}"x = "mp4"x ] && [ "$table" != "*.mp4" ];then

          echo $table
          str2="${table%'-【'*}$subType"
          # echo $str2
          mv "$table" "$str2"
          # ffmpeg -i "$table" -c copy -map 0:v -map 0:a -bsf:a aac_adtstoasc "$str2"
          echo "===> 移动后的 文件名是：$str2"

      fi
     
    done
}

_tstomp4

