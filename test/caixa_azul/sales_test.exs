defmodule CaixaAzul.SalesTest do
  use CaixaAzul.DataCase

  alias CaixaAzul.Sales

  describe "services" do
    alias CaixaAzul.Sales.Service

    import CaixaAzul.SalesFixtures

    @invalid_attrs %{code: nil, complementary_law_code: nil, cost_value: nil, is_actived: nil, municipal_service_code: nil, name: nil, sale_value: nil, type: nil}

    test "list_services/0 returns all services" do
      service = service_fixture()
      assert Sales.list_services() == [service]
    end

    test "get_service!/1 returns the service with given id" do
      service = service_fixture()
      assert Sales.get_service!(service.id) == service
    end

    test "create_service/1 with valid data creates a service" do
      valid_attrs = %{code: "some code", complementary_law_code: "some complementary_law_code", cost_value: "120.5", is_actived: true, municipal_service_code: "some municipal_service_code", name: "some name", sale_value: "120.5", type: :provided}

      assert {:ok, %Service{} = service} = Sales.create_service(valid_attrs)
      assert service.code == "some code"
      assert service.complementary_law_code == "some complementary_law_code"
      assert service.cost_value == Decimal.new("120.5")
      assert service.is_actived == true
      assert service.municipal_service_code == "some municipal_service_code"
      assert service.name == "some name"
      assert service.sale_value == Decimal.new("120.5")
      assert service.type == :provided
    end

    test "create_service/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_service(@invalid_attrs)
    end

    test "update_service/2 with valid data updates the service" do
      service = service_fixture()
      update_attrs = %{code: "some updated code", complementary_law_code: "some updated complementary_law_code", cost_value: "456.7", is_actived: false, municipal_service_code: "some updated municipal_service_code", name: "some updated name", sale_value: "456.7", type: :taken}

      assert {:ok, %Service{} = service} = Sales.update_service(service, update_attrs)
      assert service.code == "some updated code"
      assert service.complementary_law_code == "some updated complementary_law_code"
      assert service.cost_value == Decimal.new("456.7")
      assert service.is_actived == false
      assert service.municipal_service_code == "some updated municipal_service_code"
      assert service.name == "some updated name"
      assert service.sale_value == Decimal.new("456.7")
      assert service.type == :taken
    end

    test "update_service/2 with invalid data returns error changeset" do
      service = service_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_service(service, @invalid_attrs)
      assert service == Sales.get_service!(service.id)
    end

    test "delete_service/1 deletes the service" do
      service = service_fixture()
      assert {:ok, %Service{}} = Sales.delete_service(service)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_service!(service.id) end
    end

    test "change_service/1 returns a service changeset" do
      service = service_fixture()
      assert %Ecto.Changeset{} = Sales.change_service(service)
    end
  end
end
