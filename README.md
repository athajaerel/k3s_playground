# k3s_playground

## Usage

You need some VMs prepared with passwordless SSH login for user ansible set up. See inventories in site/.

To run:

$ ansible-playbook k3s.yml -i site/whatever --tags=choose_a_tag 

Tags must be specified as all plays have the 'never' tag.

Current tags:

- install
- bootstrap
- bootstrap_masters
- bootstrap_agents
- interface
- rolling_restart
- delete_cluster

To set up a cluster, run install and bootstrap. To delete the cluster, run delete_cluster.

## Design Notes

Clone rhel86-playground twelve times:
  - k3s-mother-001
  - k3s-mother-002
  - k3s-mother-003
  - k3s-child-001
  - k3s-child-002
  - k3s-child-003
  - k3s-child-004
  - k3s-child-005
  - k3s-child-006
  - k3s-child-007
  - k3s-child-008
  - k3s-child-009

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

