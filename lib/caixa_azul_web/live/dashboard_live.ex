defmodule CaixaAzulWeb.DashboardLive do
  use CaixaAzulWeb, :dashboard_live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
