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

    post("wiadomosc", MessageController, :new)

    get("/admin/animals", AdminController, :animals)
    get("/admin/animals/new", AdminController, :add_animal)
    post("/admin/animals/new", AdminController, :create_animal)
    delete("/admin/animals", AdminController, :delete_animal)

    resources("/admin/register", RegistrationController, only: [:create, :new])

    get("/admin/login", SessionController, :new)
    post("/admin/login", SessionController, :create)
    delete("/admin/logout", SessionController, :delete)
  end
end
