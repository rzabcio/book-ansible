#!/bin/bash

HOSTS_FILE="/mnt/c/work-test-chambers/book-ansible/00-gcp/hosts"
ZONE=europe-central2-a

ANSIBLE1_IP=`gcloud compute instances describe ansible1 --format="get(networkInterfaces[0].accessConfigs[0].natIP)" --zone=$ZONE`
ANSIBLE2_IP=`gcloud compute instances describe ansible2 --format="get(networkInterfaces[0].accessConfigs[0].natIP)" --zone=$ZONE`
ANSIBLE3_IP=`gcloud compute instances describe ansible3 --format="get(networkInterfaces[0].accessConfigs[0].natIP)" --zone=$ZONE`

# echo "IPs: $ANSIBLE1_IP, $ANSIBLE2_IP, $ANSIBLE3_IP"
if [ -n $ANSIBLE1_IP ]; then
	sed -i "s/ansible1 ansible_host=.*/ansible1 ansible_host=$ANSIBLE1_IP/" $HOSTS_FILE
fi
if [ -n $ANSIBLE2_IP ]; then
	sed -i "s/ansible2 ansible_host=.*/ansible2 ansible_host=$ANSIBLE2_IP/" $HOSTS_FILE
fi
if [ -n $ANSIBLE3_IP ]; then
	sed -i "s/ansible3 ansible_host=.*/ansible3 ansible_host=$ANSIBLE3_IP/" $HOSTS_FILE
fi

# cat $HOSTS_FILE
