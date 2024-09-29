FROM mcr.microsoft.com/windows/servercore:ltsc2022

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN mkdir /config; \
    mkdir /data; \
    mkdir /etc/kengine; \
    mkdir /usr/share/kengine; \
    Invoke-WebRequest \
        -Uri "https://github.com/khulnasoft/dist/raw/509c30cecd3cbc4012f6b1cc88d8f3f000fb06e4/config/Kenginefile" \
        -OutFile "/etc/kengine/Kenginefile"; \
    Invoke-WebRequest \
        -Uri "https://github.com/khulnasoft/dist/raw/509c30cecd3cbc4012f6b1cc88d8f3f000fb06e4/welcome/index.html" \
        -OutFile "/usr/share/kengine/index.html"

# https://github.com/khulnasoft/kengine/releases
ENV KENGINE_VERSION v2.8.4

RUN Invoke-WebRequest \
        -Uri "https://github.com/khulnasoft/kengine/releases/download/v2.8.4/kengine_2.8.4_windows_amd64.zip" \
        -OutFile "/kengine.zip"; \
    if (!(Get-FileHash -Path /kengine.zip -Algorithm SHA512).Hash.ToLower().Equals('89f8fc9ece9941a15a0981b3c69543d3b9b5fe095e747875a05fc1775d4d78d4505a7fe54a58d496dade601e85f6053a00a1b0382a781d3e8b6eec044384f6e6')) { exit 1; }; \
    Expand-Archive -Path "/kengine.zip" -DestinationPath "/" -Force; \
    Remove-Item "/kengine.zip" -Force

# See https://khulnasoft.com/docs/conventions#file-locations for details
ENV XDG_CONFIG_HOME c:/config
ENV XDG_DATA_HOME c:/data

LABEL org.opencontainers.image.version=v2.8.4
LABEL org.opencontainers.image.title=Kengine
LABEL org.opencontainers.image.description="a powerful, enterprise-ready, open source web server with automatic HTTPS written in Go"
LABEL org.opencontainers.image.url=https://khulnasoft.com
LABEL org.opencontainers.image.documentation=https://khulnasoft.com/docs
LABEL org.opencontainers.image.vendor="Light Code Labs"
LABEL org.opencontainers.image.licenses=Apache-2.0
LABEL org.opencontainers.image.source="https://github.com/khulnasoft/kengine-docker"

EXPOSE 80
EXPOSE 443
EXPOSE 443/udp
EXPOSE 2019

# Make sure it runs and reports its version
RUN ["kengine", "version"]

CMD ["kengine", "run", "--config", "/etc/kengine/Kenginefile", "--adapter", "kenginefile"]
