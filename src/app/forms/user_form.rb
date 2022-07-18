class UserForm
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment

  ATTRIBUTES = %i(
    last_name
    first_name
    born_on
    prefecture_id
    detail
  )

  attr_accessor *ATTRIBUTES

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :prefecture_id
  end

  # persisted?とto_modelはビューの表示（#form_with）に必要なメソッドです。
  # persisted?は作成・更新に応じてフォームのアクションをPOST・PATCHに切り替えてくれます。
  # またto_modelはアクションのURLを適切な場所（ここではusers_pathやuser_path(id)）に切り替えてくれます。
  delegate :persisted?, to: :user

  # superはActiveModel::Modelのinitializeを呼び出しており、
  # 書き込みメソッド（title=など）を用いて値を代入しています。
  # つまり、Formオブジェクトで用いる値は書き込みメソッドを定義する必要があります。
  # 更新にも対応する場合はdefault_attributesのように保存済みのレコードをもとに値を設定する必要があります。
  def initialize(attributes = nil, user: User.new)
    @user = user
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    return if invalid?

    ActiveRecord::Base.transaction do
      @user.update!(last_name: last_name, first_name: first_name, born_on: born_on)
      Birthplace.find_or_create_by!(user_id: @user.id, prefecture_id: prefecture_id, detail: detail)
    end

  rescue ActiveRecord::RecordInvalid
    false
  end

  # persisted?とto_modelはビューの表示（#form_with）に必要なメソッドです。
  # persisted?は作成・更新に応じてフォームのアクションをPOST・PATCHに切り替えてくれます。
  # またto_modelはアクションのURLを適切な場所（ここではusers_pathやuser_path(id)）に切り替えてくれます。
  def to_model
    user
  end

  private

    attr_reader :user

    # 更新にも対応する場合はdefault_attributesのように保存済みのレコードをもとに値を設定する必要があります。
    def default_attributes
      {
        last_name: user.last_name,
        first_name: user.first_name,
        born_on: user.born_on,
        prefecture_id: user.birthplace&.prefecture_id,
        detail: user.birthplace&.detail
      }
    end

end