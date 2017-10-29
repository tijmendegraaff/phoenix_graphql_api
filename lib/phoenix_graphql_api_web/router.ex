defmodule PhoenixGraphqlApiWeb.Router do
  use PhoenixGraphqlApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixGraphqlApiWeb do
    pipe_through :api
  end
end
