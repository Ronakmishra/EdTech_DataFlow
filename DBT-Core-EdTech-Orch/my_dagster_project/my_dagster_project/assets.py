from dagster import AssetExecutionContext
from dagster_dbt import DbtCliResource, dbt_assets

from .project import dbt_core_EdTech_dataflow_project


@dbt_assets(manifest=dbt_core_EdTech_dataflow_project.manifest_path)
def dbt_core_EdTech_dataflow_dbt_assets(context: AssetExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream()
    