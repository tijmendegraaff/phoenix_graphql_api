defmodule PhoenixGraphqlApi.Guardian do
    use Guardian, otp_app: :phoenix_graphql_api
  
    def subject_for_token(resource, _claims) do
      {:ok, to_string(resource.id)}
    end
  
    def subject_for_token(_, _) do
      {:error, :reason_for_error}
    end
  
    def resource_from_claims(claims) do
    #   {:ok, find_me_a_resource(claims["sub"])}
        case PhoenixGraphqlApi.Repo.get(PhoenixGraphqlApiWeb.Schema.UserTypes, claims["sub"]) do
            nil -> {:error, "user not found"}
            user -> {:ok, user}
        end
    end
    def resource_from_claims(_claims) do
      {:error, :reason_for_error}
    end
end