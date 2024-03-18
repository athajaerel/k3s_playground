# k3s_playground

## Usage

You need some VMs prepared with passwordless SSH login for user ansible set up. See inventories in site/.

To run:

$ ansible-playbook k3s.yml -i site/whatever --tags=choose_a_tag --ask-vault-password

(Vault password is now required, password is 'password' for this demo system.)

Tags must be specified as all plays have the 'never' tag.

Current tags:

- install
- bootstrap
- apps_install
- smoke_test
- allwall
- snapshot
- revert_snapshot
- rolling_restart
- rolling_service_restart
- destroy_cluster

To set up a cluster, run install, bootstrap and apps_install in that order.

To test the cluster, run smoke_test.

To delete the cluster, run destroy_cluster.

To do a rolling restart of the cluster, run rolling_restart. To just rolling restart the k3s service, run rolling_service_restart.

To take a snapshot, run snapshot. To revert to the current snapshot, run revert_snapshot.

The allwall tag is to send a message to all consoles in the cluster, viz:

    ansible-playbook -i site/work k3s.yml --tags allwall -e'msg="This is my test message. Restart of subradiante in 10 microfleems."'

Of course the message must be encapsulated in quotes, or you will only send the first word.

## Design Notes

Clone rhel86-playground eight times:
  - k3s-mother-01
  - k3s-mother-02
  - k3s-mother-03
  - k3s-child-01
  - k3s-child-02
  - k3s-child-03
  - k3s-child-04
  - k3s-child-05

Change UUIDs:
  - ifcfg-enp10s0 [actually, don't think we need to configure a UUID for these?]
  - /etc/machine-id
  - /var/lib/random-seed
  - disks

Add ansible.

Stop password expiring.

Ensure legacy iptables is installed as k3s doesn't support nftables. (? looks like it's out of date per https://github.com/k3s-io/k3s/issues/1812)
Download and install iptables-1.6.2-2 from Fedora 28.

Setenforce 0. Don't need SEL for this but will on actual deployment. Probably.

# Tutorials

~~https://homeautomation.wiki/kubernetes-homelab-with-k3s-and-raspberry-pi-4/~~
Server died.

https://docs.tigera.io/calico/latest/getting-started/kubernetes/k3s/quickstart

~~https://homeautomation.wiki/kubernetes-l4-loadbalancing-with-metallb/~~
Server died.

https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/#backing-up-an-etcd-cluster

https://itnext.io/the-ultimate-guide-to-building-your-personal-k3s-cluster-bf2643f31dd3?gi=87ab94d08382

https://github.com/kelseyhightower/kubernetes-the-hard-way

https://www.vmguru.com/2021/04/how-to-install-rancher-on-k3s/

