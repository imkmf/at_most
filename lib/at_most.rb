require "at_most/version"
require "active_record/base"

def downcase_and_pluralize(input)
  return "#{ input.to_s.downcase }s"
end

def validation_error(model, message)
  message || i18n_error(model) || "The maximum number of #{ downcase_and_pluralize(model.class) } has been reached."
end

def i18n_error(model)
  if !I18n.t("activerecord.errors.models.#{ downcase_and_pluralize(model.class) }.at_most").include?("missing")
    I18n.t("activerecord.errors.models.#{ downcase_and_pluralize(model.class) }.at_most")
  elsif !I18n.t("at_most").include?("missing")
    I18n.t("at_most")
  end
end


class ActiveRecord::Base
  class << self
    def at_most(limiter, options = {})
      validate do |model|
        @all = self.class.all
        @count = @all.is_a?(ActiveRecord::Relation) ? @all.size : @all.count
        if @count >= limiter
          model.errors.add :base, validation_error(model, options[:message])
        end
      end
    end
  end
end
