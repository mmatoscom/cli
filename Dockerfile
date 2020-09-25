FROM alpine

ENV GH_VERSION v1.0.0
ENV GH_FILE gh_1.0.0_linux_amd64.tar.gz

WORKDIR /opt

RUN wget https://github.com/cli/cli/releases/download/${GH_VERSION}/${GH_FILE}

RUN tar zxfp ${GH_FILE}

RUN cp -rfv  ./gh_1.0.0_linux_amd64/bin/gh /usr/local/bin/

RUN ls  /usr/local/bin/gh

ENTRYPOINT ["/usr/local/bin/gh"]
CMD ["--help"]