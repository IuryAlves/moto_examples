#!/bin/bash

# Delete an ebs volume if it exists


usage(){
    echo "usage: $0 [--volume-name <volume-name>]"
    exit 1
}


find_volume_by_name(){
    name=$1
    aws ec2 describe-volumes \
        --filters "Name=tag:Name, Values=${name}" \
        --query "Volumes[0].VolumeId" \
        --output text \
        --endpoint-url=http://localhost:5000
}


delete_volume(){
    volume_id=$1
    aws ec2 delete-volume --volume-id $volume_id \
        --endpoint-url=http://localhost:5000
}


if [ "$#" -ne 1 ]; then
    usage
fi


volume_id=$(find_volume_by_name $1)

if [ "${volume_id}" != "null" ]; then
    echo Deleting volume $volume_id ...
    delete_volume $volume_id
fi
