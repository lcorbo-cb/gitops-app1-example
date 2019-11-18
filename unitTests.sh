Test01=$(hadolint --version)
Expect01="Haskell Dockerfile Linter 1.17.2-no-git"
#if [ $Test01 -ne $Expect01 ]; then
  echo "Test failed Expected: $Expect01"
  echo "Recieved: $Test01"
#  exit 1
#fi
