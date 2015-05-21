# require 'rails_helper'
#
# RSpec.describe Item, type: :model do
#   let(:item){
#     Item.new(title: "Food",
#              description: "Good",
#              price: 900)
#   }
#
#   context 'with valid params' do
#     it 'is valid' do
#       expect(item).to be_valid
#     end
#
#     it 'has one or more categories' do
#       expect(item.categories).to eq([])
#     end
#
#     it 'has a default value for image and retired' do
#       expect(item.retired).to eq(false)
#       expect(item.image).to eq("https://browshot.com/static/images/not-found.png")
#     end
#   end
#
#   context 'with invalid params' do
#     it 'is invalid without a title' do
#       item.title = ""
#       expect(item).to_not be_valid
#     end
#
#     it 'is invalid without a unique title' do
#       item.save
#       new_item =   Item.create(title: "Food",
#                    description: "Good",
#                    price: 900)
#       expect(new_item).to_not be_valid
#     end
#
#
#     it 'is invalid without a description' do
#       item.description = ""
#       expect(item).to_not be_valid
#     end
#
#     it 'is invalid without a price' do
#       item.price = ""
#       expect(item).to_not be_valid
#       item.price = -10
#       expect(item).to_not be_valid
#       item.price = 0
#       expect(item).to_not be_valid
#     end
#   end
# end
