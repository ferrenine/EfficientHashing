@echo off
setlocal enabledelayedexpansion

set MC_INSTANCE=D:\package\解压包\.minecraft\versions\1.21.11-Fabric 0.20.1
set PROJECT_DIR=F:\code\EfficientHashingManual
set SRC_DIR=%PROJECT_DIR%\src\main
set OUT_DIR=%PROJECT_DIR%\out
set JAR_OUT=%PROJECT_DIR%\efficient_hashing-1.0.2+1.21.11.jar

set MINECRAFT_JAR=%MC_INSTANCE%\1.21.11-Fabric 0.20.1.jar
set FABRIC_API_JAR=%MC_INSTANCE%\mods\fabric-api-0.141.6+1.21.11.jar
set FABRIC_LOADER_JAR=D:\package\解压包\.minecraft\libraries\net\fabricmc\fabric-loader\0.20.1\fabric-loader-0.20.1.jar
set MIXIN_JAR=D:\package\解压包\.minecraft\libraries\org\spongepowered\mixin\0.8.5\mixin-0.8.5.jar

if not exist "%MINECRAFT_JAR%" (
    echo Error: missing %MINECRAFT_JAR%
    exit /b 1
)
if not exist "%FABRIC_API_JAR%" (
    echo Error: missing %FABRIC_API_JAR%
    exit /b 1
)
if not exist "%FABRIC_LOADER_JAR%" (
    echo Error: missing %FABRIC_LOADER_JAR%
    exit /b 1
)
if not exist "%MIXIN_JAR%" (
    echo Error: missing %MIXIN_JAR%
    exit /b 1
)

echo [1/3] Clean output...
if exist "%OUT_DIR%" rmdir /s /q "%OUT_DIR%"
mkdir "%OUT_DIR%"
mkdir "%OUT_DIR%\zank"
mkdir "%OUT_DIR%\resources"

echo [2/3] Compile Java...
set CP="%MINECRAFT_JAR";"%FABRIC_API_JAR";"%FABRIC_LOADER_JAR";"%MIXIN_JAR%"

javac -encoding UTF-8 -d "%OUT_DIR%" -cp %CP% ^
    "%SRC_DIR%\java\zank\mods\efficient_hashing\EfficientHashing.java" ^
    "%SRC_DIR%\java\zank\mods\efficient_hashing\PhiMix.java" ^
    "%SRC_DIR%\java\zank\mods\efficient_hashing\fabric\EfficientHashingMod.java" ^
    "%SRC_DIR%\java\zank\mods\efficient_hashing\mixin\MixinVec3i.java"

if errorlevel 1 (
    echo Compile failed!
    exit /b 1
)

echo [3/3] Package jar...
copy "%SRC_DIR%\resources\fabric.mod.json" "%OUT_DIR%\fabric.mod.json" >nul
copy "%SRC_DIR%\resources\efficient_hashing.mixins.json" "%OUT_DIR%\efficient_hashing.mixins.json" >nul

if exist "%JAR_OUT%" del "%JAR_OUT%"

cd /d "%OUT_DIR%"
jar cf "%JAR_OUT%" zank fabric.mod.json efficient_hashing.mixins.json

if errorlevel 1 (
    echo Package failed!
    exit /b 1
)

echo.
echo Build success!
echo Output: %JAR_OUT%
echo.
echo Copy this jar to: %MC_INSTANCE%\mods\
echo Make sure fabric-api is installed.

pause
