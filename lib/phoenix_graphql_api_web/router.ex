defmodule PhoenixGraphqlApiWeb.Router do
  use PhoenixGraphqlApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixGraphqlApiWeb do
    pipe_through :api
  end
  
  scope "/" do
    forward "/api/graphql", Absinthe.Plug,
      schema: PhoenixGraphqlApiWeb.Schema
    
    forward "/api/graphiql", Absinthe.Plug.GraphiQL,
      schema: PhoenixGraphqlApiWeb.Schema,
      interface: :simple
  end
end
