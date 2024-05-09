# newfile-util

`new` is cmdline utility to create new file from predefined template.

## Why should I use `new`

Answer is pretty simple: Save time.

## Install

```sh
# clone repo
$ git clone https://gitub.com/e55am/newfile-util.git

# Navigate into it
$ cd newfile-util

# Install for current user
$ ./install.sh

# OR install it system wide
$ sudo ./install.sh
```

## Uninstall
```sh
$ ./uninstall.sh

# or with root perm for system wide installation
$ sudo ./uninstall.sh
```

## Usage

```
new [-h] FILE...

Option:
  -h    Print help message.

```

## Example

```
$ new foo.c {bar,baz}.h
```

## License

new under [GPLv3 License](https://gihub.com/e55am/new-util/blob/master/LICENSE)
