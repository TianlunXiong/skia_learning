#! /usr/bin/env bash

# 获取 ninja
./skia/bin/fetch-ninja

# 设置 ninja 路径
NINJA_PATH=$(cd skia/third_party/ninja;pwd);

export PATH=$PATH:$NINJA_PATH

(
  cd skia;
  python tools/git-sync-deps;
  bin/fetch-ninja;
)

(
  cd skia;
  bin/gn gen out/Release  --args='is_debug=false';
)

(
  cd skia;
  ninja -C out/Release;
)
