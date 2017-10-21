class RemoveNoteFromDiary < ActiveRecord::Migration[5.1]
  def change
    remove_column :diaries, :note, :string
  end
end
