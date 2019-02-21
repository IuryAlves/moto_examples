## Installing

```
pip install -r requirements.txt
```

## Running

```
moto_server
```

Examples:

#### Describing ebs volumes

```
aws ec2 describe-volumes --endpoint-url=http://localhost:5000
```

#### Creating a volume

```
aws ec2 create-volume \
    --region eu-west-1 \
    --availability-zone eu-west-1a \
    --size 40  \
    --volume-type gp2 \
    --tag-specifications "ResourceType=volume, Tags=[{Key=Name, Value=jenkins}]" \
    --endpoint-url=http://localhost:5000
```


#### Finding and deleting a volume using aws cli

```
examples/delete_ebs_volume.sh <volume-name>
```


#### Finding and deleting a volume using ansible

```
BOTO_CONFIG=$(pwd)/boto_config ansible-playbook examples/delete_ebs_volume.yml
```


