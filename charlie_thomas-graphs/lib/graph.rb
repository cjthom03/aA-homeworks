class Vertex
  attr_reader :value, :in_edges, :out_edges

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end

  def inspect
    "#{@value} - [In: #{@in_edges.join(", ")} / Out: #{@out_edges.join(", ")}]"
  end
end

class Edge
  attr_reader :from_vertex, :to_vertex, :cost

  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @cost = cost

    from_vertex.out_edges.push(self)
    to_vertex.in_edges.push(self)
  end

  def destroy!
    from_vertex.out_edges.delete(self)
    to_vertex.in_edges.delete(self)
    @from_vertex = nil
    @to_vertex = nil
  end

  def inspect
    "(To: #{@to_vertex.value} From: #{@from_vertex.value} Cost: #{@cost})"
  end

  def to_s
    "(To: #{@to_vertex.value} From: #{@from_vertex.value} Cost: #{@cost})"
  end

end
