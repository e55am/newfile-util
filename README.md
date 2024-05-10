# newfile-util

`new` is cmdline utility to create new file from predefined template.

## Why should I use `new`

Answer is pretty simple: Save time.

## CAUTION!!

**THIS PROGRAM MAY MODIFY OR DELETE YOUR FILES.**\
Before proceeding, please backup the following directory. for install/uninstall
* without root permission: `~/Templates`
* with root permission: `/usr/local/share/Templates`.


## Install

```sh
# clone repo
$ git clone https://github.com/e55am/newfile-util.git

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

To enhance the call-to-action in your repository README for encouraging engagement and support, consider incorporating a more engaging and direct approach. Here's a revised version:

---

## Support This Project

If you find value in this repository, please consider taking a moment to:

- **Star the Repository**
- **Recommend to Others**


## License

new under [GPLv3 License](https://github.com/e55am/new-util/blob/main/LICENSE)
