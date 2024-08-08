if [ $(docker --context calculator-web-app ps -f name=blue -f health=healthy -q) ];
then
  ENV="green";
  OLD="blue";
else
  ENV="blue";
  OLD="green";
fi

echo "Starting "$ENV" container"
docker-compose --context calculator-web-app pull $ENV
docker-compose --context calculator-web-app up -d --force-recreate $ENV

echo "Waiting..."
until [ $(docker --context calculator-web-app ps -f name=$ENV -f health=healthy -q) ];
do
  sleep 1;
done;

echo "Stopping "$OLD" container"
docker-compose --context calculator-web-app stop $OLD
