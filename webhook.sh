curl -X POST \
     --cacert ../sh_secrets_ps/certs/ca/ca.pem \
     -H "Content-Type: application/json" \
     -H "x-hub-signature:4e75e597d118b9c57823f85143a49e63e1701a1f88134be7e0b7698e79eba562" \
     -d @hook.json \
     https://cbci.cloudbees.demo/cjoc/webhooks/HzZDDvY/
