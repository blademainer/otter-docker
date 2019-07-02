FROM centos:7

RUN cd /tmp && yum install -y mysql-client java-1.8.0-openjdk-devel wget curl && curl -s https://api.github.com/repos/alibaba/otter/releases/latest | grep "browser_download_url.*tar.gz" | grep -E "manager.deployer.*.gz" | head -n 1 | cut -d : -f 2,3 | tr -d \" | wget -qi - \
    && mkdir -p otter-manager && tar -xvzf manager.deployer-*.tar.gz -C otter-manager && mv otter-manager /usr/local/

WORKDIR /usr/local/otter-manager

ADD docker-entrypoint.sh .

RUN chmod +x docker-entrypoint.sh

CMD ["./docker-entrypoint.sh"]

