FROM ubuntu:20.04

LABEL org.opencontainers.image.source=https://github.com/bmaupin/ilspy-docker

# Install wget
RUN apt update && \
    apt -y install wget

# Install Microsoft package signing key
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb

# Install .NET SDK (required to use `dotnet tool`, includes the runtime)
RUN apt install -y apt-transport-https && \
    apt update && \
    apt install -y dotnet-sdk-6.0

# Use a directory accessible by non-root users so they can run ILSpy
ENV DOTNET_CLI_HOME=/opt/dotnet/
# Set up the path to ilspycmd
ENV PATH="$DOTNET_CLI_HOME/.dotnet/tools/:$PATH"

# Install ILSpy
RUN dotnet tool install ilspycmd -g
