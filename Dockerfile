FROM keydonix/parity-instantseal

# Lifted from: https://github.com/nodejs/docker-node/blob/master/8/Dockerfile
RUN groupadd --gid 1000 node \
  && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

ENV NODE_VERSION=8.11.2 \
  YARN_VERSION=1.7.0 \
  ARCH=x64

COPY node-v$NODE_VERSION-linux-$ARCH.tar.xz .
RUN tar -xJf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
  && rm "node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs


COPY yarn-v$YARN_VERSION.tar.gz .
RUN mkdir -p /opt \
  && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg

# docker image build -t keydonix/parity-instantseal-node8 .
