#!/usr/bin/env sh

set -ex

compiler_root=src/compiler

PATH=$PATH:$compiler_root

# we need this for bootstrapping
protoc -I$compiler_root $compiler_root/google/protobuf/{,objectivec-}descriptor.proto --cpp_out=$compiler_root

# build the objc generator
scripts/build.sh

# compile the objc descriptors into the runtime library
protoc -I$compiler_root $compiler_root/google/protobuf/{,objectivec-}descriptor.proto --lobjc_out=src/runtime/Classes/
protoc -I$compiler_root $compiler_root/google/protobuf/api.proto --lobjc_out=src/runtime/Classes/
protoc -I$compiler_root $compiler_root/google/protobuf/any.proto --lobjc_out=src/runtime/Classes/
# protoc -I$compiler_root $compiler_root/google/protobuf/duration.proto --lobjc_out=src/runtime/Classes/
protoc -I$compiler_root $compiler_root/google/protobuf/empty.proto --lobjc_out=src/runtime/Classes/
protoc -I$compiler_root $compiler_root/google/protobuf/field_mask.proto --lobjc_out=src/runtime/Classes/
protoc -I$compiler_root $compiler_root/google/protobuf/source_context.proto --lobjc_out=src/runtime/Classes/
protoc -I$compiler_root $compiler_root/google/protobuf/struct.proto --lobjc_out=src/runtime/Classes/
protoc -I$compiler_root $compiler_root/google/protobuf/timestamp.proto --lobjc_out=src/runtime/Classes/
protoc -I$compiler_root $compiler_root/google/protobuf/type.proto --lobjc_out=src/runtime/Classes/
protoc -I$compiler_root $compiler_root/google/protobuf/wrappers.proto --lobjc_out=src/runtime/Classes/
