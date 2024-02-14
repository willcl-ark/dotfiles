function install_clang16

# LLVM
sudo apt-get install libllvm-16-ocaml-dev libllvm16 llvm-16 llvm-16-dev llvm-16-doc llvm-16-examples llvm-16-runtime
# Clang and co
sudo apt-get install clang-16 clang-tools-16 clang-16-doc libclang-common-16-dev libclang-16-dev libclang1-16 clang-format-16 python3-clang-16 clangd-16 clang-tidy-16
# compiler-rt
sudo apt-get install libclang-rt-16-dev
# polly
sudo apt-get install libpolly-16-dev
# libfuzzer
sudo apt-get install libfuzzer-16-dev
# lldb
sudo apt-get install lldb-16
# lld (linker)
sudo apt-get install lld-16
# libc++
sudo apt-get install libc++-16-dev libc++abi-16-dev
# OpenMP
sudo apt-get install libomp-16-dev
# libclc
sudo apt-get install libclc-16-dev
# libunwind
sudo apt-get install libunwind-16-dev
# mlir
sudo apt-get install libmlir-16-dev mlir-16-tools
# bolt
sudo apt-get install libbolt-16-dev bolt-16
# flang
sudo apt-get install flang-16
# wasm support
sudo apt-get install libclang-rt-16-dev-wasm32 libclang-rt-16-dev-wasm64 libc++-16-dev-wasm32 libc++abi-16-dev-wasm32 libclang-rt-16-dev-wasm32 libclang-rt-16-dev-wasm64

# configure update-alternatives to use new clang
# set clang++ and other as slaves of clang so we only need 
# to update one in the future
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-16 81 --slave /usr/bin/clang++ clang++ /usr/bin/clang++-16 --slave /usr/share/man/man1/clang.1.gz clang.1.gz /usr/share/man/man1/clang-16.1.gz --slave /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-16 --slave /usr/bin/clang-format clang-format /usr/bin/clang-format-16 --slave /usr/bin/clang-format-diff clang-format-diff /usr/bin/clang-format-diff-16 --slave /usr/bin/clang-tidy-diff clang-tidy-diff /usr/bin/clang-tidy-diff-16.py

end
