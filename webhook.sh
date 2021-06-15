curl -X POST \
     --cacert ../sh_secrets_ps/certs/ca/ca.pem \
     -H "Content-Type: application/json" \
     -H "x-hub-signature:a9e49ad0fa18bfe6e8d548e739f30cb0ff7b4c3ac24753f8399551613d2f1237" \
     -d @hook.json \
     --user admin:welcome \
    --write-out "%{http_code}" \
     https://cbci.cloudbees.demo/cjoc/webhooks/g1JFWIW/	
