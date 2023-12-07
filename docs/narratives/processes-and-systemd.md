# A Rough Narrative

* Linux will just run multiple programs
* Programs can fork off children or even replace themselves
    * when you run a command in bash (which is just a program)
      it forks off that child process
    * something like `agetty` which watches for a legit login
      will replace itself with something like bash once a login occurs
* The above means there can be multiple "PPID" roots on a running system
* It so happens (modern) that often something like systemd is started
  as PID 1 and forms the root of the whole tree, but that is as much convention

And to be clear userspace programs must "ask" the kernel to do things like open files
* strace on a program makes clear where those interactions between kernel and program
  occur

In the history of managing multiple programs and their dependencies

* system5: init and init tab where just scripts run on start up
    * this approach became to "serial" for complex modern systems and didn't handle dependency graph well
        * e.g. don't start webserver until network is up kind of logic
* impd: was a system that listened on ports for requests to control given processes
* apple made launchd early on
    * dependency graph
    * realtime control over subprocesses and watching their states
* redhat "copies" launchd as systemd

A few systemd specific notes

* `/sbin/init` can get symlinked to `/lib/systemd/systemd` or `/bin/systemd` by the `systemd-sysv` package

A few shell ideas

* AUX (apple unix command line) was a powerful cli/gui combo

