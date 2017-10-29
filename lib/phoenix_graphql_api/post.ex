defmodule PhoenixGraphqlApi.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixGraphqlApi.Post


  schema "posts" do
    field :body, :string
    field :title, :string

    belongs_to :user, PhoenixGraphqlApi.User

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :body, :user_id])
    |> validate_required([:title, :body, :user_id])
  end
end
