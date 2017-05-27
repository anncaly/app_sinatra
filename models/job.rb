class Job < Sequel::Model
  many_to_one :company

  def self.company_jobs(company_id)
    where(company_id: company_id)
  end

  def to_api
    {
        id: id,
        name: name,
        company_id: company_id,
        place: place,
    }
  end
end