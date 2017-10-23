class AddCommunityidToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :community_id, :integer
  end
end
