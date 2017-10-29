defmodule PhoenixGraphqlApi.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixGraphqlApi.User


  schema "users" do
    field :email, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    
    has_many :posts, PhoenixGraphqlApi.Post

    timestamps()
  end

  @doc false
  # def changeset(%User{} = user, attrs) do
  #   user
  #   |> cast(attrs, [:username, :email])
  #   |> validate_required([:username, :email])
  # end

  def update_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :email], [:password])
    |> validate_required([:username, :email])
    |> put_pass_hash()
  end
 
  def registration_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :email, :password])
    |> validate_required([:username, :email, :password])
    |> put_pass_hash()
  end
 
  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
