class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :api_key, :email
end
