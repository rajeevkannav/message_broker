class CreateMessageBrokerActivities < ActiveRecord::Migration
  def change
    create_table :message_broker_activities do |t|
      t.string :name
      t.text :template_text

      t.timestamps null: false
    end
  end
end
