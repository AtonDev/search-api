class CreateUserTokens < ActiveRecord::Migration
  def change
    create_table :user_tokens do |t|
      t.string :token
      t.timestamps
    end
    add_index :user_tokens, :token
  end
end
