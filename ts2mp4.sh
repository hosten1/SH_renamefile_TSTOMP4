#!/bin/bash
# TODAY=`date +"%Y%m%d"`;
BACKUP_DIR=$(pwd);
subType=".mp4"

echo $BACKUP_DIR;
function _tstomp4(){
  echo 'input parameter1: '$1
  for table in *.ts; 
    do
      if [ "${table##*.}"x = "ts"x ] && [ "$table" != "*.ts" ];then

          echo $table
          str2="${table%'【'*}$subType"
          # echo $str2

          ffmpeg -i "$table" -c copy -map 0:v -map 0:a -bsf:a aac_adtstoasc "$str2"
          echo "===> 完成 文件名是：$str2"

      fi
     
    done
}

for filename in *; 
do
    if [ -d "$filename" ]; then
      subPATH="$BACKUP_DIR/$filename/"
      cd "$subPATH"
      echo "is a directory $(pwd)"
      _tstomp4  "$subPATH"
      cd "../"
    elif [ -f "$filename" ]; then

    echo "$filename is a file"
    _tstomp4  "$BACKUP_DIR"
    # # echo $filename
    # str2="${filename%'【'*}$subType"
    # # echo $str2

    # ffmpeg -i "$filename" -c copy -map 0:v -map 0:a -bsf:a aac_adtstoasc "$str2"
    # echo "===> 完成 文件名是：$str2"


    fi
	
done

