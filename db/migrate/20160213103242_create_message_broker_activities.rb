class CreateMessageBrokerActivities < ActiveRecord::Migration
  def change
    create_table :message_broker_activities do |t|
      t.string :name
      t.text :to
      t.string :from
      t.text :cc
      t.text :bcc
      t.string :subject
      t.text :template

      t.timestamps null: false
    end
  end
end
