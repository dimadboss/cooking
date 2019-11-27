# frozen_string_literal: true

class AddTablesAndDependences < ActiveRecord::Migration[6.0]
  def change
    create_table :user do |t|
      t.string :login, null: false, unique: true
      t.string :password, null: false
      t.string :email, null: false
      t.timestamps
    end

    create_table :recipe do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.timestamps
    end

    create_table :measure do |t|
      t.string :munit, null: false, unique: true
      t.decimal :capacity, null: false
      t.timestamps
    end

    create_table :product do |t|
      t.string :name, null: false, unique: true
      t.decimal :density
      t.timestamps
    end

    create_table :product_recipe do |t|
      t.integer :product_id, null: false
      t.integer :recipe_id, null: false
      t.decimal :quantity, null: false
      t.integer :measure_id, null: false
      t.timestamps
    end

    create_table :product_about do |t|
      t.integer :product_id, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
