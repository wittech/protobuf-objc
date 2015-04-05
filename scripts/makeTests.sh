#!/usr/bin/env sh

set -ex

compiler_root=src/compiler

PATH=$PATH:$compiler_root

# compile the unit tests into the runtime library's fixture directory
protoc -I$compiler_root $compiler_root/google/protobuf/unittest*.proto --objc_out=src/runtime/Tests/
