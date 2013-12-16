haproxy -db -f /tmp/haproxy.cfg &

etcdctl exec-watch /apps /tmp/restart-haproxy.py
