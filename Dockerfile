# Use Docker image as base
FROM ericpp/federated-msp

# Add yq to parse StartOS config file
RUN apk add yq

# Copy StartOS entrypoint
COPY ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod +x /usr/local/bin/*.sh

# Set as entrypoint
ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]
