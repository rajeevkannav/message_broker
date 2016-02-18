class CreateMessageBrokerRules < ActiveRecord::Migration
  def change
    create_table :message_broker_rules do |t|
      t.string :target
      t.string :event
      t.belongs_to :activity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
