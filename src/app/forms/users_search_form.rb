class UsersSearchForm
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment

  ATTRIBUTES = %i(
    last_name
    first_name
    start_born_on
    end_born_on
    prefecture_id
  )

  attr_accessor *ATTRIBUTES

  def search
    results = User.eager_load(birthplace: :prefecture)
    filter_by_last_name(results)
    filter_by_first_name(results)
    filter_by_start_born_on(results)
    filter_by_end_born_on(results)
    filter_by_prefecture_id(results)
    results
  end


  private

    def filter_by_last_name(results)
      return results if last_name.blank?

      results.where!('last_name LIKE ?', "%#{last_name}%" )
    end

    def filter_by_first_name(results)
      return results if first_name.blank?

      results.where!('first_name LIKE ?', "%#{first_name}%" )
    end

    def filter_by_start_born_on(results)
      return results if start_born_on.blank?

      results.where!(born_on: start_born_on.. )
    end

    def filter_by_end_born_on(results)
      return results if end_born_on.blank?

      results.where!(born_on: ..end_born_on )
    end

    def filter_by_prefecture_id(results)
      return results if prefecture_id.blank?

      results.merge!(Birthplace.where(prefecture_id: prefecture_id))
    end

end