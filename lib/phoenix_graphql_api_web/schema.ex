defmodule PhoenixGraphqlApiWeb.Schema do
    use Absinthe.Schema

    alias PhoenixGraphqlApiWeb.PostResolver
    alias PhoenixGraphqlApiWeb.UserResolver

    import_types PhoenixGraphqlApiWeb.Schema.UserTypes
    import_types PhoenixGraphqlApiWeb.Schema.PostTypes
    import_types PhoenixGraphqlApiWeb.Schema.SessionTypes

    

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

    input_object :update_post_params do
        field :title, non_null(:string)
        field :body, non_null(:string)
        field :user_id, non_null(:integer)
    end

    input_object :update_user_params do
        field :username, :string
        field :email, :string
        field :password, :string
    end

    mutation do
        field :login, type: :session do
            arg :email, non_null(:string)
            arg :password, non_null(:string)
            
            resolve &UserResolver.login/2
        end

        field :update_user, type: :user do
            arg :id, non_null(:integer)
            arg :user, :update_user_params
         
            resolve &UserResolver.update/2
        end

        field :create_post, type: :post do
            arg :title, non_null(:string)
            arg :body, non_null(:string)
            arg :user_id, non_null(:integer)
            
            resolve &PostResolver.create/2
        end

        field :update_post, type: :post do
            arg :id, non_null(:integer)
            arg :post, :update_post_params
         
            resolve &PostResolver.update/2
        end

        field :delete_post, type: :post do
            arg :id, non_null(:integer)
         
            resolve &PostResolver.delete/2
        end
    end

end