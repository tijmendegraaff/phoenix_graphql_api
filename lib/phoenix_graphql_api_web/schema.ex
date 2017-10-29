defmodule PhoenixGraphqlApiWeb.Schema do
    use Absinthe.Schema

    alias PhoenixGraphqlApiWeb.PostResolver
    alias PhoenixGraphqlApiWeb.UserResolver

    import_types PhoenixGraphqlApiWeb.Schema.UserTypes
    import_types PhoenixGraphqlApiWeb.Schema.PostTypes

    

    query do
        field :posts, list_of(:post) do
            resolve &PostResolver.all/2
        end

        field :post, type: :post do
            arg :id, non_null(:id)
            resolve &PostResolver.find/2
        end
    
        field :users, list_of(:user) do
            resolve &UserResolver.all/2
        end

        field :user, type: :user do
            arg :id, non_null(:id)
            resolve &UserResolver.find/2
        end
    end

    mutation do
        field :create_post, type: :post do
            arg :title, non_null(:string)
            arg :body, non_null(:string)
            arg :user_id, non_null(:integer)
            
            resolve &PostResolver.create/2
        end
    end
end