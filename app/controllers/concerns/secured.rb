module Secured
    def authenticate_user!
        # Bearer xxxxx
        token_regex = /Bearer (\w+)/
        # leer HEADER de auth
        headers = request.headers
        # verificar que sea valido
        #binding.break
        if headers['Authorization'].present? && headers['Authorization'].match(token_regex)
          token = headers['Authorization'].match(token_regex)[1]
        end
        # debemos verificar que el token corresponda a un user
        if (Current.user = User.find_by_auth_token(token))
          return 
        end

        render json: {error: 'Unauthorized'}, status: :unauthorized
      end
end