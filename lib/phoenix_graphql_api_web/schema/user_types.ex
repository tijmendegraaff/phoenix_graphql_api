defmodule PhoenixGraphqlApiWeb.Schema.UserTypes do
    use Absinthe.Schema.Notation
    use Absinthe.Ecto, repo: PhoenixGraphqlApi.Repo

    object :user do
        field :id, :id
        field :username, :string
        field :email, :string
        field :posts, list_of(:post), resolve: assoc(:posts)
    end
end