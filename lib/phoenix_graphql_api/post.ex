defmodule PhoenixGraphqlApi.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixGraphqlApi.Post


  schema "posts" do
    field :body, :string
    field :title, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
