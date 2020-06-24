# mv_tmux_vi_zen

Documentation and scripts for combining tmux and vi usage.

# License

copyright (C) 2020 Martin VanWinkle III, Institute for Advanced Study

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

See 

* http://www.gnu.org/licenses/

## Description

* some_script.sh - does something.

# Supplemental Documentation

Supplemental documentation for this project can be found here:

* [Supplemental Documentation](./doc/index.md)

# tmux + vi zen
## tmux

### Splitting

Split vertically:

```
ctrl + b %
```

Split horizontally:

```
ctrl + b "
```

#### Closing splits

```
ctrl + b x
```

#### Navigation

```
ctrl + b    ^
          <-+->
            v
```

To cycle between splits:
```
ctrl + b o
```

### Maximize / Restore Pane

```
ctrl + b z
```

## VI

### Splitting

Split vertically:

```
ctrl + w v

or
:vsplit [file]
or
:vsp [file]

```

Split horizontally:
```
ctrl + w s

or
:split [file]
or
:sp [file]
```

Close split:
```
:q
```

#### Navigating Splits

To go between splits:
```
ctrl + w +

     ^ k
 h <-+-> l
     v j
```


#### Resizing Splits

Reset splits:
```
ctrl + w =
```

"Maximize" vertical split:
```
ctrl + w |  (pipe)
```

"Maximize" horizontal split:
```
ctrl + w _
```


### Editing a file

```
:e path/to/file
```


### Changing navigation bindings

```
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
```

# Installation

Ideally stuff should run if you clone the git repo, and install the deps specified
in either "DEBIAN/control" or "RPM/specfile.spec"

Optionally, you can build a package which will install the binaries in

* /opt/IAS/bin/mv-tmux-vi-zen/.

# Building a Package

## Requirements

### All Systems

* fakeroot

### Debian

* build-essential

### RHEL based systems

* rpm-build

## Export a specific tag (or just the project directory)

## Supported Systems

### Debian packages

```
  fakeroot make package-deb
```

### RHEL Based Systems

```
fakeroot make package-rpm
```

