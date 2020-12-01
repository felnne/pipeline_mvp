from airflow import DAG
from airflow.operators import BashOperator
from datetime import datetime, timedelta

from airflow.operators.pipeline_plugin import HDXExtractOperator, Adm0Operator


def create_adm0_dag(country, geo_extent, config, default_args):
    dag = DAG(country, default_args=default_args)
    hdx_extract = HDXExtractOperator(
        task_id=f"{country}_extract",
        country=country,
        dag=dag
    )

    adm0_transform = Adm0Operator(
        task_id=f"{country}_transform",
        country=country,
        dag=dag
    )

    hdx_extract >> adm0_transform
    return dag
