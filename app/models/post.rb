class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: {minimum: 10}
    validates :summary, length: {maximum: 10}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :is_clickbait?

    CLICKBAIT = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
    ]

  def is_clickbait?
    if CLICKBAIT.none? { |pattern| pattern.match title }
      errors.add(:title, "This is clickbait")
    end
  end

end
