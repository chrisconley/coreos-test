./setup.sh

#http://coreos.com/docs/ec2/
ami=ami-876844ee
ec2-run-instances $ami \
    --key chrisconley-io \
    --instance-type t1.micro \
    -b /dev/sda=:8:true # true deletes volume on termination

ec2-describe-instances

core_ip=ec2-54-205-203-68.compute-1.amazonaws.com
ssh core@$core_ip -f mkdir -p /tmp/projects/coreos-test/
rsync -avt -e "ssh -i /Users/chrisconley/.ssh/chrisconley-io.pem" --delete --exclude=".git" . core@$core_ip:/tmp/projects/coreos-test/

ssh core@$core_ip
# now in ec2 instance
cd /tmp/projects/coreos-test/containers/app/
docker build -t chrisconley/coreos-test-app .
docker push chrisconley/coreos-test-app
# or
docker pull chrisconley/coreos-test-app
docker run -p 80:8080 chrisconley/coreos-test-app

# from another terminal in ec2 isntance
curl http://127.0.0.1:80/hello/chris
