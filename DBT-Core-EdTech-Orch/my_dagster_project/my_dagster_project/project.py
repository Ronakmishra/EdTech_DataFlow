from pathlib import Path

from dagster_dbt import DbtProject

dbt_core_EdTech_dataflow_project = DbtProject(
    project_dir=Path(__file__).joinpath("..", "..", "..", "dbt_core_EdTech_dataflow").resolve(),
    packaged_project_dir=Path(__file__).joinpath("..", "..", "dbt-project").resolve(),
)
dbt_core_EdTech_dataflow_project.prepare_if_dev()