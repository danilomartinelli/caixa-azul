defmodule CaixaAzul.Repo do
  use Ecto.Repo,
    otp_app: :caixa_azul,
    adapter: Ecto.Adapters.Postgres
end
