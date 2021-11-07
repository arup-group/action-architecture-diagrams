FROM structurizr/cli:latest
ENV PATH="/usr/local/openjdk-11/bin:${PATH}"
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/validate.sh"]
