# docker-bitzenyd
Dockerfile for BitZeny (https://github.com/BitzenyCoreDevelopers/bitzeny)

# Example Usage

## Starting BitZeny Core
```
$ docker run -it -v $(pwd)/data:/data -p 9253:9253 --name=bitzenyd mecab/bitzenyd
```

## Interacting with the Daemon
```
$ docker exec bitzenyd bitzeny-cli -datadir=/data getinfo
```

# Data Persistent
You should persist your data, which is normally (if without container) created as `~/.bitzeny`, by specify `-v` option to map host directory to `datadir` inside the container (e.g., `-v $(pwd)/data:/data`).
Note we pass `-datadir=/data` by default, but if you override the arguments you will need to add it manually.
 (e.g. `docker run -it -v $(pwd)/data:/data mecab/bitzenyd -datadir=/data -testnet=3`)

Do persist. Not to persist means not to persist your wallet. If you didn't persist your data, your wallet is saved on somewhere deeper [^1] in your disk and will be removed when you remove the container.

[^1]: If you know where it is, you are not Docker beginner, no need to explain.


