Dockerfile for [ILSpy](https://github.com/icsharpcode/ILSpy) .NET decompiler

#### Usage

1. CD to the directory containing the .exe to decompile

1. Decompile

   ```
   mkdir decompiled
   docker run --rm --user $(id -u):$(id -u) -v "$PWD:/workdir" ghcr.io/bmaupin/ilspy ilspycmd -p -o /workdir/decompiled -lv CSharp4 /workdir/FILE.exe
   ```

   - Replace `FILE.exe` with the name of the .exe to decompile in the current directory
   - Change parameters (e.g. `-lv CSharp4`) as desired

#### Build

```
docker build -t ilspy .
```
