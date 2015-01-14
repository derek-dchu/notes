Installation
------------
``` bash
# Search for titles (https://atlas.hashicorp.com/boxes/search)
$ vagrant init {title}

# Boot the environment (may not some time to download the box)
$ vagrant up

# Add new box (www.vagrantbox.es)
$ vagrant box add {title} {url}
```


Setup
-----
Vagrantfile:
* Mark the root directory
* kind of machine, resources, software, how to access
Note: it is meant to be committed to version control

We can also initialize an environment without a box, and then set it up later
``` bash
$ vagrant init
```

``` ruby
# within Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "{title}"
end
```

Connection and Destroy
----------------------
Connect to the environment
``` bash
$ vagrant ssh
```

Destroy: remove all traces of the virtual machine
``` bash
$ vagrant destroy
```

Synced Folders
--------------
Vagrant shares the project directory(which contains Vagrantfile) to the /vagrant directory in the vm


Provisioning
------------
Automatically run script during vagrant up.

Three points to run provisioning:
* First vagrant up
* vagrant provision, is used on a running environment
* Run the provisioners but skip the initial import step

``` bash
$ vagrant reload --provision
```

Note: after the first vagrant up, it doesn't run provision unless the --provision flag is explicitly provided

* File provisioner
upload files from the host machine to the guest machine
``` ruby
config.vm.provision "file", source: "{path}", destination: "{path}"
```
* Shell provisioner
``` ruby
# path is relative to project direction
config.vm.provision "shell",
  path: "{script name}.sh"

# inline with arguments
config.vm.provision "shell" do |s|
  s.inline = "echo $1"
  s.args   = ["hello, world!"]
end
```

Networking
----------
* Port Forwarding
Specify ports on the guest machine to share via a port on the host machine
``` ruby
config.vm.network :forwarded_port, host: 4567, guest: 80
```
At host machine, http://127.0.0.1:4567 will be forwarded to guest machine (vm) port 80.


Share
-----
Share Vagrant environment via url (requires an account on [HashiCorp's Atlas](https://atlas.hashicorp.com/))


``` bash
vagrant login
vagrant share
```
Note: the sharing environment online will get real-time update reflecting to local guest machine.

Teardown
--------
* Suspending (vagrant suspend):
	>save current running state and stop it.
	>Pros: super fast
	>Cons: still consume disk space

* Halting (vagrant halt):
	>shut down and power down
	>Pros: cleanly shut down
	>Cons: still consume disk space

* Destroying (vagrant destroy):
	>remove all traces
	>Pros: reclaim disk space and RAM
	>Cons: boot the guest machine from the ground


Providers
---------
Default provider: VirtualBox
It can be VMware (vmware_fusion), AWS (aws)
``` bash
$ vagrant up --provider={provider name}
```



