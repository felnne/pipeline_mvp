# Run from root of repository

docker run --name local-airflow-server \
           -e AIRFLOW__WEBSERVER__RELOAD_ON_PLUGIN_CHANGE=True \
           -e AIRFLOW__CORE__DAGS_ARE_PAUSED_AT_CREATION=False \
           -e ENVIRONMENT=LOCAL \
           -d \
           -p 8080:8080 \
           -v $(pwd)/plugins/:/usr/local/airflow/plugins \
           -v $(pwd)/data/:/opt/data \
           -v $(pwd)/dags/:/usr/local/airflow/dags \
           docker-airflow-custom webserver

# Accessible on localhost:8080
