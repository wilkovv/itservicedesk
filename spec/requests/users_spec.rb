require 'swagger_helper'

RSpec.describe 'users', type: :request do
    path '/users/sign_in' do
        get('login') do
        response(200, 'successful') do
    
            after do |example|
            example.metadata[:response][:content] = {
                'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
                }
            }
            end
            run_test!
        end
        end
        post('login') do
        consumes 'application/json'
        produces 'application/json'
        response(201, 'successful') do      
            parameter name: :user, in: :body, schema: {          
            type: :object,          
            properties: {            
            user: {
                type: :object,
                properties: {
                    email: { type: :string },            
                    password: { type: :string }  
                }
            }
        
            },          
            required: %w[email password]  
            }
            after do |example|
            example.metadata[:response][:content] = {
                'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
                }
            }
            end
            run_test!
        end
        end
    end
end
