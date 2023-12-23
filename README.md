Clone rhel86-playground three times:
  - k3s-mother-001
  - k3s-child-001
  - k3s-child-002

Change UUIDs:
  - ifcfg-enp10s0 [actually, don't think we need to configure a UUID for these?]
  - /etc/machine-id
  - /var/lib/random-seed
  - disks

Add ansible.
Install keepalived.
Template config for keepalived.

Stop password expiring.

Ensure legacy iptables is installed as k3s doesn't support nftables. (?)
Download and install iptables-1.6.2-2 from Fedora 28.

Ensure cgroups are enabled. (? Pretty sure modern Linux has this already.)

Create server token
- should this be unique to the server or to the cluster?

Bootstrap server node with a CURL bash. Hmm, ... nope? Download and inspect first, then run it.

Hmm, will need modifying for the runit process manager. Or use Void with OpenRC.

Setenforce 0. Don't need SEL for this but will on actual deployment. Probably.

Had to download binary manually then run script with download disabled. Still not right.

