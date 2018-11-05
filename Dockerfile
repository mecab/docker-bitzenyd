FROM debian:9-slim AS downloader
LABEL maintainer "mecab <mecab@misosi.ru>"

RUN apt-get update && \
    apt-get install -y curl && \
    curl -L -O https://github.com/BitzenyCoreDevelopers/bitzeny/releases/download/z2.0.2/bitzeny-2.0.2-x86_64-linux-gnu.tar.gz && \
    echo 'd7dcc51fc60abee2b1f3befa0265ddf40e7d38a2266af94c14242db121b98d41  bitzeny-2.0.2-x86_64-linux-gnu.tar.gz' | sha256sum -c && \
    tar -zxvf bitzeny-2.0.2-x86_64-linux-gnu.tar.gz

FROM debian:9-slim
COPY --from=downloader /bitzeny-2.0.2 /
ENTRYPOINT ["/bin/bitzenyd"]
