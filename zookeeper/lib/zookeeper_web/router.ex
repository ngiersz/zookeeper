defmodule ZookeeperWeb.Router do
  use ZookeeperWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :admin_authentication do
    plug(ZookeeperWeb.Plug.AdminPlug)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", ZookeeperWeb do
    pipe_through([:browser, :admin_authentication])

    get("/", PageController, :index)

    get("/zwierze/:id", AnimalController, :show)

    post("/wiadomosc", MessageController, :new)

    resources("/admin/register", RegistrationController, only: [:create, :new])

    get("/admin/login", SessionController, :new)
    post("/admin/login", SessionController, :create)
    delete("/admin/logout", SessionController, :delete)
  end

  scope "/admin", ZookeeperWeb do
    pipe_through(:admin_authentication)

    get("/messages", AdminController, :messages)

    get("/animals", AdminController, :animals)

    post("/animals/new", AdminController, :create_animal)
    get("/animals/new", AdminController, :add_animal)

    delete("/animals", AdminController, :delete_animal)

    get("/animals/edit", AdminController, :edit_animal_form)
    put("/animals/edit", AdminController, :update_animal)
  end
end
