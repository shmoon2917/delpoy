class RemoveRealMentorIdToMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :real_mentor_id, :integer
  end
end
