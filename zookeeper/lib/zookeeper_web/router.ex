defmodule ZookeeperWeb.Router do
  use ZookeeperWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", ZookeeperWeb do
    pipe_through(:browser)

    get("/", PageController, :index)

    get("zwierze/:id", AnimalController, :show)
  end

  # Other scopes may use custom stacks.
  # scope "/api", ZookeeperWeb do
  #   pipe_through :api
  # end
end
