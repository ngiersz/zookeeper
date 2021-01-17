defmodule ZookeeperWeb.LayoutView do
  use ZookeeperWeb, :view
  import Zookeeper.Admin.Session, only: [current_user: 1, logged_in?: 1]
end
