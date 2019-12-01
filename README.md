Using vagrant box(es) to build kernel
====================================
#WIP

```
# Use ansible/contrib/inventory/vagrant.py
ansible stretch -i ./vagrant.py -m ping
```

Check out the upstream [`Linux Kernel`][0] source code to here. It will appear as
`/vagrant/linux` inside the vagrant machine.

~Example workflow:~
```
$ vagrant up bionic
$ vagrant ssh -c "KERNEL_SRC=/vagrant/linux BUILD_OUTPUT=/vagrant/build /vagrant/build_kernel.sh"
```

*Update:* Using virtualbox shared filesystem does not work. It does not support `mmap` calls, which
are used by the tool-chains in compiling the kernel.

Alternative approaches:
* Use a custom vagrant box that has big enough partition (the default image is
20GB) to store the checkout git source code and output build. A 32GB filesystem
should be sufficient for now.
* The host machine provides 32GB of RAM to the vagrant box. Then we can mount
a `tmpfs` with the size about 27GB to store the checked out source and output
objects.


The built `.deb` packages are at CWD.


[0]: git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
