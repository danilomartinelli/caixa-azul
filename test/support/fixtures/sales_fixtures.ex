defmodule CaixaAzul.SalesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CaixaAzul.Sales` context.
  """

  @doc """
  Generate a unique service code.
  """
  def unique_service_code, do: "some code#{System.unique_integer([:positive])}"

  @doc """
  Generate a service.
  """
  def service_fixture(attrs \\ %{}) do
    {:ok, service} =
      attrs
      |> Enum.into(%{
        code: unique_service_code(),
        complementary_law_code: "some complementary_law_code",
        cost_value: "120.5",
        is_actived: true,
        municipal_service_code: "some municipal_service_code",
        name: "some name",
        sale_value: "120.5",
        type: :provided
      })
      |> CaixaAzul.Sales.create_service()

    service
  end
end
