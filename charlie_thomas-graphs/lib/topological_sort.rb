require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  queue = vertices.select { |vertex| vertex.in_edges.empty? }
  sorted_vertices = []

  until queue.empty?
    vertex = queue.shift
    vertices.delete(vertex)
    vertex.out_edges.length.times do
      out_edge = vertex.out_edges[0]
      to_vertex = out_edge.to_vertex
      queue.push(to_vertex) if to_vertex.in_edges.length == 1
      out_edge.destroy!
    end

    sorted_vertices.push(vertex)
  end

  vertices.empty? ? sorted_vertices : []
end
