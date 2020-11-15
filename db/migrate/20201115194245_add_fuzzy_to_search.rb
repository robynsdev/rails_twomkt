class AddFuzzyToSearch < ActiveRecord::Migration[6.0]
  def change
    enable_extension "fuzzystrmatch"
    enable_extension "pg_trgm"
  end
end
