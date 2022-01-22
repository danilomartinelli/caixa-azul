defmodule CaixaAzulWeb.ServicesLive do
  use CaixaAzulWeb, :dashboard_live_view

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> update(
        :breadcrumbs,
        &(&1 ++
            [
              %{
                :path => "/dashboard/services",
                :name => "Serviços"
              }
            ])
      )

    {:ok, socket}
  end
end
