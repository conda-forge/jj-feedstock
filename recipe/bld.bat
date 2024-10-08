:: check licenses
cargo-bundle-licenses ^
    --format yaml ^
    --output THIRDPARTY.yml || goto :error

:: build statically linked binary with Rust
cargo install --no-track --locked --root %LIBRARY_PREFIX% --bin jj --path cli || goto :error

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
