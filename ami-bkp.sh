#!/bin/bash  
#set -x
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
date1=$(date +"%Y-%m-%d_%H-%M-%S")


#if  [ -d "/var/log/ami/" ]; then
#mkdir -p /var/log/ami/
#fi





create_ami ()
{

#collecting All AMI id with tag:dr-tag,Values=DR_On
instanceids=( $(aws ec2 describe-instances --filters "Name=tag-value,Values=DR_On" --output text --query 'Reservations[].Instances[].InstanceId' --region $1))

for j in "${instanceids[@]}";do
echo $j
instance_name=$(aws ec2 describe-tags  --filters "Name=resource-id,Values=$j" "Name=key,Values=Name" --region $1 | cut -f5)

img_id=`aws ec2 create-image --instance-id $j --name "$instance_name"_"$date1" --no-reboot --output text --region $1`

aws ec2 create-tags --resources $img_id --tags Key=Name,Value="$instance_name"_bkp_ami Key=dtag,Value=DeleteOn --region $1
done

}

##AMI Creation in N.virginia
#create_ami us-east-1







del_ami ()
{
#retention period of ami
retention=0
#collecting All AMI id with tag:dtag,Values=DeleteOn
imgids=( $(aws ec2 describe-images --filters "Name=tag-value,Values=DeleteOn" --query 'Images[*].{ID:ImageId}' --output text --region $1))

for k in "${imgids[@]}";do
#date of creation of ami
toc1=$(aws ec2 describe-images --image-ids $k --query 'Images[*].[ImageId,CreationDate]' --output text --region us-east-1| awk '{ print $2 }' )
toc2=`echo $toc1 | head -c 10`

#date of creation of ami in unix epoch seconds
itime=$(date --date $toc2 +%s )

#current date in unix epoch seconds
ctime=$(date +%s);
sleep 1; 
#Finding how old is ami
ami_age=$(echo $((ctime-itime)) | awk '{print (int($1/3600))/24}'| awk 'BEGIN{FS=OFS="."} NF--')


if  (( ${ami_age%%.*} >= $retention)) ; then
#echo $k

#get snap shot id of corresponding ami
snp_shot_id=$(aws ec2 describe-images --image-ids $k --output text --query 'Images[*].BlockDeviceMappings[*].Ebs.SnapshotId' --region $1)
echo $snp_shot_id
#removing ami
aws ec2 deregister-image --image-id $k --region $1
#removing snap-shot
echo $k
aws ec2 delete-snapshot --snapshot-id $snp_shot_id --region $1

fi
done
}


##AMI Deletion in N.virginia
#del_ami us-east-1
