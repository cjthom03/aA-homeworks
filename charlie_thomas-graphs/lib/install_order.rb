require_relative 'graph'
require_relative 'topological_sort'

# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# [package_id, dependency]

# N.B. this is how `npm` works.

# Import any files you need to



def install_order(arr)
  vertices = {}
  max = 0

  arr.each do |(package, dependency)|
    local_max = [package, dependency].max
    max = local_max if local_max > max
    vertices[package] = Vertex.new(package) unless vertices[package]
    vertices[dependency] = Vertex.new(dependency) unless vertices[dependency]
    Edge.new(vertices[dependency], vertices[package])
  end

  max.times do |i|
    vertices[i+1] = Vertex.new(i+1) unless vertices[i+1]
  end

  topological_sort(vertices.values).map { |vertex| vertex.value}
end
