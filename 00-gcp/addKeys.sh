#!/bin/bash
zone="europe-central2-a"
hosts=("ansible1" "ansible2" "ansible3")

for host in "${hosts[@]}"; do
	echo "+++ adding for host: $host"
	gcloud compute scp gcp-github.key $host:~/.ssh/id_rsa
	gcloud compute scp gcp-github.key.pub $host:~/.ssh/id_rsa.pub
	gcloud compute ssh $host --command "chmod 600 ~/.ssh/id_rsa*"
done
