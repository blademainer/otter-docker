FROM openjdk:11

ADD docker-entrypoint.sh /usr/bin/
RUN cd /tmp && curl -s https://api.github.com/repos/alibaba/otter/releases/latest | grep "browser_download_url.*tar.gz" | grep -E "node.deployer.*.gz" | head -n 1 | cut -d : -f 2,3 | tr -d \" | wget -qi - \
    && mkdir -p otter-node && tar -xvzf node.deployer-*.tar.gz -C otter-node && mv otter-node /usr/local/ \
    && chmod +x /usr/bin/docker-entrypoint.sh

WORKDIR /usr/local/otter-node

ENTRYPOINT ['/usr/bin/docker-entrypoint.sh']
