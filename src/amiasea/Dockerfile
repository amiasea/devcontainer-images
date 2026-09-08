FROM mcr.microsoft.com/devcontainers/base:ubuntu

LABEL org.opencontainers.image.source="https://github.com/amiasea/devcontainer-images"
LABEL org.opencontainers.image.description="Amiasea development environment for building and operating Amiasea engineering artifacts."

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        wget \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install PowerShell
RUN wget -q https://packages.microsoft.com/config/ubuntu/24.04/packages-microsoft-prod.deb \
        -O /tmp/packages-microsoft-prod.deb \
    && dpkg -i /tmp/packages-microsoft-prod.deb \
    && rm /tmp/packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get install -y --no-install-recommends powershell \
    && rm -rf /var/lib/apt/lists/*

RUN --mount=type=bind,source=setup-powershell.ps1,target=/tmp/setup-powershell.ps1 \
    pwsh -NoProfile -File /tmp/setup-powershell.ps1