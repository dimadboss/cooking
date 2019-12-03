# frozen_string_literal: true

class AddTables < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :login, null: false, unique: true
      t.string :password, null: false
      t.string :email, null: false
      t.timestamps
    end

    create_table :recipes do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.timestamps
    end

    create_table :measures do |t|
      t.string :munit, null: false, unique: true
      t.decimal :capacity, null: false
      t.timestamps
    end

    create_table :products do |t|
      t.string :name, null: false, unique: true
      t.decimal :density
      t.timestamps
    end

    create_table :product_recipes do |t|
      t.integer :product_id, null: false
      t.integer :recipe_id, null: false
      t.decimal :quantity, null: false
      t.integer :measure_id, null: false
      t.timestamps
    end

    create_table :product_abouts do |t|
      t.integer :product_id, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
