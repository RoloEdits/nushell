set windows-shell := ["nu", "-c"]

default: build

build:
	RUSTFLAGS='-C target-cpu=native' cargo build --release --bin nu

# `nu.exe` can't be replaced if still open and `Program Files` needs admin privilege.
# Currently broken: need to use `gsudo` to elevate to admin but doesn't seem to work correctly. 
[windows]
install:
	mkdir "C:/Program Files/nu/bin"
	pwsh -c cp {{justfile_directory()}}/target/release/nu.exe -Destination 'C:\Program Files\nu\bin\nu.exe'
	cp target/release/nu_plugin_custom_values.exe "C:/Program Files/nu/bin/nu_plugin_custom_values.exe"
	cp target/release/nu_plugin_example.exe "C:/Program Files/nu/bin/nu_plugin_example.exe"
	cp target/release/nu_plugin_formats.exe "C:/Program Files/nu/bin/nu_plugin_formats.exe"
	cp target/release/nu_plugin_gstat.exe "C:/Program Files/nu/bin/nu_plugin_gstat.exe"
	cp target/release/nu_plugin_inc.exe "C:/Program Files/nu/bin/nu_plugin_inc.exe"
	cp target/release/nu_plugin_query.exe "C:/Program Files/nu/bin/nu_plugin_query.exe"
	cp target/release/utils.exe "C:/Program Files/nu/bin/utils.exe"

clean:
	rm -r target/
