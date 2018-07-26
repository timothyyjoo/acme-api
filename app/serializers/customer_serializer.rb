class CustomerSerializer < ActiveModel::Serializer
  attributes :id,
             :first_name,
             :last_name,
             :address,
             :city,
             :state,
             :zip,
             :token
end
