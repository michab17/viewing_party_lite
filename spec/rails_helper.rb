# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'webmock/rspec'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data('HIDE MY KEY') { ENV['movie_key'] }
  config.configure_rspec_metadata!
end

def basic_movie_data
  {:adult=>false,
 :backdrop_path=>"/5hNcsnMkwU2LknLoru73c76el3z.jpg",
 :genre_ids=>[35, 18, 10749],
 :id=>19404,
 :original_language=>"hi",
 :original_title=>"दिलवाले दुल्हनिया ले जायेंगे",
 :overview=>
  "Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.",
 :popularity=>25.039,
 :poster_path=>"/2CAL2433ZeIihfX1Hb2139CX0pW.jpg",
 :release_date=>"1995-10-20",
 :title=>"Dilwale Dulhania Le Jayenge",
 :video=>false,
 :vote_average=>8.7,
 :vote_count=>3259}
end

def actor_data
  {:adult=>false,
    :gender=>2,
    :id=>3894,
    :known_for_department=>"Acting",
    :name=>"Christian Bale",
    :original_name=>"Christian Bale",
    :popularity=>13.336,
    :profile_path=>"/qCpZn2e3dimwbryLnqxZuI88PTi.jpg",
    :cast_id=>35,
    :character=>"Bruce Wayne / Batman",
    :credit_id=>"52fe4220c3a36847f8005d17",
    :order=>0}
end

def movie_data
  {
    "adult": false,
    "backdrop_path": "/hkBaDkMWbLaf8B1lsWsKX7Ew3Xq.jpg",
    "belongs_to_collection": {
        "id": 263,
        "name": "The Dark Knight Collection",
        "poster_path": "/l4T8JVwircGZlZuSl29U3TS9mpl.jpg",
        "backdrop_path": "/xfKot7lqaiW4XpL5TtDlVBA9ei9.jpg"
    },
    "budget": 185000000,
    "genres": [
        {
            "id": 18,
            "name": "Drama"
        },
        {
            "id": 28,
            "name": "Action"
        },
        {
            "id": 80,
            "name": "Crime"
        },
        {
            "id": 53,
            "name": "Thriller"
        }
    ],
    "homepage": "https://www.warnerbros.com/movies/dark-knight/",
    "id": 155,
    "imdb_id": "tt0468569",
    "original_language": "en",
    "original_title": "The Dark Knight",
    "overview": "Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.",
    "popularity": 59.634,
    "poster_path": "/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
    "production_companies": [
        {
            "id": 429,
            "logo_path": "/2Tc1P3Ac8M479naPp1kYT3izLS5.png",
            "name": "DC Comics",
            "origin_country": "US"
        },
        {
            "id": 923,
            "logo_path": "/5UQsZrfbfG2dYJbx8DxfoTr2Bvu.png",
            "name": "Legendary Pictures",
            "origin_country": "US"
        },
        {
            "id": 9996,
            "logo_path": "/3tvBqYsBhxWeHlu62SIJ1el93O7.png",
            "name": "Syncopy",
            "origin_country": "GB"
        },
        {
            "id": 118865,
            "name": "Isobel Griffiths",
            "origin_country": "GB"
        },
        {
            "id": 9993,
            "logo_path": "/2Tc1P3Ac8M479naPp1kYT3izLS5.png",
            "name": "DC Entertainment",
            "origin_country": "US"
        },
        {
            "id": 174,
            "logo_path": "/IuAlhI9eVC9Z8UQWOIDdWRKSEJ.png",
            "name": "Warner Bros. Pictures",
            "origin_country": "US"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "GB",
            "name": "United Kingdom"
        },
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
    ],
    "release_date": "2008-07-14",
    "revenue": 1004558444,
    "runtime": 152,
    "spoken_languages": [
        {
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
        },
        {
            "english_name": "Mandarin",
            "iso_639_1": "zh",
            "name": "普通话"
        }
    ],
    "status": "Released",
    "tagline": "Why So Serious?",
    "title": "The Dark Knight",
    "video": false,
    "vote_average": 8.5,
    "vote_count": 26291
  }
end

def review_data
  {
    "author": "tricksy",
    "author_details": {
        "name": "",
        "username": "tricksy",
    },
    "content": "Excellent movie. Best of the trilogy. Lovely music. Nolan is a genius. So is Heath Ledger.",
    "created_at": "2015-06-09T07:21:30.464Z",
    "id": "557693fac3a368569a003fab",
    "updated_at": "2021-06-23T15:57:35.053Z",
    "url": "https://www.themoviedb.org/review/557693fac3a368569a003fab"
}
end