class SlotMachine
  ITEMS = %w[cherry seven bell star joker].freeze
  # index      0     1      2   3    4

  def initialize(reels = [])
    @reels = reels
  end

  def score
    if @reels.uniq.size == 1
      # index + 1 and the * by 10
      # item_index = ITEMS.index(@reels[0])
      # item_number = item_index + 1
      # item_number * 10
      base_score(@reels[0]) * 10
    elsif @reels.uniq.size == 2 && @reels.include?('joker')
      # index + 1 and the * by 5
      base_score(@reels.sort[1]) * 5
      # item_index = ITEMS.index(@reels.sort[1])
      # item_number = item_index + 1
      # item_number * 5
    else
      0
    end
  end

  private

  def base_score(item)
    ITEMS.index(item) + 1
  end
end
