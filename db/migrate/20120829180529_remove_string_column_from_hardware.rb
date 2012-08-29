class RemoveStringColumnFromHardware < ActiveRecord::Migration
  def change
    change_table(:hardwares) do |t|
      t.remove :string
    end
  end
end
