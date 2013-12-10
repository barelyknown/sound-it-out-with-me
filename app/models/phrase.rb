class Phrase < ActiveRecord::Base
  extend FriendlyId
  friendly_id :words, use: :slugged

  validates :words, length: { minimum: 1 }

  def duplicate?
    !!duplicate
  end

  def duplicate
    Phrase.find_by(slug: words.parameterize)
  end

  def visualize
    words.split(/\s+/).collect do |word|
      hyphenate(word)
    end.join("&emsp;").html_safe
  end

  def hyphenate(word)
    hyphenator.visualize(word).gsub(/-/,"&ndash;")
  end

private

  def hyphenator
    Text::Hyphen.new(language: language, left: 1, right: 1 )
  end

end
