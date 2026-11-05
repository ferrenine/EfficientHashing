# EfficientHashing — Fabric 1.21.11

EfficientHashing replaces the hashing algorithm of `Vec3i` (and its subclasses
such as `BlockPos`) with a much more collision-resistant one. It is a fork of
[ZZZank/EfficientHashing](https://github.com/ZZZank/EfficientHashing).

This branch contains the standalone **1.21.11 Fabric** build. It uses a small
manual `javac` build instead of the upstream Stonecutter setup, and the mixin
targets the intermediary names used by the production jar directly.

## Build

1. Open `build.bat` and set `MC_INSTANCE` to your Minecraft 1.21.11 Fabric
   instance (the folder containing the version jar and a `mods` folder with
   Fabric API).
2. Run `build.bat`.
3. The output jar is `efficient_hashing-1.0.2+1.21.11.jar`.

The build needs:

- JDK 21+
- Fabric Loader 0.20.1
- Fabric API 0.141.6+1.21.11
- Sponge Mixin 0.8.5

## Install

Put the built jar into `mods/` together with Fabric API for Minecraft 1.21.11.

## License

LGPL-3.0, following the upstream project. See `LICENSE`.
