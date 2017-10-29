defmodule PhoenixGraphqlApi.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixGraphqlApi.User


  schema "users" do
    field :email, :string
    field :username, :string
    
    has_many :posts, PhoenixGraphqlApi.Post

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :email])
    |> validate_required([:username, :email])
  end
end
