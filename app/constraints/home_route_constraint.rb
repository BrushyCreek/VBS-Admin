class HomeRouteConstraint
  def initialize(&block)
    @block = block || lambda { |time| true }
  end

  def matches?(request)
    @block.call(Time.now)
  end
end
