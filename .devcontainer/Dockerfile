FROM mcr.microsoft.com/devcontainers/java:21-bullseye

# Install additional development tools
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        curl \
        wget \
        git \
        vim \
        nano \
        htop \
        tree \
        unzip \
        zip \
        build-essential \
        pkg-config \
        libssl-dev \
        libffi-dev \
        python3 \
        python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install GraalVM for native image compilation
ENV GRAALVM_VERSION=21.0.2
ENV GRAALVM_HOME=/opt/graalvm-ce-java21-${GRAALVM_VERSION}
ENV PATH=${GRAALVM_HOME}/bin:${PATH}

# Download and install GraalVM
RUN wget -q https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAALVM_VERSION}/graalvm-ce-java21-linux-amd64-${GRAALVM_VERSION}.tar.gz \
    && tar -xzf graalvm-ce-java21-linux-amd64-${GRAALVM_VERSION}.tar.gz -C /opt \
    && rm graalvm-ce-java21-linux-amd64-${GRAALVM_VERSION}.tar.gz \
    && ${GRAALVM_HOME}/bin/gu install native-image

# Set JAVA_HOME to point to GraalVM
ENV JAVA_HOME=${GRAALVM_HOME}

# Set up Maven configuration
RUN mkdir -p /home/vscode/.m2
COPY maven-settings.xml /home/vscode/.m2/settings.xml

# Set proper permissions
RUN chown -R vscode:vscode /home/vscode/.m2

# Switch to vscode user
USER vscode

# Verify installations
RUN java --version && mvn --version
