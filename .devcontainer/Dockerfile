ARG VARIANT="buster"
FROM mcr.microsoft.com/vscode/devcontainers/rust:1-${VARIANT}

# Install my tooling
# [Option] Install zsh
ARG INSTALL_ZSH="true"
# [Option] Upgrade OS packages to their latest versions
ARG UPGRADE_PACKAGES="true"
# Install needed packages and setup non-root user. Use a separate RUN statement to add your own dependencies.
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Install and configure zsh
COPY custom-scripts/zsh/* /tmp/library-scripts/
RUN /bin/bash /tmp/library-scripts/update-zsh.sh "${USERNAME}" \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts/

# Configure GIT ...
COPY custom-scripts/git/* /tmp/library-scripts/
RUN /bin/bash /tmp/library-scripts/configure-git.sh "${USERNAME}" \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts/

# Configure SSH ... 
# Configure commit signing
COPY custom-scripts/security/* /tmp/library-scripts/
RUN /bin/bash /tmp/library-scripts/configure-sign.sh "${USERNAME}" \
    && /bin/bash /tmp/library-scripts/configure-cert.sh \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

# Remove library scripts for final image
RUN rm -rf /tmp/library-scripts
