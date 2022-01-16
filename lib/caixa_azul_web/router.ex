defmodule CaixaAzulWeb.Router do
  use CaixaAzulWeb, :router

  import CaixaAzulWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {CaixaAzulWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CaixaAzulWeb do
    pipe_through :browser

    live "/", PageLive, :index
  end

  ## Authentication routes

  scope "/", CaixaAzulWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated, :put_session_layout]

    get "/users/register", UserRegistrationController, :new
    post "/users/register", UserRegistrationController, :create
    get "/users/log_in", UserSessionController, :new
    post "/users/log_in", UserSessionController, :create
    get "/users/reset_password", UserResetPasswordController, :new
    post "/users/reset_password", UserResetPasswordController, :create
    get "/users/reset_password/:token", UserResetPasswordController, :edit
    put "/users/reset_password/:token", UserResetPasswordController, :update
  end

  scope "/", CaixaAzulWeb do
    import Phoenix.LiveDashboard.Router

    pipe_through [:browser, :require_authenticated_user]

    live_dashboard "/_system/dashboard",
      metrics: CaixaAzulWeb.Telemetry,
      ecto_repos: [CaixaAzul.Repo]

    get "/users/settings", UserSettingsController, :edit
    put "/users/settings", UserSettingsController, :update
    get "/users/settings/confirm_email/:token", UserSettingsController, :confirm_email
    put "/users/settings/update_avatar", UserSettingsController, :update_avatar
  end

  scope "/", CaixaAzulWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete
    get "/users/confirm", UserConfirmationController, :new
    post "/users/confirm", UserConfirmationController, :create
    get "/users/confirm/:token", UserConfirmationController, :edit
    post "/users/confirm/:token", UserConfirmationController, :update
  end

  if Mix.env() == :dev do
    forward "/sent_emails", Bamboo.SentEmailViewerPlug
  end

  live_session :private, on_mount: {CaixaAzulWeb.Live.InitAssigns, :private} do
    scope "/", CaixaAzulWeb do
      pipe_through [:browser, :require_authenticated_user, :put_dashboard_layout]

      live "/dashboard", DashboardLive, :index
    end
  end
end
