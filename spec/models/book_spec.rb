require 'rails_helper'

describe Book do
  it do
    is_expected.to validate_presence_of(:author)
  end
  it do
    is_expected.to validate_presence_of(:genre)
  end
  it do
    is_expected.to validate_presence_of(:image)
  end
  it do
    is_expected.to validate_presence_of(:title)
  end
  it do
    is_expected.to validate_presence_of(:publisher)
  end
  it do
    is_expected.to validate_presence_of(:year)
  end

  subject(:Book) do
    described_class.new(
      author: author, genre: genre, title: title, publisher: publisher,
      year: year, image: imagen
    )
  end

  let(:title)            { Faker::Book.title }
  let(:author)           { Faker::Book.author }
  let(:publisher)        { Faker::Book.publisher }
  let(:genre)            { Faker::Book.genre }
  let(:year)             { Faker::Date.between(100.years.ago, Time.zone.today).year }
  let(:imagen)           { "#{title}.jpg" }

  it do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'When the title is nil' do
      let(:title) { nil }

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the author is nil' do
      let(:author) { nil }

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the genre is nil' do
      let(:genre) { nil }

      it do
        is_expected.to be_invalid
      end
    end
  end
end
