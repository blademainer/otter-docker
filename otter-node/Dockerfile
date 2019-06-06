FROM openjdk:11

RUN curl -s https://api.github.com/repos/alibaba/otter/releases/latest | grep "browser_download_url.*tar.gz" | grep -E "node.deployer.*.gz" | head -n 1 | cut -d : -f 2,3 | tr -d \" | wget -qi - \
    && tar -xvzf node.deployer-*.tar.gz -C otter-node \

