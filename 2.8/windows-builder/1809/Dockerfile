FROM golang:1.23.0-windowsservercore-1809

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV XKENGINE_VERSION v0.4.2
# Configures xkengine to build with this version of Kengine
ENV KENGINE_VERSION v2.8.4
# Configures xkengine to not clean up post-build (unnecessary in a container)
ENV XKENGINE_SKIP_CLEANUP 1

RUN Invoke-WebRequest \
        -Uri "https://github.com/khulnasoft/xkengine/releases/download/v0.4.2/xkengine_0.4.2_windows_amd64.zip" \
        -OutFile "/xkengine.zip"; \
    if (!(Get-FileHash -Path /xkengine.zip -Algorithm SHA512).Hash.ToLower().Equals('8ef75d6141029a1f2a2b5aefdee44f0704366302c7416e2136341a3c5910d7809e713cf3d965512f1440473b99c177a0d19789e20601628462747a2d6bc71d27')) { exit 1; }; \
    Expand-Archive -Path "/xkengine.zip" -DestinationPath "/" -Force; \
    Remove-Item "/xkengine.zip" -Force

WORKDIR /
