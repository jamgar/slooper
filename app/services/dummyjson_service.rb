class DummyjsonService
  include HTTParty
  base_uri "dummyjson.com"

  def initialize(limit = 0, skip =0, resource = "users")
    @limit = limit
    @skip = skip
    @resource = resource 
  end

  def call
    response = self.class.get("/#{@resource}?limit=#{@limit}&skip=#{@skip}")
    response.parsed_response
  end
end
