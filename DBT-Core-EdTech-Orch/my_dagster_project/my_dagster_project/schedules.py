"""
To add a daily schedule that materializes your dbt assets, uncomment the following lines.
"""
from dagster_dbt import build_schedule_from_dbt_selection

from .assets import dbt_core_EdTech_dataflow_dbt_assets

schedules = [
    build_schedule_from_dbt_selection(
        [dbt_core_EdTech_dataflow_dbt_assets],
        job_name="materialize_dbt_models",
        cron_schedule="5 4 * * sun",
        dbt_select="fqn:*",
    ),
]