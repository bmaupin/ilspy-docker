Dockerfile for [ILSpy](https://github.com/icsharpcode/ILSpy) .NET decompiler

#### Usage

1. (Recommended) Build locally

   ⓘ Recommended as the published image hasn't been updated
   1. Get the latest Ubuntu/dotnet versions from [here](https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu-install) and update the Dockerfile

   1. Build

      ```
      docker build -t ilspy .
      ```

1. CD to the directory containing the .exe to decompile

1. Decompile

   ```
   mkdir decompiled
   docker run --rm --user $(id -u):$(id -u) -v "$PWD:/workdir" ilspy ilspycmd -p -o /workdir/decompiled -lv CSharp4 /workdir/FILE.exe
   ```

   - Replace `ilspy` with `ghcr.io/bmaupin/ilspy` to use the (outdated) published image
   - Replace `FILE.exe` with the name of the .exe to decompile in the current directory
   - Change parameters (e.g. `-lv CSharp4`) as desired

     👉 TODO: How can one determine which dotnet level to use?
