# Multipass

Multipass is a command-line tool to manage Ubuntu virtual machines on a
computer from the command line. With the help of multipass, we can
simulate a cloud that manages virtual machines on your computer.

Naturally, your computer needs to have enough main memory for running
multiple virtual machines. You need administrative privileges
to use multipass (for example, on OSX and Linux being able to run as
`sudo`).

More information about multipass can be found at 

* <https://multipass.run/>

## Install 

Follow the install instructions as documented at

* <https://multipass.run/docs>

### Ubuntu 18.04

On Ubuntu 18.04, `multipass` is provided as a
[snap](https://snapcraft.io/) application. `snap` is part of the core
Ubuntu 18.04 system so no additional setup is required. To install
`multipass` using `snap` via the command line, open up a
terminal/command line window and execute this command.

```
sudo snap install multipass --classic
```

### OSX

We recommend that you conduct the package based install, but you can
also, do the brew install if you have used brew for other activities.

#### Sudo on OSX

On OSX, you need to be in the sudoer's list. Please consult on the Net to
understand what `sudo` is. We recommend that you create a separate user
with such privileges and use that for trying it out instead of using
your main account. To add this user to `sudo`, conduct the following steps.


First, login as an administrator and edit the file 

   /etc/sudoers

In that file, find the following line: 

    %admin ALL=(ALL) ALL 

After that line, add your username to the list of sudoers as follows: 

    username ALL=(ALL) ALL
    
### Windows 10

#### Windows 10 EDU and Pro with Hyper-V 

These instructions work for 64-bit Windows 10 Education or Windows 10 Pro
using Hyper-V. 

The easiest is to visit <https://multipass.run/> and click `Download
Multipass for Windows` to download the executable installer. Next in an
an elevated shell that you start through `WINDOWS-X` you can install
multipass and it will configure Hyper-V for you on your machine, after
which you have to reboot.

If this doe s not work, conduct the following.

Hyper-V must be activated in the Bios. In Windows 1909, this can be
achieved within Powershell, and you will be asked the first time you
start multipass in PowerShell. If this does not work, please set it in
your Bios. Some machines may not support Hyper-V, in which case you can
use Virtualbox as the driver.

YOu can also check and set the Hyper-V on and of through the 
`WINDOWS+S` (on your keyboard) and find `Turn Windows features on or
off`. Find HyperV and ensure it is enabled. If your machine did not
already have it enabled, you must restart your computer so the changes
will take effect. Alternatively, enable Hyper-V for multipass by
launching an elevated Powershell with administrative rights and execute
the following:

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
```

#### Windows 10 Home with Virtualbox

See: <https://multipass.run/docs/installing-on-windows> 
You must have Virtualbox installed before you can set the provider.

## Experimenting with Multipass

Now let us experiment with multipass. Launch an instance with 

```bash
$ multipass launch --name ubuntu-lts
```

Execute a command in the instance with 

```bash
$ multipass exec ubuntu-lts -- lsb_release -a
```

List all instances with and specify the output in various formats

```bash
$ multipass list
$ multipass list --format yaml
$ multipass list --format json
$ multipass list --format csv
```

Stop the instance with 

```bash    
$ multipass stop ubuntu-lts
```

Make sure it is stopped

```bash
$ multipass list --format yaml
```

Start the instance

```bash
$ multipass start ubuntu-lts
```

Make sure its started

```bash
$ multipass list --format yaml
```

Stop it again

```bash
$ multipass stop ubuntu-lts
```

Start the primary

```bash
$ multipass start 
```

List the running instances

```bash
$ multipass list --format yaml
```

Delete all instances

```bash
$ multipass delete --all
```

Make sure they are deleted

```bash
$ multipass list --format yaml
```

Purge the instances

```bash
$ multipass purge
```

Make sure they are purged

```bash
$ multipass list --format yaml
```

`multipass find` can be used to find other available images.

For full details see the [find command docs](https://multipass.run/docs/find-command)

Find can also take the name of the image that you can identify just with
the find option. Please be aware that based on the OS you may see more or
fewer image options as discussed in E.Multipass.5.

To switch to a different VM support, you can use

OSX: (default is hyperkit)

```bash
sudo multipass set local.driver=hyperkit
sudo multipass set local.driver=virtualbox
```

Windows: (default is hyperv, it must be enabled.)

```bash
multipass set local.driver=hyperv
multipass set local.driver=virtualbox
```

You have to reboot for the feature to take effect in Windows. If you
have Windows 10 Home, you must use Virtualbox. Please get Windows Pro or
EDU instead.

## Exercises

E.Multipass.1:

> OS: Windows 10 Pro:
   
> Download and install multipass exe for windows at 
> <https://github.com/canonical/multipass/releases/download/v1.0.0/multipass-1.0.0+win-win64.exe>
> After installation verify at cmd prompt
> ```bash
>  C:\>multipass version
> ```

E.Multipass.1.a:

Improve the Multipass installation instructions presented here for your OS.

E.Multipass.2: 

> What is Primary in multipass

E.Multipass.3: 

> What is snapcraft in multipass 

E.Multipass.4:

> How do you write a bibtex entry for <https://multipass.run/>
>
> Add all bibtex entries (e.g. the URLs you see in multipass.md) into
> <https://github.com/cloudmesh-community/book/blob/master/bib/multipass.bib>
>
> Tip: see: <https://github.com/cloudmesh-community/book/blob/master/bib/refs.bib> 
> for examples.
>
> Answer:
>
> Provided by students

E.Multipass.5:

> Provide more extensive examples for find
>
> * <https://multipass.run/docs/find-command>
> * <https://launchpad.net/ubuntu/+series>
> 
> Provide a list of images that are supported on your system.
>
> Solution:
>
> OSX: using hyperkit
>

| Image             | Aliases    | Version   | Description |
| ----------------- | ---------- | --------- | ----------- | 
| snapcraft:core    | core16     | 20200115  | Snapcraft builder for Core 16 |
| snapcraft:core18  |            | 20200115  | Snapcraft builder for Core 18 |
| 16.04             | xenial     | 20200108  | Ubuntu 16.04 LTS |
| 18.04             | bionic,lts | 20200107  | Ubuntu 18.04 LTS |

>
> OSX: using virtualbox
>


| Image             | Aliases    | Version   | Description |
| ----------------- | ---------- | --------- | ----------- | 
| 16.04             | xenial     | 20200108  | Ubuntu 16.04 LTS |
| 18.04             | bionic,lts | 20200107  | Ubuntu 18.04 LTS |

>
> Linux:
>

| Image             | Aliases     | Version   | Description |
| ----------------- | ----------- | --------- | ----------- | 
| snapcraft:core    | core16      | 20200115  | Snapcraft builder for Core 16 |
| snapcraft:core18  |             | 20200115  | Snapcraft builder for Core 18 |
| core              | core16      | 20190806  | Ubuntu Core 16 |
| core18            |             | 20190806  | Ubuntu Core 18 |
| 16.04             | xenial      | 20200108  | Ubuntu 16.04 LTS |
| 18.04             | bionic,lts  | 20200107  | Ubuntu 18.04 LTS |
| 19.04             | disco       | 20200109  | Ubuntu 19.04 |
| 19.10             | eoan        | 20200107  | Ubuntu 19.10 |
| daily:20.04       | devel,focal | 20200113  | Ubuntu 20.04 LTS |

>
> Windows:
>
| Image              | Aliases     | Version    | Description |
| -------------------|-------------| -----------| ------------|
| 16.04              | xenial      | 20200108   | Ubuntu 16.04 LTS |
| 18.04              | bionic,lts  | 20200107   | Ubuntu 18.04 LTS |
> 

E.Multipass.6:

> Explain cloud-init. Provide an example

E.Multipass.7:

> Install MikroK8s in multipass and provide a users guide

E.Multipass.8:

>
> For this assignment we will be using and improving [cloudmesh-multipass](https://github.com/cloudmesh/cloudmesh-multipass)
>
> 1. make sure the Provider.py has all important functionality
> 1. make sure that all functionality is exposed through the multipass provider
> 1. research pytests as used in cloudmesh-cloud
> 1. develop a pytest that can be run by anyone but results in a table using Benchmarks from cloudmesh
> 1. split the work up if needed among the class participants. Also if you are the first to develop 
>    the pytest you get additional points
>
> Measure the performance of fetching and launching the image with the 
> different hypervisors on your system. Report the results in a table with 
> a timer for each hypervisor and distinguish fetching and launching times. 
> Measure also the time to execute a command in the VM.
>
> The table will have the columns
>
> Image, Hypervisor, Fetch, Launch, Execute 
>
> Make sure to purge the images between tests.
>
> Use a pytest and cloudmesh Benchmark for creating the Benchmarks.
> The pytest can be shared among all students. Discuss on Piazza 
> how to do it. Use a cloudmesh shell variable for the HYPERVISOR type.
>

E.Multipass.9a:

> What is k3s?
>
> Tip: <https://k3s.io/>
> Tip: <https://rancher.com/docs/k3s/latest/en/>


E.Multipass.9b:

> Create a cloudmesh command to start a k3s cluster 
> Leverage the template discussed at
> <https://medium.com/better-programming/local-k3s-cluster-made-easy-with-multipass-108bf6ce577c>
>
> use 
>
> `cloudmesh sys command generate k3s`
> 
> To generate the command such as
>
> cms k3s [--hypervisor=hyperkit] --names=\"node[0-3]\" deploy
>
> where the first note is assumed to be the master. This command deploys 
> on your local computer, a 3 node Kubernetes cluster.
>
> Extend the 
> command list to include
>
> start, stop, purge, delete, ... and so on. Discuss with others in class
> what commands should be implemented.

E.Multipass.10:

>
> For this assignment we will be using and improving [cloudmesh-multipass](https://github.com/cloudmesh/cloudmesh-multipass)
>
> Look at the abstract class in
> 
> * <https://github.com/cloudmesh/cloudmesh-cloud/blob/master/cloudmesh/abstractclass/ComputeNodeABC.py>
>
> Improve the multipass provider while inheriting from ComputeNodeABC.py 
> and implement as many of the functions as you can and need. Many need 
> not to be implemented, though.
> First, provide a list of methods that you need to implement and then complete it.
> The entire class is allowed to collaborate with each other. Make pull requests into the Repository.
>
