class UserSubscriber
  include Cloudenvoy::Subscriber

  cloudenvoy_options topic: 'users'

  def process(message)
    puts "About to update user in sub app! #{message}"
    payload = message.payload
    action = message.metadata.dig('action')

    # Handle delete
    if action == 'delete'
      user = User.find_by(id: payload['id'])
      user&.destroy
      return user
    end

    # Handle upsert
    user = User.create_or_find_by(id: payload['id']) do |u|
      u.first_name = payload['first_name']
      u.communication_preference = payload['communication_preference']
    end

    # Update user if it exists already
    user.update(
      first_name: payload['first_name'],
      communication_preference: payload['communication_preference']
    )

    return user
  end
end
