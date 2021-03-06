BINARY=$1
${BINARY} get serviceaccount nfs-provisioner >/dev/null 2>&1 
if [ $? != 0 ]
then
  ${BINARY} apply -f - <<EOF
  apiVersion: v1
  kind: ServiceAccount
  metadata:
    name: nfs-provisioner
EOF
else
  echo "Service Account nfs-provisioner already created"
fi
unlink $0
