**1. create dynamic provisioning storage:**

- create serivce account and rbac: 
    - `$ kubectl apply -f sa.yaml`

- create storage class:
    - `$ kubectl apply -f sc.yaml`

- create provisioner pod :
    - `$ kubectl apply -f provisioner-pod.yaml`

- You can test by creating a pvc, it dynamically creates and assigns a PV to that pvc.  

**2. Upload a iso image to a pvc so that it can be used as a boot disk for vm:**

- ```$ virtctl image-upload --image-path=/opt/homes-shared/ISO/Win10_1909_Italian_x64.iso --pvc-name=win10-vm --access-mode=ReadWriteMany --pvc-size=7G --storage-class d-nfs-sc  --uploadproxy-url=https://<cdi_upload_proxy_url>:443 --insecure --wait-secs=240```


**3.** `$ docker pull kubevirt/virtio-container-disk`


**4. create a windows vm: a pvc for hardisk and virtualmachine container**
- `kubectl apply -f win10-vm.yaml` *[need datavolume as iso bootable disk not pvc]*


**5.** `$ virtctl start win10`

**6.** `$ virtctl vnc win10`



*Reference:* 
- https://kubevirt.io/2020/KubeVirt-installing_Microsoft_Windows_from_an_iso.html
- https://cdmana.com/2020/12/202012040127197118.html

