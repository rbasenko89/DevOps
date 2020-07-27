pkill vault
rm  -rf vault *.zip.* *.zip

curl https://releases.hashicorp.com/vault/1.5.0-rc/vault_1.5.0-rc_linux_amd64.zip --output vault.zip

unzip vault.zip

$PWD/vault server -dev > vault.log &

sleep 10

echo -e " \n"

Unseal_Key=$(egrep -i --color=always "Unseal Key:" $PWD/vault.log)
Root_Token=$(egrep -i --color=always "Root Token:" $PWD/vault.log)

echo $Unseal_Key
echo $Root_Token

echo -e " \n"

export VAULT_ADDR='http://127.0.0.1:8200'
echo VAULT ADDRESS=$VAULT_ADDR

sleep 5

echo -e " \n"

$PWD/vault status


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
