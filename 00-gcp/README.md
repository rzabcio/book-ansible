Ansible on GCP
=============================

Set name of instance:
```
VM_NAME=ansible1
```

Create instance:
```
gcloud compute instances create $VM_NAME --project=wdk31d-piaskownica-326009 --zone=europe-central2-a --machine-type=e2-micro --network-interface=network-tier=PREMIUM,subnet=default --metadata=ssh-keys=jglazik:ssh-rsa\ AAAAB3NzaC1yc2EAAAADAQABAAABgQDMRl/rrX7KUTDnTXpOfXpdTsrXZxswL9Boc5pWT/HmFFyAo/7KD9RTljArF8VVKqezWpg5pIWqQLWnugXRH7OCmR9/p53L4xBa7r6ERz87dCPRiQEguZpy00aZynIKpQRLGIpGsqAVO9hiMw6hguykJSNIbpcAwD0lF2sfr664KGUnez5iEXj63vFbhchBMJR/T9yQrgVsT3hoWDlBjQ2qkbJBp8sgN9ltQMuFsySZZi\+rdtBgT6sUu0yqKfXcbDv6XwfJKSnrtSU4HqoCcy/M2LlAmgL\+1Y\+xFXtELJC8thrkHhawkKKsYgBCraSPlswb5noWywF7yZJEQEzQH0ubZ5iYmNg\+L7LFmsiqf0GualXkhICjtHQ5QdNrHdlrnFW1HiyTaXqwFM3GyhzeMt\+qJkCb8uOOk00E5jWgzAez8\+MIgLmTHp59wdE7XVGSpyqbdkEJ4JJgalB0/2um3akO0RIK5Ecczhx3Ivc8uBbsGnkQ7wfCjb3BIArVP2\+z2Hs=\ jglazik@GR4-0015221 --no-restart-on-failure --maintenance-policy=TERMINATE --preemptible --service-account=586423256827-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=http-server,https-server --create-disk=auto-delete=yes,boot=yes,device-name=ansible1,image=projects/centos-cloud/global/images/centos-7-v20211028,mode=rw,size=20,type=projects/wdk31d-piaskownica-326009/zones/europe-central2-a/diskTypes/pd-balanced --no-shielded-secure-boot --no-shielded-vtpm --no-shielded-integrity-monitoring --reservation-affinity=any
```

Create instance from container (does not have tools somehow):
```
$ gcloud compute instances create-with-container $VM_NAME --project=wdk31d-piaskownica-326009 --zone=europe-central2-a --machine-type=e2-micro --network-interface=network-tier=PREMIUM,subnet=default --no-restart-on-failure --maintenance-policy=TERMINATE --preemptible --service-account=586423256827-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=http-server,https-server --container-image=eu.gcr.io/wdk31d-piaskownica-326009/centos7-ansible-ready --container-restart-policy=always --container-privileged --create-disk=auto-delete=yes,boot=yes,device-name=ansible2,image=projects/cos-cloud/global/images/cos-stable-93-16623-39-6,mode=rw,size=10 --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --labels=container-vm=cos-stable-93-16623-39-6
```

Get instance IP:
```
gcloud compute instances describe $VM_NAME --format="get(networkInterfaces[0].accessConfigs[0].natIP)" --zone=europe-central2-a
```
or using script:
```
sh createHosts.sh
```
and sym-linking created Ansible `hosts` file.
