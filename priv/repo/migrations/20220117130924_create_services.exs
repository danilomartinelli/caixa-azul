defmodule CaixaAzul.Repo.Migrations.CreateServices do
  use Ecto.Migration

  def change do
    create table(:services) do
      add :name, :string
      add :code, :string
      add :type, :string
      add :is_actived, :boolean, default: false, null: false
      add :sale_value, :decimal
      add :cost_value, :decimal
      add :municipal_service_code, :string
      add :complementary_law_code, :string

      timestamps()
    end

    create unique_index(:services, [:code])
  end
end
