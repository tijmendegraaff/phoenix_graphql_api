defmodule PhoenixGraphqlApiWeb.Router do
  use PhoenixGraphqlApiWeb, :router

  # pipeline :api do
  #   plug :accepts, ["json"]
  # end

  pipeline :graphql do
    # plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    # plug Guardian.Plug.LoadResource
    # plug PhoenixGraphqlApiWeb.Context
  end

  scope "/api" do
    pipe_through :graphql
    forward "/", Absinthe.Plug,
      schema: PhoenixGraphqlApiWeb.Schema
  end

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: PhoenixGraphqlApiWeb.Schema
  
  
  # scope "/" do
  #   forward "/api/graphql", Absinthe.Plug,
  #     schema: PhoenixGraphqlApiWeb.Schema
    
  #   forward "/api/graphiql", Absinthe.Plug.GraphiQL,
  #     schema: PhoenixGraphqlApiWeb.Schema,
  #     interface: :simple
  # end
end
