defmodule CaixaAzulWeb.Live.InitAssigns do
  import Phoenix.LiveView

  def on_mount(:private, _params, session, socket) do
    {:cont, CaixaAzulWeb.LiveHelpers.assign_current_user(socket, session)}
  end
end
