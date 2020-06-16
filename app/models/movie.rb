class Movie < ApplicationRecord

  validates_presence_of :title, :summary, :genre
  validates :year,
            presence: true,
            inclusion: { in: 1900..Date.today.year },
            format: {
                with: /(19|20)\d{2}/i,
                message: "should be a four-digit year"
            }
  validates_format_of :imdb, :with => /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix, allow_blank: true

end
