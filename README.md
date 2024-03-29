# 📚 CMakeCM  ![GitHub](https://img.shields.io/github/license/flagarde/CMakeCM) ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/flagarde/CMakeCM) ![GitHub repo size](https://img.shields.io/github/repo-size/flagarde/CMakeCM)

CMake Community Modules

[LC]: https://github.com/flagarde/CMakeCM/actions/workflows/Linux-Clang.yml
[LCB]: https://github.com/flagarde/CMakeCM/actions/workflows/Linux-Clang.yml/badge.svg

[LG]: https://github.com/flagarde/CMakeCM/actions/workflows/Linux-GCC.yml
[LGB]: https://github.com/flagarde/CMakeCM/actions/workflows/Linux-GCC.yml/badge.svg

[MC]: https://github.com/flagarde/CMakeCM/actions/workflows/MacOS-Clang.yml
[MCB]: https://github.com/flagarde/CMakeCM/actions/workflows/MacOS-Clang.yml/badge.svg

[MG]: https://github.com/flagarde/CMakeCM/actions/workflows/MacOS-GCC.yml
[MGB]: https://github.com/flagarde/CMakeCM/actions/workflows/MacOS-GCC.yml/badge.svg

[MS]: https://github.com/flagarde/CMakeCM/actions/workflows/Windows-MSYS2.yml
[MSB]: https://github.com/flagarde/CMakeCM/actions/workflows/Windows-MSYS2.yml/badge.svg

[MM]: https://github.com/flagarde/CMakeCM/actions/workflows/Windows-MSVC.yml
[MMB]: https://github.com/flagarde/CMakeCM/actions/workflows/Windows-MSVC.yml/badge.svg

## 🧪 Tests
|        | Linux Clang | Linux GCC | MacOS Clang | MacOS GCC | Windows M2sys | Windows MSVC |
|--------|-------------|-----------|-------------|-----------|---------------|--------------|
| Github |[![Linux Clang][LCB]][LC]|[![Linux GCC][LGB]][LG]|[![MacOS Clang][MCB]][MC]|[![MacOS GCC][MGB]][MG]|[![Windows MSYS2][MSB]][MS]|[![Windows MSVC][MMB]][MM]|


## ✨ Introduction
This repository groups some useful `CMake Modules` that can be share between different repositories.

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

# 📚 ![Module Lists](https://github.com/flagarde/CMakeCM/tree/main/modules)
* ## Local :
  * [Color](modules/Colors.cmake) : Defines some colors and text styles.
  * [CPM](modules/CPM.cmake) : Wrapper for `CPM` the setup-free CMake dependency management.
  * [DefaultInstallPrefix](modules/DefaultInstallPrefix.cmake) : Set `CMAKE_INSTALL_PREFIX` if it has not been defined before.
  * [Doctest](modules/Doctest.cmake) : Use `CPM` to set up `doctest`.
  * [Fmt](modules/Fmt.cmake) : Use `CPM` to set up `fmt`.
  * [GetLatestCMakeVersion](modules/GetLatestCMakeVersion.cmake) : Obtain the CMake's latest version number.
  * [IXWebSocket](modules/IXWebSocket.cmake) : Use `CPM` to set up `IXWebSocket`.
  * [MagicEnum](modules/MagicEnum.cmake) : Use `CPM` to set up `magic_enum`.
  * [Missives](modules/Missives.cmake) : Defines the `missive` command to use colored and personalized styles.
  * [OpenSSL](modules/OpenSSL.cmake) : Use `openssl-cmake` https://github.com/flagarde/openssl-cmake to compile `OpenSSL` using `CPM`.
  * [Ping](modules/Ping.cmake) : A basic ping for CMake. Test if you are online.
  * [PreventInSourceBuilds](modules/PreventInSourceBuilds.cmake) : Prevents building the project from his source directory.
  * [SourceLocation](modules/SourceLocation.cmake) : Use `CPM` to set up `source_location`.
  * [Spdlog](modules/Spdlog.cmake) : Use `CPM` to setup `spdlog`.
  * [Standards](modules/Standards.cmake) : Set the `CMAKE_C_STANDARD` or `CMAKE_CXX_STANDARD` to the required standard.
  * [Testings](modules/Testings.cmake) : Some `CMake` functions to perform some tests in `CMake files`.
  * [Toml11](modules/Toml11.cmake) : Use `CPM` to set up `toml11`.
  * [Zlib-ng](Zlib-ng.cmake) : Compile `zlib-ng` https://github.com/zlib-ng/zlib-ng using `CPM`.

* ## Remote :
