class DummyjsonService
  include HTTParty
  base_uri "dummyjson.com"
  attr_reader :limit, :resource, :skip

  def initialize(limit = 0, skip = 0, resource = "users")
    @limit = limit
    @skip = skip
    @resource = resource 
  end

  def call
    response = self.class.get("/#{resource}?limit=#{limit}&skip=#{skip}&select=firstName,lastName,email,phone")
    # TODO: Handle invalid response
    response.parsed_response
  end
end
