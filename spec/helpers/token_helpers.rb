module TokenHelpers
  def valid_token
    { 'config' => { 'client_token' => { 'access_token' => 'fas4f68sef486sef4',
                                        'refresh_token' => '',
                                        'expires_at' => (Time.now.to_i + 1000),
                                        'token_type' => 'bearer',
                                        'scope' => 'cvut:kosapi:read' } } }
  end

  def invalid_token
    { 'config' => { 'client_token' => { 'access_token' => 'fas4f68sef486sef4',
                                        'refresh_token' => '',
                                        'expires_at' => (Time.now.to_i - 1000),
                                        'token_type' => 'bearer',
                                        'scope' => 'cvut:kosapi:read' } } }
  end
end
