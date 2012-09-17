module Annoyance
  class Meter
    attr_accessor :limit

    def initialize(limit)
      raise ArgumentError unless limit.is_a? Integer
      @limit = limit
    end

    def annoyance_level(repetition_count)
      raise ArgumentError unless limit.is_a? Integer
      return "" if repetition_count <= 0

      repetition_count -= 1

      index = repetition_count * Annoyance.levels.count/limit.to_f
      index_to_access = [index, Annoyance.levels.count - 1].min

      annoyance_level = Annoyance.levels[index_to_access]
      annoyance_level + what_to_duplicate(repetition_count, annoyance_level) * emphasis(repetition_count, index)
    end

    def annoyance_adjusted(text, repetition_count)
      if repetition_count < limit
        text + annoyance_level(repetition_count)
      else
        annoyance_level(repetition_count)
      end
    end

    private

    def emphasis(repetition_count, index)
      if repetition_count < limit
        if index - index.to_i != 0
          (1/(index - index.to_i)).ceil - 1
        else
          0
        end
      else
        repetition_count - limit + 1
      end
    end

    def what_to_duplicate(repetition_count, annoyance_level)
      repetition_count < limit ? annoyance_level[-1] : annoyance_level
    end
  end
end
