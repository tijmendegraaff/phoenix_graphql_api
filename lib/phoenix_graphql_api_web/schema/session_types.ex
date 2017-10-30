defmodule PhoenixGraphqlApiWeb.Schema.SessionTypes do
    use Absinthe.Schema.Notation
    use Absinthe.Ecto, repo: PhoenixGraphqlApi.Repo

    object :session do
        field :token, :string
    end
end