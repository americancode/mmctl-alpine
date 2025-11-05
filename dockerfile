# Use an alpine image
FROM alpine:3.22

# Install prerequisites
RUN apk update && \
    apk upgrade --no-cache && \
    apk add bash curl tar wget git ca-certificates

ENV MMCTL_VERSION=10.12.2
# Install required dependencies: curl for downloading, and ca-certificates for HTTPS
RUN curl -vfsSL -O "https://releases.mattermost.com/mmctl/v${MMCTL_VERSION}/linux_amd64.tar" \
    && tar -xvf linux_amd64.tar \
    && mv mmctl /usr/local/bin/mmctl \
    && chmod +x /usr/local/bin/mmctl \
    && rm -rf linux_amd64.tar

# Set the default command to show mmctl help
CMD ["mmctl", "--help"]
