FROM openjdk:11

RUN cd /tmp && curl -s https://api.github.com/repos/alibaba/otter/releases/latest | grep "browser_download_url.*tar.gz" | grep -E "manager.deployer.*.gz" | head -n 1 | cut -d : -f 2,3 | tr -d \" | wget -qi - \
    && mkdir -p otter-manager && tar -xvzf manager.deployer-*.tar.gz -C otter-manager && mv otter-manager /usr/local/

WORKDIR /usr/local/otter-manager

ADD docker-entrypoint.sh .

RUN chmod +x docker-entrypoint.sh

CMD ["./docker-entrypoint.sh"]