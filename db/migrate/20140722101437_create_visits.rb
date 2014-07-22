class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.locations_id :integer
      t.user_name :string
      t.from_date :datetime
      t.to_date :datetime
      t.timestamps
    end
  end
end
