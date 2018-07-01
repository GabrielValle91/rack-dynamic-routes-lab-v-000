class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_search = req.path.split("/items/")
      if @@items.include?(item_search)

      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
    end

    resp.finish
  end
end
