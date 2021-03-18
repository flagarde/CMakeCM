# 📚 CMakeCM #
![GitHub](https://img.shields.io/github/license/flagarde/CMakeCM) ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/flagarde/CMakeCM) ![GitHub repo size](https://img.shields.io/github/repo-size/flagarde/CMakeCM) ![Tests Linux](https://github.com/flagarde/CMakeCM/workflows/Tests%20Linux/badge.svg) ![Tests MacOS](https://github.com/flagarde/CMakeCM/workflows/Tests%20MacOS/badge.svg) ![Tests Windows](https://github.com/flagarde/CMakeCM/workflows/Tests%20Windows/badge.svg)

CMake Community Modules

## ✨ Introduction 
This repository groups some usefull `CMake Modules` that can be share between different repositories.

## 📝 Create a Modules List

Modules can be `LOCALE` or `REMOTE` :

### ➕ Adding a "Local" Module

Local modules are contained within the repository given by `URL` in `cmmm_modules_list`. If you do not wish to own a separate repository to contain the module, this is the recommended way to do so.

To start, add a module in the repository. This will be the module that will be included by the user. It should consist of a single CMake file.

After adding the module, add a call to `cmcm_module` in the Modules List.

Suppose you add a `SuperCoolModule.cmake` to `modules`. The resulting call in `modules/ModulesList.cmake` will look something like this :

```cmake
cmcm_module(SuperCoolModule.cmake
            LOCAL modules/SuperCoolModule.cmake
            VERSION 1)
```

The `VERSION` argument is an arbitrary string that is used to invalidate local copies of the module that have been downloaded.

### ➕ Adding a "Remote" Module

If you have a module that you wish to add, but it is contained in a remote location, you simply need to add the call in the Modules List`:

```cmake
cmcm_module(MyAwesomeModule.cmake
            REMOTE https://some-place.example.com/files/path/MyAwesomeModule.cmake
            VERSION 1)
```

The `VERSION` argument is an arbitrary string that is used to invalidate local copies of the module that have been downloaded.

The `REMOTE` is a `URL` to the file to download for the module. In order for your modification to be accepted into the repository, it must meet certain criteria:

1. The URL *must* use `https`.
2. The URL *must* refer to a stable file location. If using a `Git URL`, it should refer to a specific commit, not to a branch.

# 📚 ![Module Lists](https://github.com/flagarde/CMakeCM/tree/master/modules)
* ## Local :
  * [Color](modules/Colors.cmake) : Defines some colors and text styles.
  * [CPM](modules/CPM.cmake) : Wrapper for `CPM` the setup-free CMake dependency management.
  * [DefaultInstallPrefix](modules/DefaultInstallPrefix.cmake) : Set `CMAKE_INSTALL_PREFIX` if it has not been defined before.
  * [Doctest](modules/Doctest.cmake) : Use `CPM` to setup `doctest`.
  * [Messages](modules/Messages.cmake) : Redefines the `message` command to use personnalized styles.
  * [Ping](modules/Ping.cmake) : Prevents building the project from his source directory.
  * [PreventInSourceBuilds](modules/PreventInSourceBuilds.cmake) : Prevents building the project from his source directory.
  * [Standards](modules/Standards.cmake) : Set the `CMAKE_C_STANDARD` or `CMAKE_CXX_STANDARD` to the required standard.
  * [Testings](modules/Testings.cmake) : Some `CMake` functions to perform some tests in `CMake files`.

* ## Remote :
