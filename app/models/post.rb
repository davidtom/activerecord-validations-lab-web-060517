class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :title_must_be_click_bait

  private

  def title_must_be_click_bait
    if !title.nil?
      if !title.downcase.scan(/won't believe|secret|top \d+|guess/).any?
        errors.add(:title, "Title must be clickbaity")
      end
    end
  end
end
