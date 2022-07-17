class UserForm
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment

  attr_accessor :last_name, :first_name, :born_on, :prefecture_id, :detail

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :prefecture_id
  end

  def initialize(params = {})
    super(params)
  end


  def save
    return if invalid?

    ActiveRecord::Base.transaction do
      user = User.create(last_name: last_name, first_name: first_name, born_on: born_on)
      Birthplace.create(prefecture_id: prefecture_id, detail: detail, user_id: user.id)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  def self.find(user_id)
    @user = User.find(user_id)
    @user = Birthplace.find_by_user_id(user_id)
  end

end