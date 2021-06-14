class BackgroundSerializer
  include JSONAPI::Serializer

  attributes :image
  set_type :image
end
