#!/usr/bin/env sh

set -ex

compiler_root=src/compiler

PATH=$PATH:$compiler_root

# we need this for bootstrapping
protoc -I$compiler_root $compiler_root/google/protobuf/{,objectivec-}descriptor.proto --cpp_out=$compiler_root

# build the objc generator
scripts/build.sh

# compile the objc descriptors into the runtime library
protoc -I$compiler_root $compiler_root/google/protobuf/{,objectivec-}descriptor.proto --objc_out=src/runtime/Classes/
