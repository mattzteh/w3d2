
class Card

    attr_reader :face_value, :face_down

    def self.create_card
        cards = (1..100).to_a
        Card.new(cards.sample)
    end

    def initialize(face_value)
        @face_value = face_value
        @face_down = true
    end

    def hide
        @face_down = true
    end

    def revealed
        @face_down = false
    end

    def ==(other_card)
        return self.face_value == other_card.face_value
    end

end

