defmodule CaixaAzulWeb.LiveHelpers do
  import Phoenix.LiveView

  alias CaixaAzul.Accounts

  def assign_current_user(socket, session) do
    if session["user_token"] do
      assign_new(
        socket,
        :current_user,
        fn ->
          Accounts.get_user_by_session_token(session["user_token"])
        end
      )
    else
      assign_new(
        socket,
        :current_user,
        fn ->
          nil
        end
      )
    end
  end
end
