defmodule CaixaAzul.Sales.Service do
  use Ecto.Schema
  import Ecto.Changeset

  schema "services" do
    field :code, :string
    field :complementary_law_code, :string
    field :cost_value, :decimal
    field :is_actived, :boolean, default: false
    field :municipal_service_code, :string
    field :name, :string
    field :sale_value, :decimal
    field :type, Ecto.Enum, values: [:provided, :taken, :both]

    timestamps()
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:name, :code, :type, :is_actived, :sale_value, :cost_value, :municipal_service_code, :complementary_law_code])
    |> validate_required([:name, :code, :type, :is_actived, :sale_value, :cost_value, :municipal_service_code, :complementary_law_code])
    |> unique_constraint(:code)
  end
end
