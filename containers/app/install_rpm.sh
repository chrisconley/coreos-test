if !(rpm -q $1 2>&1 > /dev/null); then
  rpm -Uvh --nodeps http://s3.amazonaws.com/dklr-deployment/rpms/$1.rpm
fi
