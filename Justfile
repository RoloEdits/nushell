default: build

build:
    export RUSTFLAGS="-C target-cpu=native -C linker=clang -C link-arg=-fuse-ld=lld -C link-args=-Wl,--icf=all -C linker-plugin-lto"
    export CC="clang"
    export CFLAGS="-march=native -flto"
    export CXX="clang++"
    export CXXFLAGS="-march=native -flto"
    cargo build --release --all

install:
    cp -f target/release/nu ~/.local/opt/nu/nu
    cp -f target/release/nu_plugin_polars ~/.local/opt/nu/nu_plugin_polars
    cp -f target/release/nu_plugin_query ~/.local/opt/nu/nu_plugin_query
