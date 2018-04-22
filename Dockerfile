FROM debian:9-slim AS downloader
LABEL maintainer "mecab <mecab@misosi.ru>"

RUN apt-get update && \
    apt-get install -y curl && \
    curl -L -O https://github.com/BitzenyCoreDevelopers/bitzeny/releases/download/z2.0.1/bitzeny-2.0.1-x86_64-linux-gnu.tar.gz && \
    echo '9e7658df07b2ad7e114bbcd573676db90441f778c4ed3b5aefe0d4808707e9f9  bitzeny-2.0.1-x86_64-linux-gnu.tar.gz' | sha256sum -c && \
    tar -zxvf bitzeny-2.0.1-x86_64-linux-gnu.tar.gz

FROM debian:9-slim
COPY --from=downloader /bitzeny-2.0.1 /
ENTRYPOINT ["/bin/bitzenyd"]
