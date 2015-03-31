class ApiError < StandardError

  ERR_UNKNOWN       = 200
  ERR_FORMAT        = 201
  ERR_AUTHORIZATION = 202
  ERR_USER_DISABLE  = 205
  ERR_API_DISABLE   = 209
  ERR_IP_DENIED     = 210
  ERR_THROTTLE      = 212

  def self.codes
    {
      ERR_UNKNOWN       => 'unknown error',
      ERR_FORMAT        => 'wrong format',
      ERR_AUTHORIZATION => 'error authorization',
      ERR_USER_DISABLE  => 'user disable',
      ERR_API_DISABLE   => 'api disable',
      ERR_IP_DENIED     => 'ip denied',
      ERR_THROTTLE      => 'overspeeding sending'
    }
  end
end