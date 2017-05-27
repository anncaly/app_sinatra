namespace '/api/v1' do

  require 'json'

  # get 'http://localhost:4567/companies?name=Mo
  # http://localhost:4567/api/v1/company/1
  get '/company/:id' do
    puts "id = #{params[:id]}"
    company = Company.where(id: params[:id].to_i)
    puts "company.to_a = #{company.to_a}"
    puts "company.to_a[0].values.to_json = #{company.to_a[0].values.to_json}"
    company.to_a[0].values.to_json
  end

  # извлечь все вакансии одной компании - 2 модели
  # на выходе JSON - коллекция
  # параметр - regexp
  # найти компанию по имени - id
  # по id обращ в модель jobs

  get '/company_jobs' do
    Company.company_jobs(params[:name])
    # obj = Company.find(4)
  end
end

