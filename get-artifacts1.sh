tok=$(cat token.sh)

jq '.artifact[].id' gh1.json>liste_id

mkdir -p out/
for a in $(cat liste_id)
do
    echo "requete $a"
curl -L \
   -H "Accept: application/vnd.github+json" \
   -H "Authorization: Bearer $tok" \
   -H "X-GitHub-Api-Version: 2022-11-28" \
   --output out/$a
   https://api.github.com/repos/stemagoult/graphes/actions/artifacts/$a/zip
done
