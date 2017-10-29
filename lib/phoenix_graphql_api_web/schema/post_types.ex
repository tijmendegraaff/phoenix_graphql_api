defmodule PhoenixGraphqlApiWeb.Schema.PostTypes do
    use Absinthe.Schema.Notation
    use Absinthe.Ecto, repo: PhoenixGraphqlApi.Repo

    object :post do
        field :id, :id
        field :title, :string
        field :body, :string
        field :user, :user, resolve: assoc(:user)
    end
end