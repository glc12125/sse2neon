# Please run this file in docker docker pull robok/dev_build:ubuntu16.04
echo "Cross compiling robok reconstruction ..."
if [ -d build_cross ]; then
  rm -rf build_cross
fi
if [ "$1" = "deploy" ]; then
	ToolchainCmakeFile="../aarch64_glibc_deploy.cmake"
else
	ToolchainCmakeFile="../aarch64_glibc.cmake"
fi
mkdir build_cross
cd build_cross
cmake -DCMAKE_TOOLCHAIN_FILE=${ToolchainCmakeFile} -DCMAKE_BUILD_TYPE=Release ..
getCoreNumCmd="getconf _NPROCESSORS_ONLN"
coreNum=eval ${getCoreNumCmd}
echo "Number of cores: ${coreNum}"
make -j${coreNum}
