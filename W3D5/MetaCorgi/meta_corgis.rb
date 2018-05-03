require 'byebug'

class SnackBox
  SNACK_BOX_DATA = {
    1 => {
      "bone" => {
        "info" => "Phoenician rawhide",
        "tastiness" => 20
      },
      "kibble" => {
        "info" => "Delicately braised hamhocks",
        "tastiness" => 33
      },
      "treat" => {
        "info" => "Chewy dental sticks",
        "tastiness" => 40
      }
    },
    2 => {
      "bone" => {
        "info" => "An old dirty bone",
        "tastiness" => 2
      },
      "kibble" => {
        "info" => "Kale clusters",
        "tastiness" => 1
      },
      "treat" => {
        "info" => "Bacon",
        "tastiness" => 80
      }
    },
    3 => {
      "bone" => {
        "info" => "A steak bone",
        "tastiness" => 64
      },
      "kibble" => {
        "info" => "Sweet Potato nibbles",
        "tastiness" => 45
      },
      "treat" => {
        "info" => "Chicken bits",
        "tastiness" => 75
      }
    }
  }
  def initialize(data = SNACK_BOX_DATA)
    @data = data
  end

  def get_bone_info(box_id)
    @data[box_id]["bone"]["info"]
  end

  def get_bone_tastiness(box_id)
    @data[box_id]["bone"]["tastiness"]
  end

  def get_kibble_info(box_id)
    @data[box_id]["kibble"]["info"]
  end

  def get_kibble_tastiness(box_id)
    @data[box_id]["kibble"]["tastiness"]
  end

  def get_treat_info(box_id)
    @data[box_id]["treat"]["info"]
  end

  def get_treat_tastiness(box_id)
    @data[box_id]["treat"]["tastiness"]
  end
end

class CorgiSnacks

  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  def bone
    info = @snack_box.get_bone_info(@box_id)
    tastiness = @snack_box.get_bone_tastiness(@box_id)
    result = "Bone: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def kibble
    info = @snack_box.get_kibble_info(@box_id)
    tastiness = @snack_box.get_kibble_tastiness(@box_id)
    result = "Kibble: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def treat
    info = @snack_box.get_treat_info(@box_id)
    tastiness = @snack_box.get_treat_tastiness(@box_id)
    result = "Treat: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

end


class MetaCorgiSnacks
  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  # def method_missing(name, *args)
  #   allowed_methods = ['bone', 'kibble', 'treat']
  #
  #   if allowed_methods.include?(name.to_s)
  #     info_method = "get_#{name}_info".to_sym
  #     tasty_method = "get_#{name}_tastiness".to_sym
  #
  #     info = @snack_box.send(info_method, @box_id)
  #     tastiness = @snack_box.send(tasty_method, @box_id)
  #
  #     result = "Treat: #{info}: #{tastiness} "
  #     tastiness > 30 ? "* #{result}" : result
  #
  #   else
  #     super
  #   end
  # end


  def self.define_snack(name)

  end
end

if __FILE__ == $PROGRAM_NAME
  snack = SnackBox.new
  corgi1 = CorgiSnacks.new(snack, 1)
  corgi2 = CorgiSnacks.new(snack, 2)
  corgi3 = CorgiSnacks.new(snack, 3)

  # p corgi1.bone
  # p corgi1.kibble
  # p corgi1.treat
  # p corgi2.bone
  # p corgi2.kibble
  # p corgi2.treat
  # p corgi3.bone
  # p corgi3.kibble
  # p corgi3.treat

  meta = MetaCorgiSnacks.new(snack, 1)
  meta.bone
  meta.kibble
  meta.treat

end
