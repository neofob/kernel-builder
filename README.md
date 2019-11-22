Using vagrant box(es) to build kernel
====================================
#WIP

```
# Use ansible/contrib/inventory/vagrant.py
ansible stretch -i ./vagrant.py -m ping
```

Check out the upstream [Linux Kernel][0] source code to here. It will appear as
`/vagrant/linux` inside the vagrant machine.

Example workflow:
```
$ vagrant up bionic
$ vagrant ssh -c "KERNEL_SRC=/vagrant/linux BUILD_OUTPUT=/vagrant/build /vagrant/build_kernel.sh"
```
The built `.deb` packages are at CWD.


[0]: git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
