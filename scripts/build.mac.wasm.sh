#!/usr/bin/env bash

# MacOS 一键编译脚本

# 设置 ninja 路径
PROJECT_PATH=$(pwd);

# 获取 ninja
./skia/bin/fetch-ninja

# 设置 ninja 路径
NINJA_PATH=$(cd skia/third_party/ninja;pwd);

export PATH=$PATH:$NINJA_PATH

SEP="$0 >>>>>> "

echo "${SEP} ninja版本: $(ninja --version)"

echo "${SEP} python版本: $(python --version)"

echo "${SEP} 同步依赖 start."

(cd "${PROJECT_PATH}/skia" && python "tools/git-sync-deps")

echo "${SEP} 同步依赖 done."

echo "${SEP} emsdk 初始化 start"
(
  cd "${PROJECT_PATH}/emsdk";
  ./emsdk install latest;
  ./emsdk activate latest;
  source ./emsdk_env.sh;
)

echo "${SEP} emsdk 初始化 done"

echo "${SEP} canvaskit wasm 编译 start"

(
  cd "${PROJECT_PATH}/skia";
  ./modules/canvaskit/compile.sh $@
)

echo "${SEP} canvaskit wasm 编译 done"