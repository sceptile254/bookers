class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title #string型のtitleカラムを作成
      t.string :body #string型のbodyカラムを作成

      t.timestamps
    end
  end
end
