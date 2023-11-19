set shell := ["nu", "-c"]

default: build

build:
    RUSTFLAGS="-C target-cpu=native -C linker=lld-link -C link-arg=-stack:10000000 -C link-args=-Wl,--icf=all -C target-feature=+crt-static" CC="clang-cl" CXX="clang-cl" CXXFLAGS="-march=native" CFLAGS="-march=native" cargo build --release --all
