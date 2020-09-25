FROM alpine

ENV GH_VERSION  v1.0.0
ENV GH_FILE gh_1.0.0_linux_amd64.tar.gz
ENV GH_SHA  96575c888d979a6717928fe53bbd75d1acd52a6eec32aa41202d15919475ebfa

# Download gh version v1.0.0 and put binary files into /usr/local/bin
RUN set -ex; \
    # Downloading source file
    wget -q https://github.com/cli/cli/releases/download/${GH_VERSION}/${GH_FILE} \
    # Check SHA256sum
    && echo "${GH_SHA}" "${GH_FILE}" | sha256sum -c -

RUN tar zxfp ${GH_FILE} -C /tmp \
    && cp /tmp/gh_1.0.0_linux_amd64/bin/gh usr/local/bin/

ENTRYPOINT ["/usr/local/bin/gh"]
CMD ["--help"]