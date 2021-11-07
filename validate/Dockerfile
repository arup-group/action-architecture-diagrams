FROM structurizr/cli:latest
ENV PATH="/usr/local/openjdk-11/bin:${PATH}"
COPY validate.sh /validate.sh
ENTRYPOINT ["/validate.sh"]
