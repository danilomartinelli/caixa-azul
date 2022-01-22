defmodule CaixaAzulWeb.Live.InitAssigns do
  import Phoenix.LiveView

  def on_mount(:private, _params, session, socket) do
    socket =
      socket
      |> CaixaAzulWeb.LiveHelpers.assign_current_user(session)
      |> assign(:breadcrumbs, [
        %{
          :path => "/dashboard",
          :name => "Dashboard"
        }
      ])

    {:cont, socket}
  end
end
