# EfficientHashing — Fabric 26.3

EfficientHashing replaces the hashing algorithm of `Vec3i` (and its subclasses
such as `BlockPos`) with a much more collision-resistant one. It is a fork of
[ZZZank/EfficientHashing](https://github.com/ZZZank/EfficientHashing).

This branch contains the **Minecraft 26.3 Fabric** port. 26.3 ships
unobfuscated official names, so the mixin targets `net.minecraft.core.Vec3i`
directly and no refmap is required.

## Build

Requires JDK 25. Loom 1.18.4 requires Gradle 9.7+, and the included wrapper
uses Gradle 9.7.1:

```powershell
.\gradlew build
```

Or, with a local Gradle 9.7.1 installation:

```powershell
gradle build
```

Output: `build/libs/efficient_hashing-1.0.2+26.3.jar`

## Install

Put the built jar into `mods/`. The mod only needs Fabric Loader 0.20.1+;
Fabric API is not required.

## License

LGPL-3.0, following the upstream project. See `LICENSE`.
