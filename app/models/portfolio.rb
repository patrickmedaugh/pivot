class Portfolio

  attr_reader :contents

  def initialize(initial_contents)
    @contents =  initial_contents || Hash.new()
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def subtract_item(item_id)
    contents[item_id.to_s] -= 1
    if contents[item_id.to_s] < 1
      contents[item_id.to_s] = 1
    end
  end

  def quantity(item_id)
    contents[item_id]
  end

  def remove_item(item_id)
    contents.delete(item_id)
  end

end
