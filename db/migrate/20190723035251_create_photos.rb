# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:photos) do
      primary_key :id
      String :image_data, text: true
      String :description, text: true
    end
  end

  down do
    drop_table(:photos)
  end
end
