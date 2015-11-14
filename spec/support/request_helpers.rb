module RequestHelpers
  def json
    @json ||= JSON.parse(response.body)
  end

  def errors_helper(messages)
    if messages.is_a?(Hash)
      { errors: messages }
    else
      { errors: [*messages] }
    end.with_indifferent_access
  end

  def get_resource(url, options = {})
    get url, options
  end
end
