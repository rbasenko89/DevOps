pkill vault
rm  -rf  *.zip.* *.zip

curl -L https://releases.hashicorp.com/vault/1.5.0-rc/vault_1.5.0-rc_linux_amd64.zip > /dev/null

unzip vault_1.5.0-rc_linux_amd64.zip	

sudo mv vault /bin/

/bin/vault server -dev > vault.log &

Unseal_Key=$(egrep -i "Unseal Key:" ~/vault.log)
Root_Token=$(egrep -i "Root Token:" ~/vault.log)

echo $Unseal_Key
echo $Root_Token
export VAULT_ADDR='http://127.0.0.1:8200'
echo $VAULT_ADDR

sleep 5

echo -e " \n"

/bin/vault status


echo -e " \n"

export USER=postgres
export PASSWORD=`openssl rand -base64 32`

vault kv put secret/login USER=$USER
vault kv put secret/pass PASS=$PASSWORD

POSTGRES_USER=`vault kv get -field=USER secret/login`
export POSTGRES_USER

POSTGRES_PASSWORD=`vault kv get -field=PASS secret/pass`
export POSTGRES_PASSWORD

echo -e " \n"

docker-compose up -d

echo -e " \n"

docker ps

echo -e " \n"

docker exec -t  -i db bash -c "env | egrep --color=always 'POSTGRES_USER|POSTGRES_PASSWORD'"

echo -e " \n"
