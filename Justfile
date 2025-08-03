default: build

flags := "-march=native -O3 -flto -fuse-ld=lld"

export CC := "clang"
export CXX := "clang++"
export CFLAGS := flags
export CXXFLAGS := flags
export RUSTFLAGS := "-Ctarget-cpu=native -Clinker=clang -Clink-arg=-fuse-ld=lld -Clinker-plugin-lto -Clink-args=-Wl,--icf=all"

build:
   cargo build --release --bin nu --features=full
   # cargo +nightly build --release --all --features=full -Zbuild-std

install:
    cp -f target/release/nu ~/.local/opt/nu/nu
    cp -f target/release/nu_plugin_polars ~/.local/opt/nu/nu_plugin_polars
    cp -f target/release/nu_plugin_query ~/.local/opt/nu/nu_plugin_query
