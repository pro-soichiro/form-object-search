class UsersSearchForm
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment

  ATTRIBUTES = %i(
    last_name
    first_name
    born_on_year
    born_on_month
    prefecture_id
  )

  attr_accessor *ATTRIBUTES

  def search
    results = User.eager_load(birthplace: :prefecture)
    results = results.where!('last_name LIKE ?', "%#{last_name}%" ) if last_name.present?
    results = results.where!('first_name LIKE ?', "%#{first_name}%" ) if first_name.present?
    results = results.where!("born_on LIKE ?", "#{born_on_year}-%" ) if born_on_year.present?
    results = results.where!("born_on LIKE ?", "%-#{format("%02d", born_on_month)}-%" ) if born_on_month.present?
    results = results.merge!(Birthplace.where(prefecture_id: prefecture_id)) if prefecture_id.present?
    results
  end

end