curl -X POST \
     -H "Content-Type: application/json" \
     -H "x-hub=signature:" \
     --cacert ../sh_secrets_ps/certs/ca/ca.pem \
     -d @hook.json \
     https://cbci.cloudbees.demo/cjoc/webhooks/HzZDDvY/
