Foreman boot disk commands for Hammer CLI
=========================================

This [Hammer CLI](https://github.com/theforeman/hammer-cli) plugin contains
set of commands for [foreman_bootdisk](https://github.com/theforeman/foreman_bootdisk),
a plugin to [Foreman](http://theforeman.org/) for ISO/USB booting support

Documentation
-------------

Basic configuration of Hammer to communicate with Foreman is covered in the
hammer-cli-foreman documentation:

 - [Hammer CLI Foreman configuration](https://github.com/theforeman/hammer-cli-foreman/blob/master/doc/configuration.md)

To download the generic disk (ISO/USB) image, run:

    hammer bootdisk generic

Or to download a per-host disk, run:

    hammer bootdisk host --host client.example.com

Files will be downloaded into the current directory unless `--file` is used to set the
destination:

    hammer bootdisk generic --file /tmp/generic.iso

If a device is given to `--file`, you can write the image directly to it by adding the
`--force` option.  Needless to say, but **double check** the device name is correct to
avoid overwriting the wrong disk.

    hammer bootdisk generic --file /dev/sdb --force

When running hammer as an unprivileged user with no access to the device, add `--sudo`
to execute `sudo dd` for the copy.  Password prompts may be shown if NOPASSWD is not
configured.

    hammer bootdisk generic --file /dev/sdb --force --sudo


How to run
----------

We build rpms, debs and gems. Alternatively you can install hammer from a git checkout.
See our [Hammer CLI installation and configuration instuctions](https://github.com/theforeman/hammer-cli/blob/master/doc/installation.md#installation).

Having issues?
--------------

If one of hammer commands doesn't work as you would expect, you can run `hammer -d ...` to get
full debug output from the loggers. It should give you an idea what went wrong.

If you have questions, don't hesitate to contact us on `foreman-users@googlegroups.com` or
`Freenode#theforeman` IRC channel.

License
-------

This project is licensed under the GPLv3+.
