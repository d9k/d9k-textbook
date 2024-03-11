# CURL

## Pass JSON

- [How to pass payload via JSON file for curl? | SO](https://stackoverflow.com/questions/18611903/how-to-pass-payload-via-json-file-for-curl)

```bash
curl --verbose --request POST http://server/api/v1/places.json --data @testplace.json \
--header "Content-Type: application/json"
```

```bash
jq . ~/.json/payload-2022-03-03.json | curl https://api.com/route -H 'Content-Type: application/json' -d @-
```

```bash
curl -vX POST https://server/api/v1/places.json --data "
  auth_token=B8dsbz4HExMskqUa6Qhn& \
  place[name]=Fuelstation Central& \
  place[city]=Grossbeeren& \
  place[address]=Buschweg 1& \
  place[latitude]=52.3601& \
  place[longitude]=13.3332& \
  place[washing]=true& \
  place[founded_at_year]=2000& \
  place[products][]=diesel& \
  place[products][]=benzin \
"
```

## URL encode

`curl http://example.com/post --get --data-urlencode "title=Hello world`

- :speech_balloon: [bash - How to urlencode data for curl command? | SO](https://stackoverflow.com/questions/296536/how-to-urlencode-data-for-curl-command)