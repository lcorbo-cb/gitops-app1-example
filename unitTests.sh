Test01=$(hadolint --version)
Expect01="Haskell Dockerfile Linter 1.17.2-no-git"
if [ $Test01 -ne $Expect01 ]; then  exit 1
