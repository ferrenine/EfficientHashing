# EfficientHashing — Fabric 26.3

EfficientHashing replaces the hashing algorithm of `Vec3i` (and its subclasses
such as `BlockPos`) with a much more collision-resistant one. It is a fork of
[ZZZank/EfficientHashing](https://github.com/ZZZank/EfficientHashing).

This branch contains the **Minecraft 26.3 Fabric** port. 26.3 ships
unobfuscated official names, so the mixin targets `net.minecraft.core.Vec3i`
directly and no refmap is required.

## Build

Requires JDK 25 to run Gradle itself (Loom 1.18.4 requires a Java 25 JVM).
The included wrapper uses Gradle 9.7.1:

```powershell
$env:JAVA_HOME = "C:\Program Files\Java\jdk-25"
.\gradlew build
```

Or, with a local Gradle 9.7.1 installation:

```powershell
$env:JAVA_HOME = "C:\Program Files\Java\jdk-25"
gradle build
```

Output: `build/libs/efficient_hashing-1.0.2+26.3.jar`

## Install

Put the built jar into `mods/`. The mod only needs Fabric Loader 0.20.1+;
Fabric API is not required.

## License

LGPL-3.0, following the upstream project. See `LICENSE`.
