Test01=$(hadolint --version)

Expect01="Haskell Dockerfile Linter v1.17.2-20-ge2f77c5"
if [ $Test01 != $Expect01 ]; then
  echo "Test failed Expected: $Expect01"
  echo "Recieved: $Test01"
  exit 1
fi
