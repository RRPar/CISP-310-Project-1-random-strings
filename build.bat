@echo off
REM Build with MASM. Adjust IRVINE to where Irvine32 is installed.
set IRVINE=C:\Irvine
if not exist build mkdir build
ml /c /coff /nologo /I %IRVINE% /Fo build\main.obj src\main.asm || exit /b 1
link /nologo /subsystem:console /entry:start /INCREMENTAL:NO /libpath:%IRVINE% build\main.obj irvine32.lib kernel32.lib user32.lib /out:build\main.exe || exit /b 1
build\main.exe
