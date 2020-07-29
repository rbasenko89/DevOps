vault server -dev
echo -n "Starting Vault Dev server.... "
sleep 10s
echo -n "Exporting vault address and local variables... "
export VAULT_ADDR='http://127.0.0.1:8200'
export USER=postgres
export PASSWORD=password
sleep 5s 
echo -n "Writing secrets (postgres user and password) to Vault..."
sleep 5s
vault kv put secret/login USER=$USER
vault kv put secret/pass PASS=$PASSWORD
POSTGRES_USER=`vault kv get -field=USER secret/login`
export POSTGRES_USER
POSTGRES_PASSWORD=`vault kv get -field=PASS secret/pass`
export POSTGRES_PASSWORD
sed -i -e 's/user:password@DB/'$POSTGRES_USER':'$POSTGRES_PASSWORD'/g' myapp.js
echo "********SUCCESS***********"