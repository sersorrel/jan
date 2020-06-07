# jan

Capture filesystem changes using overlayfs.

jan runs a command in a chroot, capturing all filesystem changes it
makes using overlayfs, and saves the resulting files in an isolated
directory tree. It does not use LD_PRELOAD, so it works even with
statically-linked programs, though it does require root privileges.

## Dependencies

jan depends on coreutils, mountpoint (part of util-linux), and a
POSIX-compliant shell. Linux 3.18 or greater is also required.

## Installation

Install from a [Debian package][jan], or run `make install` from a
[release tarball][jan] or development sources.

[jan]: https://sorrel.sh/projects/jan/

## Usage

    $ jan PATH COMMAND...

where `PATH` is the directory in which jan should store the files
created by `COMMAND`, which will be run as root.

Note that jan will not create `PATH` if it doesn't already exist, in
order to avoid inadvertently leaving you with a directory owned by root.
In addition, it must be possible for jan to create a temporary directory
_next to_ `PATH` (not beneath), and that temporary directory must be on
the same filesystem as `PATH`, which in practice means that jan cannot
operate if a filesystem is mounted at `PATH` (it will attempt to tell
you if this is the case).

See the [overlayfs documentation][overlayfs] for detailed information on
how jan deals with e.g. file deletions.

[overlayfs]: https://www.kernel.org/doc/html/latest/filesystems/overlayfs.html

## Contributing

Contributions are welcome!

Everyone interacting with this project is expected to abide by the terms
of the Contributor Covenant Code of Conduct. Violations should be
reported to coc-enforcement-jan@sorrel.sh.

## Copyright

Copyright © 2020 Ash Holland. Licensed under the EUPL (1.2 or later).
